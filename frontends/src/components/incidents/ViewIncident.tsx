import React, { useEffect, useState } from "react";
import BaseUrl from "../utils/api_provider/ApiProviders";
import axios from "axios";
import { useParams } from "react-router-dom";

export default function ViewIncident() {

  const { id } = useParams();

  const [incident, setIncident] = useState(null);
  const [loading, setLoading] = useState(true);

  const incidentDetails = async () => {
    try {
      setLoading(true);

      const response = await axios.get(
        `${BaseUrl}/incidents/get/${id}`
      );

      setIncident(response.data);
    } catch (error) {
      console.log(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    incidentDetails();
  }, [id]);

  const formatDate = (date) => {
    if (!date) return "-";

    return new Date(date).toLocaleDateString("en-GB", {
      year: "numeric",
      month: "long",
      day: "numeric",
    });
  };

  const severityBadge = (severity) => {
    switch (severity) {
      case "LOW":
        return "success";

      case "MEDIUM":
        return "warning";

      case "HIGH":
        return "danger";

      case "CRITICAL":
        return "dark";

      default:
        return "secondary";
    }
  };

  const statusBadge = (status) => {
    switch (status) {
      case "ACTIVE":
        return "success";

      case "INACTIVE":
        return "secondary";

      case "OUT_OF_SERVICE":
        return "danger";

      default:
        return "primary";
    }
  };

  if (loading) {
    return (
      <div className="container mt-5 text-center">
        <div
          className="spinner-border text-primary"
          style={{ width: 60, height: 60 }}
        ></div>

        <h4 className="mt-4">
          Loading Incident...
        </h4>
      </div>
    );
  }

  if (!incident) {
    return (
      <div className="container mt-5">
        <div className="alert alert-danger">
          Incident not found.
        </div>
      </div>
    );
  }

  return (
    <div className="container">
      <div className="page-inner">

        {/* HEADER */}

        <div className="page-header mb-4">

          <h2 className="fw-bold text-primary">
            <i className="fa fa-triangle-exclamation me-2"></i>

            Incident Details
          </h2>

        </div>

        {/* TOP HEADER */}

        <div className="card border-0 shadow mb-4">

          <div
            className="card-body text-white"
            style={{
              background:
                "linear-gradient(135deg,#1e66ff,#0d47a1)",
              borderRadius: 10,
            }}
          >

            <div className="row align-items-center">

              <div className="col-md-8">

                <h2 className="fw-bold">
                  {incident.incidentTitle}
                </h2>

                <p className="mb-0">
                  description:{" "}
                  <strong>
                   {incident.description}
                  </strong>
                </p>

              </div>

              <div className="col-md-4 text-end">

                <span
                  className={`badge bg-${severityBadge(
                    incident.severity
                  )} fs-6 px-3 py-2`}
                >
                  {incident.severity}
                </span>

                <br />

                <span className="badge bg-secondary fs-6 mt-3 px-3 py-2">

                  {incident.status || "OPEN"}

                </span>

              </div>

            </div>

          </div>

        </div>

        {/* ASSET CARD */}

        <div className="card border-0 shadow mb-4">

          <div className="card-header bg-primary text-white">

            <h4 className="mb-0">

              <i className="fa fa-building me-2"></i>

              Related Asset

            </h4>

          </div>

          <div className="card-body">

            <div className="row">

              <div className="col-md-2 text-center">

                <div
                  className="rounded-circle bg-primary text-white d-flex align-items-center justify-content-center mx-auto"
                  style={{
                    width: 90,
                    height: 90,
                    fontSize: 35,
                  }}
                >

                  <i className="fa fa-industry"></i>

                </div>

              </div>

              <div className="col-md-10">

                <div className="row">

                  <div className="col-md-4 mb-4">

                    <small className="text-muted">

                      Asset Name

                    </small>

                    <h5>

                      {incident.asset.assetName}

                    </h5>

                  </div>

                  <div className="col-md-4 mb-4">

                    <small className="text-muted">

                      Asset Type

                    </small>

                    <h5>

                      {incident.asset.assetType}

                    </h5>

                  </div>

                  <div className="col-md-4 mb-4">

                    <small className="text-muted">

                      Location

                    </small>

                    <h5>

                      {incident.asset.location}

                    </h5>

                  </div>

                  <div className="col-md-4 mb-4">

                    <small className="text-muted">

                      Asset Status

                    </small>

                    <br />

                    <span
                      className={`badge bg-${statusBadge(
                        incident.asset.status
                      )}`}
                    >
                      {incident.asset.status}
                    </span>

                  </div>

                  <div className="col-md-4 mb-4">

                    <small className="text-muted">

                      Serial Number

                    </small>

                    <h5>

                      {incident.asset.serialNo || "N/A"}

                    </h5>

                  </div>

                  <div className="col-md-4 mb-4">

                    <small className="text-muted">

                      Asset ID

                    </small>

                    <h6>

                      {incident.asset.assetId}

                    </h6>

                  </div>

                </div>

              </div>

            </div>

          </div>

        </div>
                {/* REPORTER INFORMATION */}

        <div className="card border-0 shadow mb-4">

          <div className="card-header bg-success text-white">

            <h4 className="mb-0">
              <i className="fa fa-user me-2"></i>
              Reporter Information
            </h4>

          </div>

          <div className="card-body">

            <div className="row">

              <div className="col-md-3 mb-4">
                <small className="text-muted">Full Name</small>

                <h5>
                  {incident.reportedBy?.fullName}
                </h5>
              </div>

              <div className="col-md-3 mb-4">
                <small className="text-muted">Email</small>

                <h6>
                  {incident.reportedBy?.email}
                </h6>
              </div>

              <div className="col-md-2 mb-4">
                <small className="text-muted">Role</small>

                <h6>
                  {incident.reportedBy?.role}
                </h6>
              </div>

              <div className="col-md-2 mb-4">
                <small className="text-muted">Phone</small>

                <h6>
                  {incident.reportedBy?.phone}
                </h6>
              </div>

              <div className="col-md-2 mb-4">

                <small className="text-muted">
                  Account Status
                </small>

                <br />

                <span
                  className={`badge bg-${statusBadge(
                    incident.reportedBy?.status
                  )}`}
                >
                  {incident.reportedBy?.status}
                </span>

              </div>

            </div>

          </div>

        </div>

        {/* INCIDENT DETAILS */}

        <div className="card border-0 shadow">

          <div className="card-header bg-danger text-white">

            <h4 className="mb-0">

              <i className="fa fa-file-circle-exclamation me-2"></i>

              Incident Information

            </h4>

          </div>

          <div className="card-body">

            <div className="row">

              <div className="col-md-4 mb-4">

                <small className="text-muted">
                  Incident Date
                </small>

                <h5>
                  {formatDate(incident.incidentDate)}
                </h5>

              </div>

              <div className="col-md-4 mb-4">

                <small className="text-muted">
                  Created At
                </small>

                <h5>
                  {formatDate(incident.createdAt)}
                </h5>

              </div>

              <div className="col-md-4 mb-4">

                <small className="text-muted">
                  Severity
                </small>

                <br />

                <span
                  className={`badge bg-${severityBadge(
                    incident.severity
                  )} fs-6`}
                >
                  {incident.severity}
                </span>

              </div>

              <div className="col-md-6 mb-4">

                <small className="text-muted">
                  Related Risk
                </small>

                {incident.risk ? (

                  <div className="mt-2">

                    <h5>
                      {incident.risk.riskTitle}
                    </h5>

                    <p className="text-muted mb-0">
                      {incident.risk.riskDescription}
                    </p>

                  </div>

                ) : (

                  <div className="alert alert-warning mt-2 mb-0">

                    <i className="fa fa-circle-info me-2"></i>

                    No Risk Linked To This Incident

                  </div>

                )}

              </div>

              <div className="col-md-6 mb-4">

                <small className="text-muted">

                  Current Status

                </small>

                <br />

                <span className="badge bg-primary fs-6">

                  {incident.status || "OPEN"}

                </span>

              </div>

              <div className="col-md-12">

                <small className="text-muted">

                  Description

                </small>

                <div
                  className="mt-2 p-4 rounded border"
                  style={{
                    background: "#f8fafc",
                    minHeight: 120,
                    fontSize: "15px",
                    lineHeight: "28px",
                  }}
                >

                  {incident.description}

                </div>

              </div>

            </div>

          </div>

        </div>

      </div>
    </div>
  );
}