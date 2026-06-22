
import React, { useEffect, useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";

export default function Incidents() {
  const [incidents, setIncidents] = useState([]);
  const [loading, setLoading] = useState(false);

  const getIncidents = async () => {
    try {
      setLoading(true);

      const response = await axios.get(
        "http://localhost:51213/incidents/get"
      );

      setIncidents(response.data);
    } catch (error) {
      console.log(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getIncidents();
  }, []);

  const getSeverityBadge = (severity) => {
    switch (severity) {
      case "CRITICAL":
        return "badge bg-dark";
      case "HIGH":
        return "badge bg-danger";
      case "MEDIUM":
        return "badge bg-warning text-dark";
      case "LOW":
        return "badge bg-success";
      default:
        return "badge bg-secondary";
    }
  };

  const getStatusBadge = (status) => {
    switch (status) {
      case "CLOSED":
        return "badge bg-success";
      case "OPEN":
        return "badge bg-primary";
      case "ESCALATED":
        return "badge bg-danger";
      case "MONITORING":
        return "badge bg-secondary";
      default:
        return "badge bg-warning text-dark";
    }
  };

  return (
    <div className="container-fluid">
      <div className="page-inner">

        {/* SUMMARY CARDS */}
        <div className="row mb-4">

          <div className="col-md-3">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted">
                  Total Incidents
                </h6>

                <h2 className="fw-bold text-primary">
                  {incidents.length}
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted">
                  High Severity
                </h6>

                <h2 className="fw-bold text-danger">
                  {
                    incidents.filter(
                      (i) =>
                        i.severity === "HIGH" ||
                        i.severity === "CRITICAL"
                    ).length
                  }
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted">
                  Medium Severity
                </h6>

                <h2 className="fw-bold text-warning">
                  {
                    incidents.filter(
                      (i) => i.severity === "MEDIUM"
                    ).length
                  }
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted">
                  Open Cases
                </h6>

                <h2 className="fw-bold text-info">
                  {
                    incidents.filter(
                      (i) =>
                        !i.status ||
                        i.status === "OPEN"
                    ).length
                  }
                </h2>
              </div>
            </div>
          </div>

        </div>

        {/* HEADER */}
        <div
          className="card-header mb-4 d-flex justify-content-between align-items-center flex-wrap gap-3"
          style={{
            background:
              "linear-gradient(135deg, #1e66ff, #0047cc)",
            color: "#fff",
            borderRadius: "16px",
            padding: "20px 25px",
            boxShadow:
              "0 10px 25px rgba(0,71,204,0.25)",
          }}
        >
          <div>
            <h3 className="mb-1 fw-bold">
              <i className="fas fa-triangle-exclamation me-2"></i>
              Incident Management
            </h3>

            <small>
              Track, monitor and manage all
              reported incidents.
            </small>
          </div>

          <Link
            to="/AddIncident"
            className="btn fw-semibold"
            style={{
              backgroundColor: "#fff",
              color: "#1e66ff",
              borderRadius: "12px",
              padding: "10px 18px",
              boxShadow:
                "0 4px 15px rgba(0,0,0,0.15)",
            }}
          >
            <i className="fa fa-plus me-2"></i>
            Add Incident
          </Link>
        </div>

        {/* TABLE CARD */}
        <div className="card shadow border-0">

          <div className="card-body">

            <div className="table-responsive">

              <table className="table table-hover align-middle">

                <thead
                  style={{
                    background:
                      "linear-gradient(90deg,#1e66ff,#0047cc)",
                    color: "#fff",
                  }}
                >
                  <tr>
                    <th>#</th>
                    <th>Asset</th>
                    <th>Incident</th>
                    <th>Date</th>
                    <th>Severity</th>
                    <th>Reported By</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>
                </thead>

                <tbody>

                  {loading ? (
                    <tr>
                      <td
                        colSpan="9"
                        className="text-center py-5"
                      >
                        <div
                          className="spinner-border text-primary"
                          role="status"
                        />
                      </td>
                    </tr>
                  ) : incidents.length === 0 ? (
                    <tr>
                      <td
                        colSpan="9"
                        className="text-center py-5"
                      >
                        <div className="text-muted">
                          No Incident Records Found
                        </div>
                      </td>
                    </tr>
                  ) : (
                    incidents.map(
                      (incident, index) => (
                        <tr
                          key={
                            incident.incidentId
                          }
                        >
                          <td>
                            <span className="fw-bold text-primary">
                              INC-{index + 1}
                            </span>
                          </td>

                          <td>
                            <div className="fw-semibold">
                              {
                                incident.asset
                                  ?.assetName
                              }
                            </div>

                            <small className="text-muted">
                              {
                                incident.asset
                                  ?.location
                              }
                            </small>
                          </td>

                          {/* <td>
                            <small className="text-muted">
                              {
                                incident.riskId
                              }
                            </small>
                          </td> */}

                          <td>
                            <div className="fw-semibold">
                              {
                                incident.incidentTitle
                              }
                            </div>

                            <small className="text-muted">
                              {
                                incident.description
                              }
                            </small>
                          </td>

                          <td>
                            {new Date(
                              incident.incidentDate
                            ).toLocaleDateString()}
                          </td>

                          <td>
                            <span
                              className={getSeverityBadge(
                                incident.severity
                              )}
                            >
                              {
                                incident.severity
                              }
                            </span>
                          </td>

                          <td>
                            <div className="fw-semibold">
                              {
                                incident
                                  .reportedBy
                                  ?.fullName
                              }
                            </div>

                            <small className="text-muted">
                              {
                                incident
                                  .reportedBy
                                  ?.role
                              }
                            </small>
                          </td>

                          <td>
                            <span
                              className={getStatusBadge(
                                incident.status ||
                                  "OPEN"
                              )}
                            >
                              {incident.status ||
                                "OPEN"}
                            </span>
                          </td>

                          <td>
                            <div className="d-flex gap-2">

                              <Link
                                to={`/ViewIncident/${incident.incidentId}`}
                              >
                                <button
                                  className="btn btn-sm btn-primary"
                                  title="View"
                                >
                                  <i className="fa fa-eye"></i>
                                </button>
                              </Link>

                              <button
                                className="btn btn-sm btn-danger"
                                title="Delete"
                              >
                                <i className="fa fa-trash"></i>
                              </button>

                            </div>
                          </td>

                        </tr>
                      )
                    )
                  )}

                </tbody>

              </table>

            </div>

          </div>

        </div>

      </div>
    </div>
  );
}