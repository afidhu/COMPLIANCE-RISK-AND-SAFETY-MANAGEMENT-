import React from 'react'
import { Link } from 'react-router';

export default function Assets() {
  return (
    <div>
      <div className="container-fluid">
  <div className="page-inner">

    {/* PAGE HEADER */}
    <div className="d-flex justify-content-between align-items-center mb-4">

      <div>
        <h2 className="fw-bold mb-1">Asset Management</h2>
        <p className="text-muted mb-0">
          Manage and monitor all facility assets
        </p>
      </div>
      <Link to={'/add-asset'} >
      <button
        className="btn btn-primary btn-lg shadow-sm"
        style={{
          borderRadius: "12px",
          padding: "10px 24px"
        }}
      >
        <i className="fa fa-plus me-2"></i>
        Add Asset
      </button>
</Link>
    </div>

    {/* SUMMARY CARDS */}
    <div className="row mb-4">

      <div className="col-md-3">
        <div className="card shadow-sm border-0">
          <div className="card-body">
            <h6 className="text-muted">Total Assets</h6>
            <h2 className="fw-bold text-primary">1,250</h2>
          </div>
        </div>
      </div>

      <div className="col-md-3">
        <div className="card shadow-sm border-0">
          <div className="card-body">
            <h6 className="text-muted">Active</h6>
            <h2 className="fw-bold text-success">980</h2>
          </div>
        </div>
      </div>

      <div className="col-md-3">
        <div className="card shadow-sm border-0">
          <div className="card-body">
            <h6 className="text-muted">Maintenance</h6>
            <h2 className="fw-bold text-warning">120</h2>
          </div>
        </div>
      </div>

      <div className="col-md-3">
        <div className="card shadow-sm border-0">
          <div className="card-body">
            <h6 className="text-muted">Critical Issues</h6>
            <h2 className="fw-bold text-danger">15</h2>
          </div>
        </div>
      </div>

    </div>

    {/* TABLE CARD */}
    <div
      className="card border-0 shadow-sm"
      style={{
        borderRadius: "18px"
      }}
    >

      <div className="card-header bg-white border-0 py-4">

        <div className="d-flex justify-content-between align-items-center">

          <div>
            <h4 className="fw-bold mb-1">
              Assets List
            </h4>

            <small className="text-muted">
              View and manage registered facility assets
            </small>
          </div>

          <div className="d-flex gap-2">

            <button className="btn btn-light border">
              <i className="fa fa-filter me-2"></i>
              Filter
            </button>

            <button className="btn btn-light border">
              <i className="fa fa-download me-2"></i>
              Export
            </button>

          </div>

        </div>

      </div>

      <div className="card-body">

        <div className="table-responsive">

          <table
            className="table align-middle table-hover"
            style={{
              minWidth: "1200px"
            }}
          >

            <thead>

              <tr
                style={{
                  backgroundColor: "#f8f9ff"
                }}
              >
                <th className="py-3">Asset ID</th>
                <th className="py-3">Asset Name</th>
                <th className="py-3">Type</th>
                <th className="py-3">Location</th>
                <th className="py-3">Status</th>
                <th className="py-3">Last Inspection</th>
                <th className="py-3 text-center">Actions</th>
              </tr>

            </thead>

            <tbody>

              <tr>
                <td className="fw-semibold">
                  AST-001
                </td>

                <td>
                  <div className="d-flex align-items-center">

                    <div
                      className="me-3 d-flex align-items-center justify-content-center"
                      style={{
                        width: "45px",
                        height: "45px",
                        borderRadius: "12px",
                        background: "#edf3ff"
                      }}
                    >
                      <i className="fas fa-elevator text-primary"></i>
                    </div>

                    <div>
                      <div className="fw-semibold">
                        Main Lift
                      </div>

                      <small className="text-muted">
                        Lift Equipment
                      </small>
                    </div>

                  </div>
                </td>

                <td>Lift</td>

                <td>Block A</td>

                <td>
                  <span
                    className="badge"
                    style={{
                      background: "#d1fae5",
                      color: "#065f46",
                      padding: "8px 14px",
                      borderRadius: "20px"
                    }}
                  >
                    Active
                  </span>
                </td>

                <td>10 May 2026</td>

                <td>

                  <div className="d-flex justify-content-center gap-2">

                    <button
                      className="btn btn-primary btn-sm"
                      style={{
                        width: "40px",
                        height: "40px",
                        borderRadius: "10px"
                      }}
                    >
                      <i className="fa fa-eye"></i>
                    </button>

                    <button
                      className="btn btn-warning btn-sm text-white"
                      style={{
                        width: "40px",
                        height: "40px",
                        borderRadius: "10px"
                      }}
                    >
                      <i className="fa fa-pen"></i>
                    </button>

                    <button
                      className="btn btn-danger btn-sm"
                      style={{
                        width: "40px",
                        height: "40px",
                        borderRadius: "10px"
                      }}
                    >
                      <i className="fa fa-trash"></i>
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
    </div>
  )
}
