import React, { useContext, useEffect, useState } from "react";
import axios from "axios";
import { UserContext } from "../includes/AuthContext";
import { useNavigate } from "react-router-dom";
import BaseUrl from "../utils/api_provider/ApiProviders";

export default function AddIncident() {
  const navigate = useNavigate();
  const context = useContext(UserContext);
  const { user } = context;

  const userId = user?.userId;

  const [loading, setLoading] = useState(false);
  const [assets, setAssets] = useState([]);

  const [formData, setFormData] = useState({
    assetId: "",
    incidentTitle: "",
    description: "",
    incidentDate: "",
  });

  // ======================
  // LOAD ASSETS
  // ======================
  const getAssets = async () => {
    try {
      const res = await axios.get(
        `${BaseUrl}/assets/get`
      );
      setAssets(res.data);
    } catch (error) {
      console.log("Assets error:", error);
    }
  };

  useEffect(() => {
    getAssets();
  }, []);

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
  // SUBMIT INCIDENT
  // ======================
  const saveIncident = async (e) => {
    e.preventDefault();

    try {
      setLoading(true);

      const payload = {
        assetId: formData.assetId,
        incidentTitle: formData.incidentTitle,
        description: formData.description,
        incidentDate: new Date(
          formData.incidentDate
        ).toISOString(),
        reportedById: userId,
      };

      await axios.post(
        `${BaseUrl}/incidents/add`,
        payload
      );

      alert("Incident created successfully");

      navigate("/Incidents");
    } catch (error) {
      console.log(error);
      alert(
        error?.response?.data?.message ||
          "Failed to create incident"
      );
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="container">
      <div className="page-inner">

        {/* HEADER */}
        <div className="page-header">
          <h3 className="fw-bold mb-3">
            Add Incident Report
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
              <a href="#">Add Incident</a>
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

            <form onSubmit={saveIncident}>

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
                      {asset.assetName} -{" "}
                      {asset.location}
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

              {/* REPORTED BY */}
              <div className="mb-4">
                <label className="form-label fw-semibold">
                  Reported By
                </label>

                <input
                  type="text"
                  className="form-control py-3"
                  value={user?.fullName || ""}
                  readOnly
                />
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
                      Saving...
                    </>
                  ) : (
                    <>
                      <i className="fas fa-save me-2"></i>
                      Save Incident
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