import React from "react";
import Technicians from "../technicians/Technicians";
import AddRisk from "../risks/AddRisk";
import AddMitigation from "../mitigations/AddMitigation";

export default function ViewHazard() {
  return (
    <div className="container-fluid px-3">

      {/* HEADER */}
      <div className="page-inner">

        <div className="card shadow-sm border-0 mb-4">
          <div
            className="card-body text-white"
            style={{
              background: "#1e66ff",
              borderRadius: "10px",
            }}
          >
            <h3 className="mb-1 fw-bold">Lift Sensor Failure</h3>
            <small>Hazard Detail Overview</small>
          </div>
        </div>


        {/* ================= RISKS ================= */}
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
                </tr>
              </thead>

              <tbody>
                <tr>
                  <td>Lift Sensor Failure</td>
                  <td>
                    <span className="badge bg-warning text-dark">
                      Medium
                    </span>
                  </td>
                  <td>
                    <span className="badge bg-danger">High</span>
                  </td>
                  <td>
                    Sensor not responding causing unsafe lift operation
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        {/* ================= MITIGATION ================= */}
        <div className="card mb-4 border-0 shadow-sm">
          <div className="card-header bg-info text-white fw-bold">
            Mitigation Actions
             <button type={'button'} style={{ float: 'right' }} className="btn btn-primary mb0" data-bs-toggle="modal" data-bs-target="#mitgationModel">
              <i className="fa fa-plus" ></i> Add Actions 
            </button>
          </div>

          <div className="card-body">
            <table className="table table-hover align-middle">
              <thead className="table-info">
                <tr>
                  <th>Action Title</th>
                  <th>Assigned To</th>
                  <th>Target Date</th>
                  <th>Status</th>
                </tr>
              </thead>

              <tbody>
                <tr>
                  <td>Inspect Control Panel</td>
                  <td>Maintenance Team</td>
                  <td>2026-06-20</td>
                  <td>
                    <span className="badge bg-warning text-dark">
                      Pending
                    </span>
                  </td>
                </tr>

                <tr>
                  <td>Check Sensor Wiring</td>
                  <td>Technician Team</td>
                  <td>2026-06-22</td>
                  <td>
                    <span className="badge bg-primary">
                      In Progress
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        {/* ================= CAPA ================= */}
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
                  <th>Type</th>
                  <th>Assigned To</th>
                  <th>Due Date</th>
                  <th>Status</th>
                </tr>
              </thead>

              <tbody>
                <tr>
                  <td>Replace Faulty Sensor</td>
                  <td>
                    <span className="badge bg-danger">
                      Corrective
                    </span>
                  </td>
                  <td>Juma Technician</td>
                  <td>2026-06-25</td>
                  <td>
                    <span className="badge bg-warning text-dark">
                      Pending
                    </span>
                  </td>
                </tr>

                <tr>
                  <td>Preventive Sensor Calibration</td>
                  <td>
                    <span className="badge bg-success">
                      Preventive
                    </span>
                  </td>
                  <td>Maintenance Team</td>
                  <td>2026-06-28</td>
                  <td>
                    <span className="badge bg-primary">
                      In Progress
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

      </div>

      {/* <!--CaPA Modal  --> */}
      {/* <!-- Scrollable modal --> */}
      <div className="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabIndex={-1} aria-labelledby="staticBackdropLabel" aria-hidden="true">
        {/* Combined sizing (modal-lg or modal-xl) and scrollable utility directly here */}
        <div className="modal-dialog modal-xl modal-dialog-scrollable">
          <div className="modal-content">
            <div className="modal-header">
              <h1 className="modal-title fs-5 text-primary ms-5" id="staticBackdropLabel"><b>All Technicians</b></h1>
              <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div className="modal-body w-100">
              <Technicians />

              <form>

                <div className="card border-0 shadow-sm rounded-4">

                  <div
                    className="card-header text-white py-3"
                    style={{ backgroundColor: "#1e66ff" }}
                  >
                    <h5 className="mb-0 fw-bold">
                      Corrective Action (CAPA)
                    </h5>
                  </div>

                  <div className="card-body p-4">

                    {/* Corrective Action Title */}
                    <div className="mb-4">

                      <label className="form-label fw-semibold">
                        Corrective Action Title
                      </label>

                      <div className="input-group">

                        <span className="input-group-text bg-light">
                          <i
                            className="fas fa-tools"
                            style={{ color: "#1e66ff" }}
                          ></i>
                        </span>

                        <input
                          type="text"
                          className="form-control py-3"
                          placeholder="Enter corrective action title"
                        />

                      </div>

                    </div>

                    {/* Due Date */}
                    <div className="mb-4">

                      <label className="form-label fw-semibold">
                        Due Date
                      </label>

                      <div className="input-group">

                        <span className="input-group-text bg-light">
                          <i
                            className="fas fa-calendar-alt"
                            style={{ color: "#1e66ff" }}
                          ></i>
                        </span>

                        <input
                          type="date"
                          className="form-control py-3"
                          style={{
                            colorScheme: "light", /* Forces browser UI elements to stay dark/visible */
                          }}
                        />



                      </div>

                    </div>

                    {/* Buttons */}
                    <div className="d-flex justify-content-end gap-3 mt-4">

                      <button
                        type="reset"
                        className="btn btn-light px-4 py-2 fw-semibold"
                      >
                        Clear
                      </button>

                      <button
                        type="submit"
                        className="btn text-white px-4 py-2 fw-semibold"
                        style={{ backgroundColor: "#1e66ff" }}
                      >
                        <i className="fas fa-save me-2"></i>
                        Save Action
                      </button>

                    </div>

                  </div>

                </div>

              </form>
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              {/* <button type="button" className="btn btn-primary"><i className="fa fa-save"></i> Save</button> */}
            </div>
          </div>
        </div>
      </div>


    {/* <!--Risks Modal  --> */}
      {/* <!-- Scrollable modal --> */}
      <div className="modal fade" id="riskmodel" data-bs-backdrop="static" data-bs-keyboard="false" tabIndex={-1} aria-labelledby="staticBackdropLabel" aria-hidden="true">
        {/* Combined sizing (modal-lg or modal-xl) and scrollable utility directly here */}
        <div className="modal-dialog modal-xl modal-dialog-scrollable">
          <div className="modal-content">
            <div className="modal-header">
              <h1 className="modal-title fs-5 text-primary ms-5" id="staticBackdropLabel"><b>All Technicians</b></h1>
              <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div className="modal-body w-100">
              <AddRisk/>
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              {/* <button type="button" className="btn btn-primary"><i className="fa fa-save"></i> Save</button> */}
            </div>
          </div>
        </div>
      </div>

          {/* <!--mitgation Modal  --> */}
      {/* <!-- Scrollable modal --> */}
      <div className="modal fade" id="mitgationModel" data-bs-backdrop="static" data-bs-keyboard="false" tabIndex={-1} aria-labelledby="staticBackdropLabel" aria-hidden="true">
        {/* Combined sizing (modal-lg or modal-xl) and scrollable utility directly here */}
        <div className="modal-dialog modal-xl modal-dialog-scrollable">
          <div className="modal-content">
            <div className="modal-header">
              <h1 className="modal-title fs-5 text-primary ms-5" id="staticBackdropLabel"><b>Add Mitigation Action</b></h1>
              <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div className="modal-body w-100">
              <AddMitigation/>
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              {/* <button type="button" className="btn btn-primary"><i className="fa fa-save"></i> Save</button> */}
            </div>
          </div>
        </div>
      </div>

    </div>
  );
}