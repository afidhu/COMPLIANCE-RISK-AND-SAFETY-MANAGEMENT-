
import React from "react";

export default function ViewIncident() {
  return (
    <div className="container">
      <div className="page-inner">

        {/* PAGE HEADER */}
        <div className="page-header">
          <h3 className="fw-bold mb-3">Incident Details</h3>
        </div>

        {/* INCIDENT HEADER */}
        <div className="card border-0 shadow-sm mb-4">

          <div
            className="card-body text-white"
            style={{
              background: "#1e66ff",
              borderRadius: "10px",
            }}
          >
            <div className="d-flex justify-content-between align-items-center flex-wrap">

              <div>
                <h2 className="fw-bold mb-2">
                  Lift Sudden Shutdown During Operation
                </h2>

                <p className="mb-0">
                  Incident ID: INC-001
                </p>
              </div>

              <div className="text-end">

                <span className="badge bg-danger fs-6 px-3 py-2 mb-2">
                  High Severity
                </span>

                <br />

                <span className="badge bg-warning text-dark fs-6 px-3 py-2">
                  Open
                </span>

              </div>

            </div>
          </div>

        </div>

        {/* RELATED ASSET */}
        <div className="card shadow-sm border-0 mb-4">

          <div className="card-header">
            <h4 className="card-title mb-0">
              Related Asset
            </h4>
          </div>

          <div className="card-body">

            <div className="row">

              <div className="col-md-2 text-center">

                <div
                  className="d-flex align-items-center justify-content-center mx-auto"
                  style={{
                    width: "80px",
                    height: "80px",
                    borderRadius: "20px",
                    background: "#edf3ff",
                    color: "#1e66ff",
                    fontSize: "32px",
                  }}
                >
                  <i className="fas fa-elevator"></i>
                </div>

              </div>

              <div className="col-md-10">

                <div className="row">

                  <div className="col-md-4 mb-3">
                    <small className="text-muted">
                      Asset ID
                    </small>
                    <h6>AST-001</h6>
                  </div>

                  <div className="col-md-4 mb-3">
                    <small className="text-muted">
                      Asset Name
                    </small>
                    <h6>Main Passenger Lift</h6>
                  </div>

                  <div className="col-md-4 mb-3">
                    <small className="text-muted">
                      Asset Type
                    </small>
                    <h6>Lift</h6>
                  </div>

                  <div className="col-md-4 mb-3">
                    <small className="text-muted">
                      Location
                    </small>
                    <h6>Block A</h6>
                  </div>

                  <div className="col-md-4 mb-3">
                    <small className="text-muted">
                      Serial Number
                    </small>
                    <h6>LF-2026-001</h6>
                  </div>

                  <div className="col-md-4 mb-3">
                    <small className="text-muted">
                      Asset Status
                    </small>

                    <h6>
                      <span className="badge bg-danger">
                        Out of Service
                      </span>
                    </h6>
                  </div>

                </div>

              </div>

            </div>

          </div>

        </div>

        {/* INCIDENT DETAILS */}
        <div className="card shadow-sm border-0">

          <div className="card-header">
            <h4 className="card-title mb-0">
              Incident Information
            </h4>
          </div>

          <div className="card-body">

            <div className="row">

              <div className="col-md-6 mb-4">
                <label className="text-muted">
                  Reported Date
                </label>

                <h6>12 May 2026</h6>
              </div>

              <div className="col-md-6 mb-4">
                <label className="text-muted">
                  Reported By
                </label>

                <h6>John Inspector</h6>
              </div>

              <div className="col-md-6 mb-4">
                <label className="text-muted">
                  Related Risk
                </label>

                <h6>
                  RSK-001 - Lift Sensor Failure
                </h6>
              </div>

              <div className="col-md-6 mb-4">
                <label className="text-muted">
                  Severity
                </label>

                <h6>
                  <span className="badge bg-danger">
                    High
                  </span>
                </h6>
              </div>

              <div className="col-md-12">

                <label className="text-muted">
                  Incident Description
                </label>

                <div
                  className="p-3 rounded mt-2"
                  style={{
                    background: "#f8f9fa",
                  }}
                >
                  During normal operation, the lift stopped
                  unexpectedly between floors due to a sensor
                  malfunction. Passengers were safely evacuated
                  and the lift was removed from service pending
                  inspection and corrective maintenance.
                </div>

              </div>

            </div>

          </div>

        </div>

      </div>
    </div>
  );
}