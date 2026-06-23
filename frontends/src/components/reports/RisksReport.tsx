import React, { useEffect, useState } from "react";
import axios from "axios";
import jsPDF from "jspdf";
import autoTable from "jspdf-autotable";
import BaseUrl from "../utils/api_provider/ApiProviders";

export default function RisksReport() {
  const [risks, setRisks] = useState([]);
  const [loading, setLoading] = useState(false);

  const getRisks = async () => {
    try {
      setLoading(true);

      const response = await axios.get(
        `${BaseUrl}/risks/get`
      );

      setRisks(response.data);
    } catch (error) {
      console.log(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getRisks();
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
      case "OPEN":
        return "badge bg-danger";
      case "IN_PROGRESS":
        return "badge bg-warning text-dark";
      case "CLOSED":
        return "badge bg-success";
      default:
        return "badge bg-secondary";
    }
  };

  const exportRisksPDF = () => {
    const doc = new jsPDF();

    doc.setFontSize(20);
    doc.text("COMPLIANCE MANAGEMENT SYSTEM", 14, 15);

    doc.setFontSize(14);
    doc.text("Risk Assessment Report", 14, 25);

    doc.setFontSize(10);
    doc.text(
      `Generated On: ${new Date().toLocaleString()}`,
      14,
      32
    );

    doc.text(`Total Risks: ${risks.length}`, 14, 38);

    autoTable(doc, {
      startY: 45,
      head: [
        [
          "#",
          "Asset",
          "Hazard",
          "Risk",
          "Likelihood",
          "Severity",
          "Status",
        ],
      ],
      body: risks.map((item, index) => [
        index + 1,
        item.hazard?.asset?.assetName || "-",
        item.hazard?.hazardTitle || "-",
        item.riskTitle,
        item.likelihood,
        item.severity,
        item.status,
      ]),
      styles: {
        fontSize: 8,
      },
      headStyles: {
        fillColor: [220, 53, 69],
      },
    });

    doc.save("Risk_Report.pdf");
  };

  return (
    <div className="container-fluid">
      <div className="page-inner">

        {/* PAGE HEADER */}
        <div className="page-header mb-4">
          <h3 className="fw-bold mb-2">
            Risk Assessment Reports
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
              <a href="#">Risks</a>
            </li>
          </ul>
        </div>

        {/* SUMMARY CARDS */}
        <div className="row mb-4">

          <div className="col-md-3">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted">
                  Total Risks
                </h6>
                <h2 className="fw-bold text-primary">
                  {risks.length}
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted">
                  High Risks
                </h6>
                <h2 className="fw-bold text-danger">
                  {
                    risks.filter(
                      (r) => r.severity === "HIGH"
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
                  Medium Risks
                </h6>
                <h2 className="fw-bold text-warning">
                  {
                    risks.filter(
                      (r) => r.severity === "MEDIUM"
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
                  Open Risks
                </h6>
                <h2 className="fw-bold text-danger">
                  {
                    risks.filter(
                      (r) => r.status === "OPEN"
                    ).length
                  }
                </h2>
              </div>
            </div>
          </div>

        </div>

        {/* MAIN CARD */}
        <div className="card shadow border-0">

          <div className="card-header bg-white d-flex justify-content-between align-items-center">

            <div>
              <h4 className="card-title fw-bold mb-1">
                Risk Management Register
              </h4>

              <small className="text-muted">
                View and export all identified risks
              </small>
            </div>

            <button
              className="btn btn-danger"
              onClick={exportRisksPDF}
            >
              <i className="fa fa-file-pdf me-2"></i>
              Export PDF
            </button>

          </div>

          <div className="card-body">

            <div className="table-responsive">

              <table className="table table-hover align-middle">

                <thead className="table-danger">
                  <tr>
                    <th>#</th>
                    <th>Asset</th>
                    <th>Hazard</th>
                    <th>Risk Title</th>
                    <th>Description</th>
                    <th>Likelihood</th>
                    <th>Severity</th>
                    <th>Status</th>
                  </tr>
                </thead>

                <tbody>

                  {loading ? (
                    <tr>
                      <td
                        colSpan="8"
                        className="text-center py-5"
                      >
                        <div
                          className="spinner-border text-danger"
                          role="status"
                        />
                      </td>
                    </tr>
                  ) : risks.length === 0 ? (
                    <tr>
                      <td
                        colSpan="8"
                        className="text-center py-5"
                      >
                        No Risk Records Found
                      </td>
                    </tr>
                  ) : (
                    risks.map((risk, index) => (
                      <tr key={risk.riskId}>
                        <td>
                          <strong>
                            RSK-{index + 1}
                          </strong>
                        </td>

                        <td>
                          <div className="fw-semibold">
                            {
                              risk.hazard?.asset
                                ?.assetName
                            }
                          </div>

                          <small className="text-muted">
                            {
                              risk.hazard?.asset
                                ?.location
                            }
                          </small>
                        </td>

                        <td>
                          {
                            risk.hazard
                              ?.hazardTitle
                          }
                        </td>

                        <td>
                          {risk.riskTitle}
                        </td>

                        <td
                          style={{
                            maxWidth: "300px",
                            whiteSpace:
                              "normal",
                          }}
                        >
                          {
                            risk.riskDescription
                          }
                        </td>

                        <td>
                          <span className="badge bg-info">
                            {risk.likelihood}
                          </span>
                        </td>

                        <td>
                          <span
                            className={getSeverityBadge(
                              risk.severity
                            )}
                          >
                            {risk.severity}
                          </span>
                        </td>

                        <td>
                          <span
                            className={getStatusBadge(
                              risk.status
                            )}
                          >
                            {risk.status}
                          </span>
                        </td>
                      </tr>
                    ))
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