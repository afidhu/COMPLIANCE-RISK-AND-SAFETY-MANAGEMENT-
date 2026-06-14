import React from "react";

export default function IncidentsReport() {
  return (
    <div className="container">
      <div className="page-inner">

        {/* PAGE HEADER */}
        <div className="page-header">
          <h3 className="fw-bold mb-3">Incident Reports</h3>

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
              <a href="#">Tables</a>
            </li>

            <li className="separator">
              <i className="icon-arrow-right"></i>
            </li>

            <li className="nav-item">
              <a href="#">Incidents</a>
            </li>
          </ul>
        </div>

        {/* CARD */}
        <div className="row">
          <div className="col-md-12">
            <div className="card">

              {/* CARD HEADER */}
              <div className="card-header d-flex justify-content-between align-items-center">
                <h4 className="card-title mb-0">Incident Table</h4>

                <a href="./add_incident.html" className="btn btn-primary btn-lg">
                  <i className="fa fa-plus me-2"></i>
                  Add New
                </a>
              </div>

              {/* CARD BODY */}
              <div className="card-body">
                <div className="table-responsive">

                  <table
                    id="incident-datatables"
                    className="display table table-striped table-hover align-middle"
                  >
                    <thead className="table-warning">
                      <tr>
                        <th>Incident ID</th>
                        <th>Asset ID</th>
                        <th>Incident Type</th>
                        <th>Description</th>
                        <th>Date Reported</th>
                        <th>Export PDF</th>
                      </tr>
                    </thead>

                    <tfoot className="table-light">
                      <tr>
                        <th>Incident ID</th>
                        <th>Asset ID</th>
                        <th>Incident Type</th>
                        <th>Description</th>
                        <th>Date Reported</th>
                        <th>Export PDF</th>
                      </tr>
                    </tfoot>

                    <tbody>

                      {/* ROW 1 */}
                      <tr>
                        <td>INC-001</td>
                        <td>AST-001</td>
                        <td>Lift Failure</td>
                        <td>Lift stopped between floors during operation</td>
                        <td>2026-05-12</td>
                        <td>
                          <button className="btn btn-link btn-danger btn-lg">
                            <i className="fa fa-file-pdf"></i>
                          </button>
                        </td>
                      </tr>

                      {/* ROW 2 */}
                      <tr>
                        <td>INC-002</td>
                        <td>AST-002</td>
                        <td>Safety Equipment Failure</td>
                        <td>Fire extinguisher pressure was low</td>
                        <td>2026-05-10</td>
                        <td>
                          <button className="btn btn-link btn-primary btn-lg">
                            <i className="fa fa-file-pdf"></i>
                          </button>
                        </td>
                      </tr>

                      {/* ROW 3 */}
                      <tr>
                        <td>INC-003</td>
                        <td>AST-004</td>
                        <td>Power Failure</td>
                        <td>Generator failed during backup operation</td>
                        <td>2026-05-08</td>
                        <td>
                          <button className="btn btn-link btn-primary btn-lg">
                            <i className="fa fa-file-pdf"></i>
                          </button>
                        </td>
                      </tr>

                      {/* ROW 4 */}
                      <tr>
                        <td>INC-004</td>
                        <td>AST-010</td>
                        <td>Electrical Hazard</td>
                        <td>Sparks detected from distribution box</td>
                        <td>2026-05-11</td>
                        <td>
                          <button className="btn btn-link btn-primary btn-lg">
                            <i className="fa fa-file-pdf"></i>
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

      </div>
    </div>
  );
}