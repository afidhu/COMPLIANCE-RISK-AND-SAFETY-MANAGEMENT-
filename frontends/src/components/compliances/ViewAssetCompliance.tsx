

import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link, useLocation, useParams } from "react-router-dom";

export default function ViewAssetCompliance() {

  const { assetId } = useParams();
  const { state } = useLocation();
  console.log('state', state, 'id', assetId)

  // Destructure the name from the state object safely
  const { assetName } = state || {};

  const [assetsCompliance, setAssetsCompliance] = useState([])

  const fetchAssetsCompliance = async () => {
    try {
      const response = await axios.get(`http://localhost:51213/compliance/get-by-assetid/${assetId}`)

      // console.log(response.data);
      setAssetsCompliance(response.data);
      console.log('assetsCompliance,', assetsCompliance)
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => {
    fetchAssetsCompliance();
  }, []);


  return (
    <div className="container">
      <div className="page-inner">

        {/* Asset Header */}
        <div className="card shadow-sm border-0 mb-4">

          <div className="card-body">

            <div className="d-flex justify-content-between align-items-center">

              <div>
                <h2 className="fw-bold text-primary mb-1">
                  Asset: {assetName}
                </h2>

                <p className="text-muted mb-0">
                  Location:{state.location} • {/*{state.assetType}*/}
                </p>
              </div>

              <div>
                <span className="badge bg-success fs-6 px-3 py-2">
                  Operational
                </span>
              </div>

            </div>

          </div>

        </div>

        {/* Compliance Statistics */}
        <div className="row mb-4">

          <div className="col-md-4">
            <div className="card card-stats shadow-sm border-0">
              <div className="card-body">
                <h5 className="text-muted">
                  Total Compliance Checks
                </h5>

                <h2 className="fw-bold text-primary">
                  {assetsCompliance.length}
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-4">
            <div className="card card-stats shadow-sm border-0">
              <div className="card-body">
                <h5 className="text-muted">
                  Compliant
                </h5>

                <h2 className="fw-bold text-success">
                  9
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-4">
            <div className="card card-stats shadow-sm border-0">
              <div className="card-body">
                <h5 className="text-muted">
                  Due Soon
                </h5>

                <h2 className="fw-bold text-warning">
                  3
                </h2>
              </div>
            </div>
          </div>

        </div>

        {/* Compliance Table */}
        <div className="card shadow-sm border-0">

          <div className="card-header d-flex justify-content-between">

            <h4 className="card-title">
              Compliance Register
            </h4>

            <Link to={'/AddAssetCompliance'}
              className="btn btn-primary"
            >
              <i className="fas fa-plus me-2"></i>
              Add Compliance
            </Link>

          </div>

          <div className="card-body">

            <div className="table-responsive">

              <table className="table table-hover align-middle">

                <thead className="table-primary">

                  <tr>
                    <th>Compliance</th>
                    <th>Frequency</th>
                    <th>Last Inspection</th>
                    <th>Next Due Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>
                </thead>

                <tbody>

                  {
                    assetsCompliance.length > 0 ?
                      assetsCompliance.map((item,index)=>{
                        return <>
                        <tr>
                          <td> {item.complianceName} </td>
                          <td> {item.frequency} </td>
                          <td> {item.lastDueDate} </td>
                          <td> {item.dueDate} </td>

                          <td>
                            <span className="badge bg-success">
                              {item.status}
                            </span>
                          </td>

                          <td>
                            <button className="btn btn-link btn-primary">
                              <i className="fa fa-eye"></i>
                            </button>

                            <button className="btn btn-link btn-warning">
                              <i className="fa fa-pen"></i>
                            </button>
                          </td>
                        </tr>
                      </>
                      })


                      : <><tr><td><h6 className="text-danger" >No Assets Compliance</h6></td></tr></>
                  }

                </tbody>

              </table>

            </div>

          </div>

        </div>

      </div>
    </div>
  );
}