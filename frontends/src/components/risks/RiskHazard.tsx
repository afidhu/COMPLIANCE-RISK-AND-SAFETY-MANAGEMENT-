

import axios from 'axios';
import React, { useEffect, useState } from 'react'
import BaseUrl from '../utils/api_provider/ApiProviders';

export default function RiskHazard({hadazardId}) {

    console.log('hadazardId:',hadazardId)
    const [risks, setRisks] = useState([])
    const fetchHazardRisks = async () => {
        try {
            const response = await axios.get(`${BaseUrl}/risks/get-by-hazard/${hadazardId}`)

            setRisks(response.data);
            
        } catch (error) {
            console.log(error);
        }
    };

    useEffect(() => {
        fetchHazardRisks();
    }, []);

 
    return (
        <div>
            <div className="card mb-4 border-0 shadow-sm">
                <div className="card-header bg-primary text-white fw-bold">
                    Risks
                    <button type={'button'} style={{ float: 'right' }} className="btn btn-primary mb0" data-bs-toggle="modal" data-bs-target="#riskmodel">
                        <i className="fa fa-plus" ></i>Add Risk
                    </button>
                </div>

                <div className="card-body">
                    <table className="table table-striped align-middle">
                        <thead className="table-primary">
                            <tr>
                                <th>Risk Title</th>
                                <th>Likelihood</th>
                                <th>Severity</th>
                                <th>Description</th>
                                <th>Status</th>
                            </tr>
                        </thead>

                        <tbody>
                            {
                                risks.length > 0 ?
                                    risks.map((item, index) => {
                                        return <>
                                            <tr>
                                                <td>{item.riskTitle}</td>
                                                <td>
                                                    <span className="badge bg-warning text-dark">
                                                        {item.severity}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span className="badge bg-danger">{item.likelihood}</span>
                                                </td>
                                                <td>


                                                    <p className="d-inline-flex gap-1">

                                                        <button className="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target={`#${item.riskId}`} aria-expanded="false" aria-controls="collapseExample">
                                                            <small>read</small>
                                                        </button>
                                                    </p>
                                                    <div className="collapse" id={`${item.riskId}`}>
                                                        <div className="card card-body">
                                                            {item.riskDescription}
                                                        </div>
                                                    </div>

                                                </td>
                                                <td>
                                                    {item.status}
                                                </td>
                                            </tr>
                                        </>
                                    })
                                    :
                                    <><tr><td><h5 className='text-danger' >No risk yet</h5></td></tr></>
                            }

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    )
}
