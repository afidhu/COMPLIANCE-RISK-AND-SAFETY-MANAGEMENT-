import React, { useEffect, useState } from "react";
import axios from "axios";
import { useNavigate, useParams, useLocation } from "react-router-dom";
import BaseUrl from "../utils/api_provider/ApiProviders";

interface LocationState {
  incidentId?: string;
}
export default function UpdateIncident() {
  const navigate = useNavigate();
  const { id } = useParams<{ id?: string }>();
  const { state } = useLocation() as { state: LocationState };

  const [loading, setLoading] = useState(false);
  const [fetching, setFetching] = useState(false);
  const [assets, setAssets] = useState([]);

  const [formData, setFormData] = useState({
    assetId: "",
    incidentTitle: state?.incidentTitle || "",
    description: state?.description || "",
    incidentDate: "",
    severity: "MEDIUM",
    status: "OPEN",
  });

  // ======================
  // LOAD ASSETS
  // ======================
  const getAssets = async () => {
    try {
      const res = await axios.get(`${BaseUrl}/assets/get`);
      setAssets(res.data);
    } catch (error) {
      console.log("Assets error:", error);
    }
  };

  // ======================
  // LOAD INCIDENT DATA
  // ======================
  const getIncidentById = async (incidentId: string) => {
    try {
      setFetching(true);
      const res = await axios.get(`${BaseUrl}/incidents/get/${incidentId}`);
      const incident = res.data;

      setFormData({
        assetId: incident.assetId || "",
        incidentTitle: incident.incidentTitle || "",
        description: incident.description || "",
        incidentDate: incident.incidentDate 
          ? new Date(incident.incidentDate).toISOString().split('T')[0]
          : "",
        severity: incident.severity || "MEDIUM",
        status: incident.status || "OPEN",
      });
    } catch (error) {
      console.log("Error fetching incident:", error);
      alert("Failed to load incident data");
    } finally {
      setFetching(false);
    }
  };

  useEffect(() => {
    getAssets();

    // Get incident ID from URL params or navigation state
    const incidentId = id || state?.incidentId;
    if (incidentId) {
      getIncidentById(incidentId);
    }
  }, [id, state]);

  // ======================
  // HANDLE INPUT CHANGE
  // ======================
  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  // ======================
  // UPDATE INCIDENT
  // ======================
  const updateIncident = async (e) => {
    e.preventDefault();

    try {
      setLoading(true);

      const payload = {
        assetId: formData.assetId,
        incidentTitle: formData.incidentTitle,
        description: formData.description,
        incidentDate: new Date(formData.incidentDate).toISOString(),
        severity: formData.severity,
        status: formData.status,
      };

      const incidentId = id || state?.incidentId;
      await axios.put(`${BaseUrl}/incidents/update/${incidentId}`, payload);

      alert("Incident updated successfully");
      navigate("/Incidents");
    } catch (error) {
      console.log(error);
      alert(error?.response?.data?.message || "Failed to update incident");
    } finally {
      setLoading(false);
    }
  };

  if (fetching) {
    return (
      <div className="container">
        <div className="page-inner">
          <div className="text-center py-5">
            <div className="spinner-border text-primary" role="status">
              <span className="visually-hidden">Loading...</span>
            </div>
            <p className="mt-3">Loading incident data...</p>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div className="container">
      <div className="page-inner">

        {/* HEADER */}
        <div className="page-header">
          <h3 className="fw-bold mb-3">
            Update Incident Report
          </h3>

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
              <a href="#">Incidents</a>
            </li>

            <li className="separator">
              <i className="icon-arrow-right"></i>
            </li>

            <li className="nav-item">
              <a href="#">Update Incident</a>
            </li>
          </ul>
        </div>

        {/* CARD */}
        <div className="card shadow-sm border-0">

          <div className="card-header bg-white">
            <h4 className="card-title mb-0">
              Incident Information
            </h4>
          </div>

          <div className="card-body">

            <form onSubmit={updateIncident}>

              {/* ASSET */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Asset
                </label>

                <select
                  className="form-select py-3"
                  name="assetId"
                  value={formData.assetId}
                  onChange={handleChange}
                  required
                >
                  <option value="">
                    Select Asset
                  </option>

                  {assets.map((asset) => (
                    <option
                      key={asset.assetId}
                      value={asset.assetId}
                    >
                      {asset.assetName} - {asset.location}
                    </option>
                  ))}
                </select>
              </div>

              {/* TITLE */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Incident Title
                </label>

                <input
                  type="text"
                  className="form-control py-3"
                  placeholder="Enter incident title"
                  name="incidentTitle"
                  value={formData.incidentTitle}
                  onChange={handleChange}
                  required
                />
              </div>

              {/* DESCRIPTION */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Description
                </label>

                <textarea
                  rows={5}
                  className="form-control"
                  placeholder="Describe incident..."
                  name="description"
                  value={formData.description}
                  onChange={handleChange}
                  required
                />
              </div>

              {/* DATE */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Incident Date
                </label>

                <input
                  type="date"
                  className="form-control py-3"
                  name="incidentDate"
                  value={formData.incidentDate}
                  onChange={handleChange}
                  required
                />
              </div>

              {/* SEVERITY */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Severity
                </label>

                <select
                  className="form-select py-3"
                  name="severity"
                  value={formData.severity}
                  onChange={handleChange}
                  required
                >
                  <option value="LOW">Low</option>
                  <option value="MEDIUM">Medium</option>
                  <option value="HIGH">High</option>
                  <option value="CRITICAL">Critical</option>
                </select>
              </div>

              {/* STATUS */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Status
                </label>

                <select
                  className="form-select py-3"
                  name="status"
                  value={formData.status}
                  onChange={handleChange}
                  required
                >
                  <option value="OPEN">Open</option>
                  <option value="ESCALATED">Escalated</option>
                  <option value="MONITORING">Monitoring</option>
                  <option value="CLOSED">Closed</option>
                </select>
              </div>

              {/* BUTTONS */}
              <div className="d-flex justify-content-end gap-3 mt-4">

                <button
                  type="button"
                  onClick={() => navigate("/Incidents")}
                  className="btn btn-light px-4 py-2 fw-semibold"
                >
                  <i className="fas fa-arrow-left me-2"></i>
                  Back
                </button>

                <button
                  type="submit"
                  disabled={loading}
                  className="btn text-white px-4 py-2 fw-semibold"
                  style={{
                    background: "#1e66ff",
                    minWidth: "180px",
                  }}
                >
                  {loading ? (
                    <>
                      <span className="spinner-border spinner-border-sm me-2"></span>
                      Updating...
                    </>
                  ) : (
                    <>
                      <i className="fas fa-save me-2"></i>
                      Update Incident
                    </>
                  )}
                </button>

              </div>

            </form>

          </div>

        </div>

      </div>
    </div>
  );
}