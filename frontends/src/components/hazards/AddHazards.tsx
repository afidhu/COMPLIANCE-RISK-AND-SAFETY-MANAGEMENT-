import React from "react";

export default function AddHazards() {
  return (
    <div className="container">
      <div className="page-inner">

        {/* HEADER */}
        <div className="page-header">
          <h3 className="fw-bold mb-3">Add Hazard</h3>

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
              <a href="#">Hazards</a>
            </li>

            <li className="separator">
              <i className="icon-arrow-right"></i>
            </li>

            <li className="nav-item">
              <a href="#">Add Hazard</a>
            </li>
          </ul>
        </div>

        {/* FORM CARD */}
        <div className="row">
          <div className="col-md-12">
            <div className="card shadow-sm border-0">

              <div className="card-header">
                <h4 className="card-title">Hazard Details</h4>
              </div>

              <div className="card-body">

                <form>

                  {/* ASSET ID */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Asset ID
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-hashtag text-primary"></i>
                      </span>

                      <input
                        type="text"
                        className="form-control border-start-0 py-3"
                        placeholder="Enter asset ID"
                      />
                    </div>
                  </div>

                  {/* COMPLIANCE ID */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Compliance ID (Optional)
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-shield-halved text-primary"></i>
                      </span>

                      <input
                        type="text"
                        className="form-control border-start-0 py-3"
                        placeholder="Enter compliance ID (if any)"
                      />
                    </div>
                  </div>

                  {/* HAZARD TITLE */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Hazard Title
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-triangle-exclamation text-primary"></i>
                      </span>

                      <input
                        type="text"
                        className="form-control border-start-0 py-3"
                        placeholder="Enter hazard title"
                      />
                    </div>
                  </div>

                  {/* DESCRIPTION */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Hazard Description
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-align-left text-primary"></i>
                      </span>

                      <textarea
                        className="form-control border-start-0 py-3"
                        rows={3}
                        placeholder="Describe the hazard"
                      ></textarea>
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

                      <select className="form-select border-start-0 py-3">
                        <option disabled selected>
                          Select reporter
                        </option>
                        <option value="system">System</option>
                        <option value="juma">Juma</option>
                        <option value="inspector">Inspector</option>
                      </select>
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
                        <option disabled selected>
                          Select status
                        </option>
                        <option value="open">Open</option>
                        <option value="in_progress">In Progress</option>
                        <option value="resolved">Resolved</option>
                        <option value="closed">Closed</option>
                      </select>
                    </div>
                  </div>

                  {/* BUTTONS */}
                  <div className="d-flex justify-content-end gap-3 mt-5">

                    <a
                      href="./hazards.html"
                      className="btn btn-light px-4 py-2 rounded-3 fw-semibold"
                    >
                      <i className="fas fa-arrow-left me-2"></i>
                      Back
                    </a>

                    <button
                      type="submit"
                      className="btn text-white px-4 py-2 rounded-3 fw-semibold"
                      style={{ background: "#1e66ff" }}
                    >
                      <i className="fas fa-plus me-2"></i>
                      Save Hazard
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