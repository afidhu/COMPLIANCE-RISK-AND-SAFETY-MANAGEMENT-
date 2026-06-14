
import React from 'react'

export default function AddRisk() {
  return (
    <div>
      <div className="container-fluid py-4">
      <div className="card shadow border-0">
        
        {/* Header */}
        <div
          className="card-header text-white"
          style={{ background: "#1e66ff" }}
        >
          <h4 className="mb-0">
            <i className="fas fa-triangle-exclamation me-2"></i>
            Add Risk Assessment
          </h4>
        </div>

        <div className="card-body p-4">
          <form>

            {/* Hazard ID */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Hazard ID
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-hashtag text-primary"></i>
                </span>

                <select className="form-select py-3">
                  <option>Select Hazard</option>
                  <option>HZD-001 - Lift Sensor Failure</option>
                  <option>HZD-002 - Fire Extinguisher Expired</option>
                  <option>HZD-003 - Electrical Short Circuit</option>
                </select>
              </div>
            </div>

            {/* Risk Title */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Risk Title
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-shield-halved text-primary"></i>
                </span>

                <input
                  type="text"
                  className="form-control py-3"
                  placeholder="Enter risk title"
                />
              </div>
            </div>

            {/* Likelihood */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Likelihood
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-chart-line text-primary"></i>
                </span>

                <select className="form-select py-3">
                  <option>Select likelihood</option>
                  <option>Rare (1)</option>
                  <option>Unlikely (2)</option>
                  <option>Possible (3)</option>
                  <option>Likely (4)</option>
                  <option>Almost Certain (5)</option>
                </select>
              </div>
            </div>

            {/* Severity */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Severity
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-fire text-danger"></i>
                </span>

                <select className="form-select py-3">
                  <option>Select severity</option>
                  <option>Insignificant (1)</option>
                  <option>Minor (2)</option>
                  <option>Moderate (3)</option>
                  <option>Major (4)</option>
                  <option>Catastrophic (5)</option>
                </select>
              </div>
            </div>

            {/* Risk Level */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Risk Level
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-gauge-high text-warning"></i>
                </span>

                <select className="form-select py-3">
                  <option>Select risk level</option>
                  <option>Low</option>
                  <option>Medium</option>
                  <option>High</option>
                  <option>Critical</option>
                </select>
              </div>
            </div>

            {/* Risk Description */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Risk Description
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-file-lines text-primary"></i>
                </span>

                <textarea
                  rows={5}
                  className="form-control"
                  placeholder="Describe the risk and possible consequences..."
                ></textarea>
              </div>
            </div>

            {/* Status */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Status
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-circle-check text-success"></i>
                </span>

                <select className="form-select py-3">
                  <option>Select status</option>
                  <option>Open</option>
                  <option>Under Review</option>
                  <option>Mitigation In Progress</option>
                  <option>Closed</option>
                </select>
              </div>
            </div>

            {/* Buttons */}
            <div className="d-flex justify-content-end gap-3 mt-5">

              <button
                type="button"
                className="btn btn-light px-4 py-2"
              >
                <i className="fas fa-arrow-left me-2"></i>
                Back
              </button>

              <button
                type="submit"
                className="btn text-white px-4 py-2"
                style={{ background: "#1e66ff" }}
              >
                <i className="fas fa-save me-2"></i>
                Save Risk
              </button>

            </div>

          </form>
        </div>
      </div>
    </div>
    </div>
  )
}
