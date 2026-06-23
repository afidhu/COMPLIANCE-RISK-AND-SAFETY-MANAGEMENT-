import axios from "axios";
import React, { useEffect, useState } from "react";
import BaseUrl from "../utils/api_provider/ApiProviders";

export default function Risks() {

  const [risks, setRisks] = useState([])


  const fetchrisks = async () => {
    try {
      const response = await axios.get(`${BaseUrl}/risks/get`)

      setRisks(response.data);
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => {
    fetchrisks();
  }, []);
  return (
    <div className="container-fluid py-4">

      <div className="card shadow border-0 rounded-4 mt-5">

        {/* Header */}
        <div
          className="card-header border-0 d-flex justify-content-between align-items-center py-3"
          style={{
            background: "#1e66ff",
            color: "white",
          }}
        >
          <div>
            <h4 className="mb-0 fw-bold">
              Risk Register
            </h4>

            <small>
              List of identified risks and hazard assessments
            </small>
          </div>

          <button className="btn btn-light fw-semibold">
            <i className="fas fa-plus me-2"></i>
            Add Risk
          </button>
        </div>

        {/* Table */}
        <div className="card-body">

          <div className="table-responsive">

            <table className="table table-hover align-middle">

              <thead
                style={{
                  background: "#f5f8ff",
                }}
              >
                <tr>
                  <th>Hazard ID</th>
                  <th>Risk Title</th>
                  <th>Likelihood</th>
                  <th>Severity</th>
                  <th>Risk Level</th>
                  <th>Description</th>
                  <th>Status</th>
                  <th style={{ width: 120 }}>Actions</th>
                </tr>
              </thead>

              <tbody>

                {/* Row 1 */}
                <tr>

                  <td>
                    <span className="fw-semibold">
                      HZD-001
                    </span>
                  </td>

                  <td>
                    Lift Sensor Failure
                  </td>

                  <td>
                    <span className="badge bg-warning text-dark px-3 py-2">
                      Likely
                    </span>
                  </td>

                  <td>
                    <span className="badge bg-danger px-3 py-2">
                      High
                    </span>
                  </td>

                  <td>
                    <span className="badge bg-danger px-3 py-2">
                      Critical
                    </span>
                  </td>

                  <td>
                    Failure of lift sensor may cause unsafe operation.
                  </td>

                  <td>
                    <span className="badge bg-success px-3 py-2">
                      Active
                    </span>
                  </td>

                  <td>

                    <div className="d-flex gap-2">

                      <button
                        className="btn btn-sm"
                        style={{
                          background: "#eef4ff",
                          color: "#1e66ff",
                        }}
                      >
                        <i className="fas fa-eye"></i>
                      </button>

                      <button
                        className="btn btn-sm btn-danger"
                      >
                        <i className="fas fa-trash"></i>
                      </button>

                    </div>

                  </td>

                </tr>

                {/* Row 2 */}
                <tr>

                  <td>HZD-002</td>

                  <td>
                    Expired Fire Extinguisher
                  </td>

                  <td>
                    <span className="badge bg-info px-3 py-2">
                      Possible
                    </span>
                  </td>

                  <td>
                    <span className="badge bg-warning text-dark px-3 py-2">
                      Medium
                    </span>
                  </td>

                  <td>
                    <span className="badge bg-warning text-dark px-3 py-2">
                      Moderate
                    </span>
                  </td>

                  <td>
                    Fire extinguisher certificate has expired.
                  </td>

                  <td>
                    <span className="badge bg-warning text-dark px-3 py-2">
                      Pending
                    </span>
                  </td>

                  <td>

                    <div className="d-flex gap-2">

                      <button
                        className="btn btn-sm"
                        style={{
                          background: "#eef4ff",
                          color: "#1e66ff",
                        }}
                      >
                        <i className="fas fa-eye"></i>
                      </button>

                      <button
                        className="btn btn-sm btn-danger"
                      >
                        <i className="fas fa-trash"></i>
                      </button>

                    </div>

                  </td>

                </tr>

                {/* Row 3 */}
                <tr>

                  <td>HZD-003</td>

                  <td>
                    Electrical Short Circuit
                  </td>

                  <td>
                    <span className="badge bg-danger px-3 py-2">
                      Almost Certain
                    </span>
                  </td>

                  <td>
                    <span className="badge bg-danger px-3 py-2">
                      Very High
                    </span>
                  </td>

                  <td>
                    <span className="badge bg-dark px-3 py-2">
                      Extreme
                    </span>
                  </td>

                  <td>
                    Damaged wiring may cause fire outbreak.
                  </td>

                  <td>
                    <span className="badge bg-success px-3 py-2">
                      Active
                    </span>
                  </td>

                  <td>

                    <div className="d-flex gap-2">

                      <button
                        className="btn btn-sm"
                        style={{
                          background: "#eef4ff",
                          color: "#1e66ff",
                        }}
                      >
                        <i className="fas fa-eye"></i>
                      </button>

                      <button
                        className="btn btn-sm btn-danger"
                      >
                        <i className="fas fa-trash"></i>
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
  );
}