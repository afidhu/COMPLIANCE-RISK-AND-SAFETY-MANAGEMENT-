
import React from "react";

export default function AddAssetCompliance() {
  return (
    <div className="container">
      <div className="page-inner">

        <div className="page-header">
          <h3 className="fw-bold mb-3">Add Asset Compliance</h3>

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
              <a href="#">Compliance</a>
            </li>

            <li className="separator">
              <i className="icon-arrow-right"></i>
            </li>

            <li className="nav-item">
              <a href="#">Add Compliance</a>
            </li>
          </ul>
        </div>

        <div className="card shadow-sm border-0">
          <div className="card-header">
            <h4 className="card-title">
              Compliance Information
            </h4>
          </div>

          <div className="card-body">

            <form>

              {/* Compliance ID */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Compliance ID
                </label>

                <div className="input-group">
                  <span className="input-group-text bg-light">
                    <i className="fas fa-hashtag text-primary"></i>
                  </span>

                  <input
                    type="text"
                    className="form-control"
                    placeholder="CMP-001"
                  />
                </div>
              </div>

              {/* Asset */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Asset
                </label>

                <div className="input-group">
                  <span className="input-group-text bg-light">
                    <i className="fas fa-building text-primary"></i>
                  </span>

                  <select className="form-select">
                    <option>Select Asset</option>
                    <option>AST-001 - Main Lift</option>
                    <option>AST-002 - Fire Extinguisher</option>
                    <option>AST-003 - Generator</option>
                  </select>
                </div>
              </div>

              {/* Compliance Name */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Compliance Name
                </label>

                <div className="input-group">
                  <span className="input-group-text bg-light">
                    <i className="fas fa-clipboard-check text-primary"></i>
                  </span>

                  <input
                    type="text"
                    className="form-control"
                    placeholder="Annual Lift Inspection"
                  />
                </div>
              </div>

              {/* Frequency */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Frequency
                </label>

                <div className="input-group">
                  <span className="input-group-text bg-light">
                    <i className="fas fa-repeat text-primary"></i>
                  </span>

                  <select className="form-select">
                    <option>Select Frequency</option>
                    <option>Monthly</option>
                    <option>Quarterly</option>
                    <option>Bi-Annual</option>
                    <option>Annual</option>
                  </select>
                </div>
              </div>

              {/* Last Due Date */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Last Inspection Date
                </label>

                <div className="input-group">
                  <span className="input-group-text bg-light">
                    <i className="fas fa-calendar-check text-primary"></i>
                  </span>

                  <input
                    type="date"
                    className="form-control"
                     style={{colorScheme:'light'}}
                  />
                </div>
              </div>

              {/* Due Date */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Next Due Date
                </label>

                <div className="input-group">
                  <span className="input-group-text bg-light">
                    <i className="fas fa-calendar-days text-primary"></i>
                  </span>

                  <input
                    type="date"
                    className="form-control"
                    style={{colorScheme:'light'}}
                  />
                </div>
              </div>

              {/* Status */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Compliance Status
                </label>

                <div className="input-group">
                  <span className="input-group-text bg-light">
                    <i className="fas fa-circle-check text-primary"></i>
                  </span>

                  <select className="form-select">
                    <option>Select Status</option>
                    <option>Compliant</option>
                    <option>Due Soon</option>
                    <option>Overdue</option>
                  </select>
                </div>
              </div>

              <div className="d-flex justify-content-end gap-3 mt-5">

                <button
                  type="button"
                  className="btn btn-light"
                >
                  Back
                </button>

                <button
                  type="submit"
                  className="btn text-white"
                  style={{ background: "#1e66ff" }}
                >
                  <i className="fas fa-save me-2"></i>
                  Save Compliance
                </button>

              </div>

            </form>

          </div>
        </div>

      </div>
    </div>
  );
}