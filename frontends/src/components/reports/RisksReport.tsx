import React from 'react'

export default function RisksReport() {
  return (
    <div>
      <div className="container">
        <div className="page-inner">

          {/* HEADER */}
          <div className="page-header">
            <h3 className="fw-bold mb-3">Risk Reports</h3>

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
                <a href="#">Risks</a>
              </li>
            </ul>
          </div>

          {/* CARD */}
          <div className="row">
            <div className="col-md-12">
              <div className="card">

                {/* CARD HEADER */}
                <div className="card-header d-flex justify-content-between align-items-center">
                  <h4 className="card-title mb-0">Risk Management</h4>

                  <a
                    href="./add_asset.html"
                    className="btn btn-primary btn-lg"
                  >
                    <i className="fa fa-plus me-2"></i>
                    Add New
                  </a>
                </div>

                {/* TABLE BODY */}
                <div className="card-body">
                  <div className="table-responsive">

                    <table
                      id="risk-datatables"
                      className="display table table-striped table-hover align-middle"
                    >
                      <thead className="table-danger">
                        <tr>
                          <th>Risk ID</th>
                          <th>Asset ID</th>
                          <th>Risk Name</th>
                          <th>Risk Level</th>
                          <th>Mitigation Action</th>
                          <th>Export PDF</th>
                        </tr>
                      </thead>

                      <tfoot className="table-light">
                        <tr>
                          <th>Risk ID</th>
                          <th>Asset ID</th>
                          <th>Risk Name</th>
                          <th>Risk Level</th>
                          <th>Mitigation Action</th>
                          <th>Export</th>
                        </tr>
                      </tfoot>

                      <tbody>

                        <tr>
                          <td>RSK-001</td>
                          <td>AST-001</td>
                          <td>Lift Sensor Fault</td>
                          <td>
                            <span className="badge bg-danger">High</span>
                          </td>
                          <td>Stop lift operation and inspect control panel</td>
                          <td>
                            <button className="btn btn-link btn-primary btn-lg">
                              <i className="fa fa-file-pdf"></i>
                            </button>
                          </td>
                        </tr>

                        <tr>
                          <td>RSK-002</td>
                          <td>AST-002</td>
                          <td>Expired Fire Extinguisher</td>
                          <td>
                            <span className="badge bg-warning text-dark">Medium</span>
                          </td>
                          <td>Replace extinguisher immediately</td>
                          <td>
                            <button className="btn btn-link btn-primary btn-lg">
                              <i className="fa fa-file-pdf"></i>
                            </button>
                          </td>
                        </tr>

                        <tr>
                          <td>RSK-003</td>
                          <td>AST-004</td>
                          <td>Generator Oil Leakage</td>
                          <td>
                            <span className="badge bg-danger">High</span>
                          </td>
                          <td>Shut down generator and repair leakage</td>
                          <td>
                            <button className="btn btn-link btn-primary btn-lg">
                              <i className="fa fa-file-pdf"></i>
                            </button>
                          </td>
                        </tr>

                        <tr>
                          <td>RSK-004</td>
                          <td>AST-007</td>
                          <td>HVAC Overheating</td>
                          <td>
                            <span className="badge bg-warning text-dark">Medium</span>
                          </td>
                          <td>Schedule maintenance and clean filters</td>
                          <td>
                            <button className="btn btn-link btn-primary btn-lg">
                              <i className="fa fa-file-pdf"></i>
                            </button>
                          </td>
                        </tr>

                        <tr>
                          <td>RSK-005</td>
                          <td>AST-010</td>
                          <td>Electrical Short Circuit</td>
                          <td>
                            <span className="badge bg-dark">Critical</span>
                          </td>
                          <td>Disconnect power and inspect wiring</td>
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
    </div>
  )
}