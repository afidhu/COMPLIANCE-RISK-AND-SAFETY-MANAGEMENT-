
import axios from 'axios';
import React, { useEffect, useState } from 'react'

export default function CapaHazard({hazardid,hadazardTitle}:any) {

    console.log('DZID',hazardid)

    const[capa,setCapa]= useState([])

      const fetchCapa = async () => {
        try {
            const response = await axios.get(`http://localhost:51213/capa/get-by-hazardid/${hazardid}`)
console.log('CAPA',response.data)
            setCapa(response.data);
            
        } catch (error) {
            console.log(error);
        }
    };

    useEffect(() => {
        fetchCapa();
    }, []);

  return (
    <div>
        <div className="card mb-4 border-0 shadow-sm">
          <div className="card-header bg-danger text-white fw-bold">
            CAPA Actions (Corrective & Preventive)
            {/* <!-- Button trigger modal --> */}
            <button type={'button'} style={{ float: 'right' }} className="btn btn-primary mb0" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
              Assign <i className="fa fa-arrow-right" ></i>
            </button>
          </div>


          <div className="card-body">
            <table className="table table-striped align-middle">
              <thead className="table-danger">
                <tr>
                  <th>Action Title</th>
                  {/* <th>dueDate</th> */}
                  <th>Assigned To</th>
                   <th>Status</th>
                  <th>Due Date</th>
                  <th>Created</th>
                </tr>
              </thead>

              <tbody>
                
            {
                capa.length>0?
                capa.map((item,index)=>{
                    return <>
                    <tr>
                  <td>  {item.actionTitle} </td>
                
                  <td>  {item.assignedTo.fullName} </td>
                  <td>
                    <span className="badge bg-warning text-dark">
                       {item.status}
                    </span>
                  </td>

                    <td>
                    <span className="badge bg-danger">
                        {item.dueDate} 
                    </span>
                  </td>
                   <td> {item.createdAt} 2026-06-25</td>
                </tr></>
                })
                 :
                <><tr><td><h1 className='text-danger' >No Capa </h1></td></tr></>
            }

                
              </tbody>
            </table>
          </div>
        </div>
    </div>
  )
}
