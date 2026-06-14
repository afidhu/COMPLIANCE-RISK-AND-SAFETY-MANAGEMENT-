import React from 'react';

export default function AssetsReport() {
  return (
    <div>
      <div className="container">
        <div className="page-inner">

          {/* HEADER */}
          <div className="page-header">
            <h3 className="fw-bold mb-3">DataTables.Net</h3>

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
                <a href="#">Datatables</a>
              </li>
            </ul>
          </div>

          {/* CARD */}
          <div className="row">
            <div className="col-md-12">

              <div className="card">

                {/* CARD HEADER */}
                <div className="card-header">
                  <h4 className="card-title">Basic</h4>

                  <div
                    className="addbtn"
                    style={{ float: 'right' }}
                  >
                    <a href="./add_asset.html" className="btn btn-primary btn-lg">
                      <i className="fa fa-plus"></i> Add New
                    </a>
                  </div>
                </div>

                {/* CARD BODY */}
                <div className="card-body">
                  <div className="table-responsive">

                    <table
                      id="basic-datatables"
                      className="display table table-striped table-hover align-middle"
                    >
                      <thead className="table-primary">
                        <tr>
                          <th>Asset ID</th>
                          <th>Asset Name</th>
                          <th>Asset Type</th>
                          <th>Location</th>
                          <th>Status</th>
                          <th>Last Inspection</th>
                          <th>Export Pdf</th>
                        </tr>
                      </thead>

                      <tfoot className="table-light">
                        <tr>
                          <th>Asset ID</th>
                          <th>Asset Name</th>
                          <th>Asset Type</th>
                          <th>Location</th>
                          <th>Status</th>
                          <th>Last Inspection</th>
                          <th>Export Pdf</th>
                        </tr>
                      </tfoot>

                      <tbody>

                        {/* ROW 1 */}
                        <tr>
                          <td>AST-001</td>
                          <td>
                            <i className="fas fa-elevator text-primary me-2"></i>
                            Main Lift
                          </td>
                          <td>Lift</td>
                          <td>Block A</td>
                          <td>
                            <span className="badge bg-success">Active</span>
                          </td>
                          <td>2026-05-10</td>
                          <td>
                            <div className="form-button-action">
                              <button
                                onClick={() => confirm('Are you sure you want to delete this asset?')}
                                type="button"
                                className="btn btn-link btn-danger btn-lg"
                              >
                                <i className="fa fa-file-pdf" style={{ fontSize: 'larger' }}></i>
                              </button>
                            </div>
                          </td>
                        </tr>

                        {/* ROW 2 */}
                        <tr>
                          <td>AST-002</td>
                          <td>
                            <i className="fas fa-fire-extinguisher text-danger me-2"></i>
                            Fire Extinguisher A1
                          </td>
                          <td>Safety Equipment</td>
                          <td>Floor 1</td>
                          <td>
                            <span className="badge bg-warning text-dark">Inspection Due</span>
                          </td>
                          <td>2026-04-20</td>
                          <td></td>
                        </tr>

                        {/* ROW 3 */}
                        <tr>
                          <td>AST-003</td>
                          <td>
                            <i className="fas fa-video text-primary me-2"></i>
                            CCTV Camera 01
                          </td>
                          <td>Security</td>
                          <td>Main Gate</td>
                          <td>
                            <span className="badge bg-success">Operational</span>
                          </td>
                          <td>2026-05-08</td>
                          <td></td>
                        </tr>

                        {/* ROW 4 */}
                        <tr>
                          <td>AST-004</td>
                          <td>
                            <i className="fas fa-bolt text-warning me-2"></i>
                            Generator Set
                          </td>
                          <td>Electrical</td>
                          <td>Power Room</td>
                          <td>
                            <span className="badge bg-danger">Faulty</span>
                          </td>
                          <td>2026-05-01</td>
                          <td></td>
                        </tr>

                        {/* ROW 5 */}
                        <tr>
                          <td>AST-005</td>
                          <td>
                            <i className="fas fa-door-open text-info me-2"></i>
                            Emergency Exit Door
                          </td>
                          <td>Emergency</td>
                          <td>West Wing</td>
                          <td>
                            <span className="badge bg-success">Active</span>
                          </td>
                          <td>2026-05-09</td>
                          <td></td>
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
  );
}