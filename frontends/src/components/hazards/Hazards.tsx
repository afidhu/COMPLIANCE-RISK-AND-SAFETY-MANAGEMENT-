
import React from "react";
import { Link } from "react-router-dom";

export default function Hazards() {
  return (
    <div className="container-fluid px-3">
      <div className="page-inner">

        {/* HEADER */}
        <div className="page-header">
          <h3 className="fw-bold mb-3">Hazards Management</h3>

          <ul className="breadcrumbs mb-3">
            <li className="nav-home">
              <a href="#">
                <i className="icon-home"></i>
              </a>
            </li>

            <li className="separator">
              <i className="icon-arrow-right"></i>
            </li>

            <li className="nav-item">
              <a href="#">Safety</a>
            </li>

            <li className="separator">
              <i className="icon-arrow-right"></i>
            </li>

            <li className="nav-item">
              <a href="#">Hazards</a>
            </li>
          </ul>
        </div>

        {/* CARD */}
        <div className="card shadow-sm border-0">

          {/* CARD HEADER */}
          <div className="card-header d-flex justify-content-between align-items-center">
            <h4 className="card-title mb-0">Hazard Register</h4>

            <Link to={'/AddHazard'}
              className="btn text-white"
              style={{ background: "#1e66ff" }}
            >
              <i className="fa fa-plus me-2"></i>
              Report Hazard
            </Link>
          </div>

          {/* TABLE */}
          <div className="card-body">
            <div className="table-responsive">

              <table className="table table-striped table-hover align-middle">
                
                <thead style={{ background: "#1e66ff", color: "white" }}>
                  <tr>
                    <th>Asset ID</th>
                 
                    <th>Hazard Title</th>
                    <th>Description</th>
                    <th>Reported By</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>
                </thead>

                <tbody>

                  {/* ROW 1 */}
                  <tr>
                    <td>AST-001</td>
                    <td>Lift Door Failure</td>
                    <td>Lift door not closing properly causing safety risk</td>
                    <td>System</td>
                    <td>
                      <span className="badge bg-danger">Critical</span>
                    </td>
                    <td>

                      <Link to={'/Hazard/1'}>
                      <button className="btn btn-link text-primary">
                        <i className="fa fa-eye"></i>
                      </button>
                      </Link>
                    

                      <button className="btn btn-link text-warning">
                        <i className="fa fa-pen"></i>
                      </button>
                     
                    </td>
                  </tr>

                  
                </tbody>

              </table>

            </div>
          </div>

        </div>
      </div>
    </div>
  );
}