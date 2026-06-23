
import React, { useEffect, useState } from "react";
import axios from "axios";
import { jsPDF } from "jspdf";
import autoTable from "jspdf-autotable";
import BaseUrl from "../utils/api_provider/ApiProviders";

export default function IncidentsReport() {
  const [incidents, setIncidents] = useState([]);
  const [loading, setLoading] = useState(false);

  const [fromDate, setFromDate] = useState("");
  const [toDate, setToDate] = useState("");

  const getIncidents = async () => {
    try {
      setLoading(true);

      const response = await axios.get(
        `${BaseUrl}/incidents/get`
      );

      setIncidents(response.data);
    } catch (error) {
      console.error("Error fetching incidents:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getIncidents();
  }, []);

  const getSeverityBadge = (severity) => {
    switch (severity) {
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

  const filteredIncidents = incidents.filter((item) => {
    if (!fromDate && !toDate) return true;

    const incidentDate = new Date(item.incidentDate);

    const from = fromDate ? new Date(fromDate) : null;
    const to = toDate ? new Date(toDate + "T23:59:59") : null;

    return (
      (!from || incidentDate >= from) &&
      (!to || incidentDate <= to)
    );
  });


  const exportIncidentsPDF = () => {
    const doc = new jsPDF();

    doc.setFontSize(20);
    doc.text("COMPLIANCE MANAGEMENT SYSTEM", 14, 15);

    doc.setFontSize(14);
    doc.text("Incident Report", 14, 25);

    doc.setFontSize(10);
    doc.text(
      `Generated On: ${new Date().toLocaleString()}`,
      14,
      32
    );

    doc.text(
      `Total Incidents: ${filteredIncidents.length}`,
      14,
      38
    );

    autoTable(doc, {
      startY: 45,
      head: [[
        "#",
        "Asset",
        "Title",
        "Severity",
        "Date",
        "Status",
      ]],
      body: filteredIncidents.map((item, index) => [
        index + 1,
        item.asset?.assetName,
        item.incidentTitle,
        item.severity,
        new Date(item.incidentDate).toLocaleDateString(),
        item.status || "OPEN",
      ]),
    });

    doc.save("Incident_Report.pdf");
  };

  return (
    <div className="container-fluid">
      <div className="page-inner">

        {/* PAGE HEADER */}
        <div className="page-header mb-4">
          <h3 className="fw-bold mb-2 text-dark">
            Incident Reports
          </h3>

          <ul className="breadcrumbs mb-0">
            <li className="nav-home">
              <a href="#">
                <i className="icon-home"></i>
              </a>
            </li>

            <li className="separator">
              <i className="icon-arrow-right"></i>
            </li>

            <li className="nav-item">
              <a href="#">Reports</a>
            </li>

            <li className="separator">
              <i className="icon-arrow-right"></i>
            </li>

            <li className="nav-item">
              <a href="#">Incidents</a>
            </li>
          </ul>
        </div>

        {/* SUMMARY CARDS */}
        <div className="row mb-4">
          <div className="col-md-4">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted mb-2">
                  Total Incidents
                </h6>
                <h2 className="fw-bold text-primary">
                  {incidents.length}
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-4">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted mb-2">
                  High Severity
                </h6>
                <h2 className="fw-bold text-danger">
                  {
                    incidents.filter(
                      (i) => i.severity === "HIGH"
                    ).length
                  }
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-4">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted mb-2">
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
        </div>

        {/* MAIN CARD */}
        <div className="card shadow border-0">

          {/* HEADER */}
          <div className="card-header bg-white">

            <div className="d-flex justify-content-between align-items-center flex-wrap gap-3">

              <div>
                <h4 className="card-title fw-bold mb-1">
                  Incident Report Register
                </h4>

                <small className="text-muted">
                  View, filter and export incident reports
                </small>
              </div>

              <div className="d-flex align-items-center gap-2 flex-wrap">

                <div>
                  <small className="text-muted d-block">
                    From
                  </small>

                  <input
                    type="date"
                    className="form-control"
                    value={fromDate}
                    onChange={(e) =>
                      setFromDate(e.target.value)
                    }
                  />
                </div>

                <div>
                  <small className="text-muted d-block">
                    To
                  </small>

                  <input
                    type="date"
                    className="form-control"
                    value={toDate}
                    onChange={(e) =>
                      setToDate(e.target.value)
                    }
                  />
                </div>

                <button
                  className="btn btn-primary mt-4"
                  onClick={() => { }}
                >
                  <i className="fa fa-filter me-2"></i>
                  Filter
                </button>

                <button
                  className="btn btn-danger mt-4"
                  onClick={exportIncidentsPDF}
                >
                  <i className="fa fa-file-pdf me-2"></i>
                  Export PDF
                </button>
              </div>

            </div>

          </div>

          {/* BODY */}
          <div className="card-body">

            <div className="table-responsive">

              <table className="table table-hover align-middle">

                <thead className="table-warning">
                  <tr>
                    <th>#</th>
                    <th>Asset</th>
                    <th>Location</th>
                    <th>Incident Title</th>
                    <th>Description</th>
                    <th>Date Reported</th>
                    <th>Severity</th>
                    <th>Status</th>
                    <th>PDF</th>
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
                  ) : filteredIncidents.length === 0 ? (
                    <tr>
                      <td
                        colSpan="9"
                        className="text-center py-5"
                      >
                        <div className="text-muted">
                          No incidents found
                        </div>
                      </td>
                    </tr>
                  ) : (
                    filteredIncidents.map(
                      (incident, index) => (
                        <tr key={incident.incidentId}>

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
                                  ?.assetType
                              }
                            </small>
                          </td>

                          <td>
                            {
                              incident.asset
                                ?.location
                            }
                          </td>

                          <td>
                            <div className="fw-semibold">
                              {
                                incident.incidentTitle
                              }
                            </div>
                          </td>

                          <td
                            style={{
                              maxWidth: "300px",
                              whiteSpace:
                                "normal",
                            }}
                          >
                            {
                              incident.description
                            }
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
                            <span
                              className={`badge ${incident.status
                                  ? "bg-success"
                                  : "bg-secondary"
                                }`}
                            >
                              {incident.status ||
                                "OPEN"}
                            </span>
                          </td>

                          <td>
                            <button
                              className="btn btn-outline-danger btn-sm"
                              title="Export PDF"
                            >
                              <i className="fa fa-file-pdf"></i>
                            </button>
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