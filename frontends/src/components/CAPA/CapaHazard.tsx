
import axios from 'axios';
import React, { useEffect, useState } from 'react'
import { dateFormater } from '../utils/DateFormater';
import BaseUrl from '../utils/api_provider/ApiProviders';

export default function CapaHazard({hazardid,hadazardTitle}:any) {

    console.log('DZID',hazardid)

    const[capa,setCapa]= useState([])

      const fetchCapa = async () => {
        try {
            const response = await axios.get(`${BaseUrl}/capa/get-by-hazardid/${hazardid}`)
console.log('CAPA',response.data)
            setCapa(response.data);
            
        } catch (error) {
            console.log(error);
        }
    };

    useEffect(() => {
        fetchCapa();
    }, [hazardid]);

    // update capa as approved
    const approveHandle = async (capaId: string) => {
        try {
            await axios.patch(`${BaseUrl}/capa/isapproved/${capaId}`);
            await fetchCapa();
        } catch (error) {
            console.error("Failed to approve CAPA:", error);
        }
    };


  return (
    <div>
        <div className="card mb-4 border-0 shadow-sm">
          <div className="card-header bg-danger text-white fw-bold d-flex justify-content-between align-items-center">
            <span>CAPA Actions (Corrective & Preventive)</span>
            <button type="button" className="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
              Assign <i className="fa fa-arrow-right"></i>
            </button>
          </div>


          <div className="card-body">
            <div className="table-responsive">
              <table className="table table-striped align-middle mb-0">
                <thead className="table-danger">
                  <tr>
                    <th>Action Title</th>
                    {/* <th>dueDate</th> */}
                    <th>Assigned To</th>
                    <th>Status</th>
                    <th>Due Date</th>
                    <th>Action</th>
                    <th>Created</th>
                  </tr>
                </thead>

                <tbody>
                  {capa.length > 0 ? (
                    capa.map((item, index) => {
                      const dateformated = dateFormater(item.createdAt)
                      const dateformateDue = dateFormater(item.dueDate)
                      return (
                        <tr key={item._id ?? index}>
                          <td>{item.actionTitle}</td>
                          <td>{item.assignedTo?.fullName || 'Unassigned'}</td>
                          <td>
                            <span className="badge bg-warning text-dark">
                              {item.status}
                            </span>
                          </td>
                          <td>{dateformateDue}</td>
                          <td className="text-center">
                            {item.isApproved? 
                            <span onClick={() => approveHandle(item.capaId)} className="badge btn btn-back-home bg-success text-white ms-3 py-2 px-4">
                              Approved
                            </span>
                            :
                            <span onClick={() => approveHandle(item.capaId)} className="badge btn btn bg-success text-white ms-3 py-2 px-4">
                              Approve
                            </span>
                            }
                          </td>
                          <td>{dateformated}</td>
                        </tr>
                      )
                    })
                  ) : (
                    <tr>
                      <td colSpan={5} className="text-center text-danger py-4">
                        No Actions Created
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </div>
        </div>
    </div>
  )
}
