
import React from "react";

export default function ViewAssetCompliance() {
  return (
    <div className="container">
      <div className="page-inner">

        {/* Asset Header */}
        <div className="card shadow-sm border-0 mb-4">

          <div className="card-body">

            <div className="d-flex justify-content-between align-items-center">

              <div>
                <h2 className="fw-bold text-primary mb-1">
                  Main Lift (AST-001)
                </h2>

                <p className="text-muted mb-0">
                  Building A • Lift Asset
                </p>
              </div>

              <div>
                <span className="badge bg-success fs-6 px-3 py-2">
                  Operational
                </span>
              </div>

            </div>

          </div>

        </div>

        {/* Compliance Statistics */}
        <div className="row mb-4">

          <div className="col-md-4">
            <div className="card card-stats shadow-sm border-0">
              <div className="card-body">
                <h5 className="text-muted">
                  Total Compliance Checks
                </h5>

                <h2 className="fw-bold text-primary">
                  12
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-4">
            <div className="card card-stats shadow-sm border-0">
              <div className="card-body">
                <h5 className="text-muted">
                  Compliant
                </h5>

                <h2 className="fw-bold text-success">
                  9
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-4">
            <div className="card card-stats shadow-sm border-0">
              <div className="card-body">
                <h5 className="text-muted">
                  Due Soon
                </h5>

                <h2 className="fw-bold text-warning">
                  3
                </h2>
              </div>
            </div>
          </div>

        </div>

        {/* Compliance Table */}
        <div className="card shadow-sm border-0">

          <div className="card-header d-flex justify-content-between">

            <h4 className="card-title">
              Compliance Register
            </h4>

            <a
              href="#"
              className="btn btn-primary"
            >
              <i className="fas fa-plus me-2"></i>
              Add Compliance
            </a>

          </div>

          <div className="card-body">

            <div className="table-responsive">

              <table className="table table-hover align-middle">

                <thead className="table-primary">

                  <tr>
                    <th>Compliance</th>
                    <th>Frequency</th>
                    <th>Last Inspection</th>
                    <th>Next Due Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>

                </thead>

                <tbody>

                  <tr>
                    <td>Annual Lift Inspection</td>
                    <td>Annual</td>
                    <td>01-Jan-2026</td>
                    <td>01-Jan-2027</td>

                    <td>
                      <span className="badge bg-success">
                        Compliant
                      </span>
                    </td>

                    <td>
                      <button className="btn btn-link btn-primary">
                        <i className="fa fa-eye"></i>
                      </button>

                      <button className="btn btn-link btn-warning">
                        <i className="fa fa-pen"></i>
                      </button>
                    </td>
                  </tr>

                  <tr>
                    <td>Quarterly Safety Check</td>
                    <td>Quarterly</td>
                    <td>01-Apr-2026</td>
                    <td>01-Jul-2026</td>

                    <td>
                      <span className="badge bg-warning text-dark">
                        Due Soon
                      </span>
                    </td>

                    <td>
                      <button className="btn btn-link btn-primary">
                        <i className="fa fa-eye"></i>
                      </button>

                      <button className="btn btn-link btn-warning">
                        <i className="fa fa-pen"></i>
                      </button>
                    </td>
                  </tr>

                  <tr>
                    <td>Emergency Brake Test</td>
                    <td>Monthly</td>
                    <td>01-May-2026</td>
                    <td>01-Jun-2026</td>

                    <td>
                      <span className="badge bg-danger">
                        Overdue
                      </span>
                    </td>

                    <td>
                      <button className="btn btn-link btn-primary">
                        <i className="fa fa-eye"></i>
                      </button>

                      <button className="btn btn-link btn-warning">
                        <i className="fa fa-pen"></i>
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
  );
}