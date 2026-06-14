import React from "react";
import { Link } from "react-router-dom";

export default function Incidents() {
  return (
    <div className="container">
      <div className="table-responsive">

     <div
  className="card-header mb-4 d-flex justify-content-between align-items-center flex-wrap gap-3"
  style={{
    background: "linear-gradient(135deg, #1e66ff, #0047cc)",
    color: "#fff",
    borderRadius: "12px",
    padding: "18px 25px",
  }}
>
  {/* Left Side */}
  <div>
    <h3 className="mb-1 fw-bold">
      <i className="fas fa-triangle-exclamation me-2"></i>
      All Incidents
    </h3>

    <small>
      Track reported incidents, severity levels, and resolution status.
    </small>
  </div>

  {/* Right Side Button */}
  <Link
    to="/AddIncident"
    className="btn fw-semibold"
    style={{
      backgroundColor: "#ffffff",
      color: "#1e66ff",
      borderRadius: "10px",
      padding: "10px 18px",
      border: "none",
      boxShadow: "0 4px 12px rgba(0,0,0,0.15)",
    }}
  >
    <i className="fa fa-plus me-2"></i>
    Add Incident
  </Link>
</div>

        <table
          id="incident-datatables"
          className="display table table-striped table-hover align-middle"
        >
          <thead
            style={{
              backgroundColor: "#1e66ff",
              color: "#fff",
            }}
          >
            <tr>
              <th>Incident ID</th>
              <th>Asset ID</th>
              <th>Risk ID</th>
              <th>Incident Title</th>
              <th>Reported Date</th>
              <th>Severity</th>
              <th>Reported By</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>

          <tfoot className="table-light">
            <tr>
              <th>Incident ID</th>
              <th>Asset ID</th>
              <th>Risk ID</th>
              <th>Incident Title</th>
              <th>Reported Date</th>
              <th>Severity</th>
              <th>Reported By</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </tfoot>

          <tbody>

            <tr>
              <td>INC-001</td>
              <td>AST-001</td>
              <td>RSK-001</td>
              <td>Lift Sudden Shutdown</td>
              <td>2026-06-15</td>

              <td>
                <span className="badge bg-danger">
                  Critical
                </span>
              </td>

              <td>John Inspector</td>

              <td>
                <span className="badge bg-warning text-dark">
                  Under Investigation
                </span>
              </td>

              <td>
                <div className="form-button-action">

                  <Link to={'/ViewIncident/1'}>
                  
                  <button
                    type="button"
                    className="btn btn-link btn-primary btn-lg"
                    title="View Incident"
                  >
                    <i className="fa fa-eye"></i>
                  </button>

                  </Link>

                  <button
                    type="button"
                    className="btn btn-link btn-danger btn-lg"
                    title="Delete Incident"
                  >
                    <i className="fa fa-trash"></i>
                  </button>

                </div>
              </td>
            </tr>

            <tr>
              <td>INC-002</td>
              <td>AST-002</td>
              <td>RSK-002</td>
              <td>Fire Extinguisher Failure</td>
              <td>2026-06-14</td>

              <td>
                <span className="badge bg-danger">
                  High
                </span>
              </td>

              <td>Ali Hassan</td>

              <td>
                <span className="badge bg-success">
                  Closed
                </span>
              </td>

              <td>
                <div className="form-button-action">

                  <button
                    className="btn btn-link btn-primary btn-lg"
                  >
                    <i className="fa fa-eye"></i>
                  </button>

                  <button
                    className="btn btn-link btn-danger btn-lg"
                  >
                    <i className="fa fa-trash"></i>
                  </button>

                </div>
              </td>
            </tr>

            <tr>
              <td>INC-003</td>
              <td>AST-004</td>
              <td>RSK-003</td>
              <td>Generator Oil Leakage</td>
              <td>2026-06-12</td>

              <td>
                <span className="badge bg-warning text-dark">
                  Medium
                </span>
              </td>

              <td>Fatma Omar</td>

              <td>
                <span className="badge bg-primary">
                  Open
                </span>
              </td>

              <td>
                <div className="form-button-action">

                  <button
                    className="btn btn-link btn-primary btn-lg"
                  >
                    <i className="fa fa-eye"></i>
                  </button>

                  <button
                    className="btn btn-link btn-danger btn-lg"
                  >
                    <i className="fa fa-trash"></i>
                  </button>

                </div>
              </td>
            </tr>

            <tr>
              <td>INC-004</td>
              <td>AST-007</td>
              <td>RSK-004</td>
              <td>HVAC Overheating Event</td>
              <td>2026-06-10</td>

              <td>
                <span className="badge bg-info">
                  Low
                </span>
              </td>

              <td>Mohamed Salim</td>

              <td>
                <span className="badge bg-secondary">
                  Monitoring
                </span>
              </td>

              <td>
                <div className="form-button-action">

                  <button
                    className="btn btn-link btn-primary btn-lg"
                  >
                    <i className="fa fa-eye"></i>
                  </button>

                  <button
                    className="btn btn-link btn-danger btn-lg"
                  >
                    <i className="fa fa-trash"></i>
                  </button>

                </div>
              </td>
            </tr>

            <tr>
              <td>INC-005</td>
              <td>AST-010</td>
              <td>RSK-005</td>
              <td>Electrical Short Circuit</td>
              <td>2026-06-08</td>

              <td>
                <span className="badge bg-dark">
                  Critical
                </span>
              </td>

              <td>Safety Officer</td>

              <td>
                <span className="badge bg-danger">
                  Escalated
                </span>
              </td>

              <td>
                <div className="form-button-action">

                  <button
                    className="btn btn-link btn-primary btn-lg"
                  >
                    <i className="fa fa-eye"></i>
                  </button>

                  <button
                    className="btn btn-link btn-danger btn-lg"
                  >
                    <i className="fa fa-trash"></i>
                  </button>

                </div>
              </td>
            </tr>

          </tbody>
        </table>
      </div>
    </div>
  );
}