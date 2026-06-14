import React from "react";

export default function Technicians() {
  return (
    <div className="container-fluid px-3">
      <div className="page-inner">

        {/* HEADER */}
        <div className="page-header mb-3">
          <h3 className="fw-bold">Technicians</h3>
        </div>

        {/* CARD */}
        <div className="card shadow-sm border-0">

          <div className="card-header d-flex justify-content-between align-items-center">
            <h5 className="mb-0 fw-bold">Technician List</h5>

            <a
              href="#"
              className="btn btn-primary"
              style={{ background: "#1e66ff", border: "none" }}
            >
              <i className="fa fa-plus me-2"></i>
              Add Technician
            </a>
          </div>

          {/* TABLE */}
          <div className="card-body">
            <div className="table-responsive">

              <table className="table table-hover align-middle">
                <thead style={{ background: "#1e66ff", color: "white" }}>
                  <tr>
                    <th>User ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th className="text-center">Actions</th>
                  </tr>
                </thead>

                <tbody>

                  {/* ROW 1 */}
                  <tr>
                    <td>TCH-001</td>
                    <td>John Mwita</td>
                    <td>john@gmail.com</td>
                    <td>Technician</td>
                    <td>+255 712 345 678</td>
                    <td>
                      <span className="badge bg-success">Active</span>
                    </td>

                    {/* ACTIONS */}
                    <td>
                      <div className="d-flex justify-content-center align-items-center gap-2">
                        {/* VIEW */}
                        <button
                          className="btn btn-sm btn-link text-primary p-0"
                          title="View"
                        >
                          <i className="fa fa-eye fs-5"></i>
                        </button>

                        {/* CHECK / ASSIGN */}
                         <div className="form-check m-0 p-0  d-flex align-items-center text-success">
                          <input className="form-check-input m-0" type="checkbox" id="successCheck" />
                        </div>

                        {/* DELETE */}
                        <button
                          className="btn btn-sm btn-link text-danger p-0"
                          title="Delete"
                        >
                          <i className="fa fa-trash fs-5"></i>
                        </button>
                      </div>
                    </td>
                  </tr>

                  {/* ROW 2 */}
                  <tr>
                    <td>TCH-002</td>
                    <td>Fatma Ali</td>
                    <td>fatma@gmail.com</td>
                    <td>Technician</td>
                    <td>+255 784 111 222</td>
                    <td>
                      <span className="badge bg-warning text-dark">Inactive</span>
                    </td>

                    <td>
                      <div className="d-flex justify-content-center align-items-center gap-2">
                        <button className="btn btn-sm btn-link text-primary p-0">
                          <i className="fa fa-eye fs-5"></i>
                        </button>



                        <button className="btn btn-sm btn-link text-danger p-0">
                          <i className="fa fa-trash fs-5"></i>
                        </button>
                      </div>
                    </td>
                  </tr>

                  {/* ROW 3 */}
                  <tr>
                    <td>TCH-003</td>
                    <td>Ali Hassan</td>
                    <td>ali@gmail.com</td>
                    <td>Senior Technician</td>
                    <td>+255 701 888 999</td>
                    <td>
                      <span className="badge bg-success">Active</span>
                    </td>

                    <td>
                      <div className="d-flex justify-content-center align-items-center gap-2">
                        <button className="btn btn-sm btn-link text-primary p-0">
                          <i className="fa fa-eye fs-5"></i>
                        </button>
                      </div>
                      </td>

                      <td>
                        <div className="checkbox bg-dark">

                          <button className="btn btn-sm btn-link text-danger p-0">
                            <i className="fa fa-trash fs-5"></i>
                          </button>
                        </div>
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