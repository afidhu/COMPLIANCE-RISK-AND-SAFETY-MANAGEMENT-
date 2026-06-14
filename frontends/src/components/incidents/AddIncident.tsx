import React from "react";

export default function AddIncident() {
  return (
    <div className="container">
      <div className="page-inner">

        {/* PAGE HEADER */}
        <div className="page-header">
          <h3 className="fw-bold mb-3">Add Incident Report</h3>

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
              <a href="#">Incidents</a>
            </li>

            <li className="separator">
              <i className="icon-arrow-right"></i>
            </li>

            <li className="nav-item">
              <a href="#">Add Incident</a>
            </li>
          </ul>
        </div>

        <div className="row">
          <div className="col-md-12">

            <div className="card shadow-sm border-0">

              <div className="card-header">
                <h4 className="card-title">
                  Incident Information
                </h4>
              </div>

              <div className="card-body">

                <form>

                  {/* INCIDENT ID */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Incident ID
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-hashtag text-primary"></i>
                      </span>

                      <input
                        type="text"
                        className="form-control border-start-0 py-3"
                        placeholder="Enter incident ID"
                      />
                    </div>
                  </div>

                  {/* ASSET */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Asset ID
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-building text-primary"></i>
                      </span>

                      <select className="form-select border-start-0 py-3">
                        <option selected disabled>
                          Select Asset
                        </option>

                        <option>AST-001 - Main Lift</option>
                        <option>AST-002 - Fire Extinguisher</option>
                        <option>AST-003 - Generator</option>
                      </select>
                    </div>
                  </div>

                  {/* RISK */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Risk ID
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-triangle-exclamation text-primary"></i>
                      </span>

                      <select className="form-select border-start-0 py-3">
                        <option selected disabled>
                          Select Related Risk
                        </option>

                        <option>RSK-001 - Lift Failure</option>
                        <option>RSK-002 - Fire Hazard</option>
                        <option>RSK-003 - Electrical Fault</option>
                      </select>
                    </div>
                  </div>

                  {/* INCIDENT TITLE */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Incident Title
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-file-circle-exclamation text-primary"></i>
                      </span>

                      <input
                        type="text"
                        className="form-control border-start-0 py-3"
                        placeholder="Enter incident title"
                      />
                    </div>
                  </div>

                  {/* DESCRIPTION */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Description
                    </label>

                    <textarea
                      rows={5}
                      className="form-control"
                      placeholder="Describe the incident in detail..."
                    ></textarea>
                  </div>

                  {/* REPORTED DATE */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Reported Date
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-calendar-days text-primary"></i>
                      </span>

                      <input
                        type="date"
                        className="form-control border-start-0 py-3"
                      />
                    </div>
                  </div>

                  {/* SEVERITY */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Severity Level
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-shield-halved text-primary"></i>
                      </span>

                      <select className="form-select border-start-0 py-3">
                        <option selected disabled>
                          Select Severity
                        </option>

                        <option>Low</option>
                        <option>Medium</option>
                        <option>High</option>
                        <option>Critical</option>
                      </select>
                    </div>
                  </div>

                  {/* REPORTED BY */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Reported By
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-user text-primary"></i>
                      </span>

                      <input
                        type="text"
                        className="form-control border-start-0 py-3"
                        placeholder="Enter reporter name"
                      />
                    </div>
                  </div>

                  {/* STATUS */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Status
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-circle-check text-primary"></i>
                      </span>

                      <select className="form-select border-start-0 py-3">
                        <option selected disabled>
                          Select Status
                        </option>

                        <option>Open</option>
                        <option>Under Investigation</option>
                        <option>Resolved</option>
                        <option>Closed</option>
                      </select>
                    </div>
                  </div>

                  {/* BUTTONS */}
                  <div className="d-flex justify-content-end gap-3 mt-5">

                    <a
                      href="./incidents.html"
                      className="btn btn-light px-4 py-2 rounded-3 fw-semibold"
                    >
                      <i className="fas fa-arrow-left me-2"></i>
                      Back
                    </a>

                    <button
                      type="submit"
                      className="btn text-white px-4 py-2 rounded-3 fw-semibold"
                      style={{
                        background: "#1e66ff",
                      }}
                    >
                      <i className="fas fa-save me-2"></i>
                      Save Incident
                    </button>

                  </div>

                </form>

              </div>

            </div>

          </div>
        </div>

      </div>
    </div>
  );
}