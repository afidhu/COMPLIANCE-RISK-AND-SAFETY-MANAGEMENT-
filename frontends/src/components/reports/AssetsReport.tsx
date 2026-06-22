
import React, { useEffect, useState } from "react";
import axios from "axios";
import jsPDF from "jspdf";
import autoTable from "jspdf-autotable";

export default function AssetsReport() {
  const [assets, setAssets] = useState([]);
  const [loading, setLoading] = useState(false);

  const getAssets = async () => {
    try {
      setLoading(true);

      const response = await axios.get(
        "http://localhost:51213/assets/get"
      );

      setAssets(response.data);
    } catch (error) {
      console.error("Error fetching assets:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getAssets();
  }, []);

  const getStatusBadge = (status) => {
    switch (status) {
      case "ACTIVE":
        return "badge bg-success";
      case "INACTIVE":
        return "badge bg-secondary";
      case "MAINTENANCE":
        return "badge bg-warning text-dark";
      case "FAULTY":
        return "badge bg-danger";
      default:
        return "badge bg-primary";
    }
  };

  const getAssetIcon = (type) => {
    switch (type) {
      case "BOILER":
        return "fas fa-fire";
      case "ELECTRICAL_DEVICE":
        return "fas fa-bolt";
      case "GENERATOR":
        return "fas fa-cogs";
      case "LIFT":
        return "fas fa-elevator";
      case "FIRE_EXTINGUISHER":
        return "fas fa-fire-extinguisher";
      case "CCTV":
        return "fas fa-video";
      default:
        return "fas fa-box";
    }
  };

  const exportAssetsPDF = () => {
    const doc = new jsPDF();

    doc.setFontSize(20);
    doc.text("COMPLIANCE MANAGEMENT SYSTEM", 14, 15);

    doc.setFontSize(14);
    doc.text("Asset Register Report", 14, 25);

    doc.setFontSize(10);
    doc.text(
      `Generated On: ${new Date().toLocaleString()}`,
      14,
      32
    );

    doc.text(
      `Total Assets: ${assets.length}`,
      14,
      38
    );

    autoTable(doc, {
      startY: 45,
      head: [
        [
          "#",
          "Asset Name",
          "Asset Type",
          "Location",
          "Serial No",
          "Status",
        ],
      ],
      body: assets.map((item, index) => [
        index + 1,
        item.assetName,
        item.assetType,
        item.location,
        item.serialNo || "-",
        item.status,
      ]),
      styles: {
        fontSize: 8,
      },
      headStyles: {
        fillColor: [13, 110, 253],
      },
    });

    doc.save("Asset_Report.pdf");
  };

  return (
    <div className="container-fluid">
      <div className="page-inner">

        {/* PAGE HEADER */}
        <div className="page-header mb-4">
          <h3 className="fw-bold mb-2">
            Asset Register Reports
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
              <a href="#">Assets</a>
            </li>
          </ul>
        </div>

        {/* SUMMARY CARDS */}
        <div className="row mb-4">

          <div className="col-md-4">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted">
                  Total Assets
                </h6>
                <h2 className="fw-bold text-primary">
                  {assets.length}
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-4">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted">
                  Active Assets
                </h6>
                <h2 className="fw-bold text-success">
                  {
                    assets.filter(
                      (a) => a.status === "ACTIVE"
                    ).length
                  }
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-4">
            <div className="card shadow-sm border-0">
              <div className="card-body">
                <h6 className="text-muted">
                  Asset Types
                </h6>
                <h2 className="fw-bold text-info">
                  {
                    new Set(
                      assets.map(
                        (a) => a.assetType
                      )
                    ).size
                  }
                </h2>
              </div>
            </div>
          </div>

        </div>

        {/* MAIN CARD */}
        <div className="card shadow border-0">

          {/* CARD HEADER */}
          <div className="card-header bg-white d-flex justify-content-between align-items-center">

            <div>
              <h4 className="card-title fw-bold mb-1">
                Asset Management Register
              </h4>

              <small className="text-muted">
                View and export all registered assets
              </small>
            </div>

            <button
              className="btn btn-primary"
              onClick={exportAssetsPDF}
            >
              <i className="fa fa-file-pdf me-2"></i>
              Export PDF
            </button>

          </div>

          {/* CARD BODY */}
          <div className="card-body">

            <div className="table-responsive">

              <table className="table table-hover align-middle">

                <thead className="table-primary">
                  <tr>
                    <th>#</th>
                    <th>Asset Name</th>
                    <th>Asset Type</th>
                    <th>Location</th>
                    <th>Serial Number</th>
                    <th>Status</th>
                    <th>Created Date</th>
                  </tr>
                </thead>

                <tbody>

                  {loading ? (
                    <tr>
                      <td
                        colSpan="7"
                        className="text-center py-5"
                      >
                        <div
                          className="spinner-border text-primary"
                          role="status"
                        />
                      </td>
                    </tr>
                  ) : assets.length === 0 ? (
                    <tr>
                      <td
                        colSpan="7"
                        className="text-center py-5"
                      >
                        <div className="text-muted">
                          No Assets Found
                        </div>
                      </td>
                    </tr>
                  ) : (
                    assets.map((asset, index) => (
                      <tr key={asset.assetId}>

                        <td>
                          <strong className="text-primary">
                            AST-{index + 1}
                          </strong>
                        </td>

                        <td>
                          <div className="d-flex align-items-center">

                            <div
                              className="rounded-circle bg-light d-flex align-items-center justify-content-center me-3"
                              style={{
                                width: "40px",
                                height: "40px",
                              }}
                            >
                              <i
                                className={`${getAssetIcon(
                                  asset.assetType
                                )} text-primary`}
                              ></i>
                            </div>

                            <div>
                              <div className="fw-semibold">
                                {asset.assetName}
                              </div>

                              <small className="text-muted">
                                {asset.assetId.substring(
                                  0,
                                  10
                                )}
                                ...
                              </small>
                            </div>

                          </div>
                        </td>

                        <td>
                          <span className="badge bg-info">
                            {asset.assetType}
                          </span>
                        </td>

                        <td>
                          <i className="fa fa-map-marker-alt text-danger me-2"></i>
                          {asset.location}
                        </td>

                        <td>
                          {asset.serialNo || (
                            <span className="text-muted">
                              Not Assigned
                            </span>
                          )}
                        </td>

                        <td>
                          <span
                            className={getStatusBadge(
                              asset.status
                            )}
                          >
                            {asset.status}
                          </span>
                        </td>

                        <td>
                          {new Date(
                            asset.createdAt
                          ).toLocaleDateString()}
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