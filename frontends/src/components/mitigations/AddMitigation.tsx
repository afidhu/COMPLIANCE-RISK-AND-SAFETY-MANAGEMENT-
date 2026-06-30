import axios from "axios";
import React, { useEffect, useState } from "react";
import BaseUrl from "../utils/api_provider/ApiProviders";

interface AddMitigationProps {
  hadazardId: string | number;
  hadazardTitle: string;
}

interface Technician {
  userId: string | number;
  fullName: string;
}

export default function AddMitigation({ hadazardId, hadazardTitle }: AddMitigationProps) {
  const [loading, setLoading] = useState(false);
  const [technicians, setTechnicians] = useState<Technician[]>([]);
  const [formData, setFormData] = useState({
    hadazardId: hadazardId,
    action_title: "",
    assigned_to: "",
    target_date: "",
    // status: "",
  });

  const fetchTechnicians = async () => {
    try {
      const response = await axios.get(`${BaseUrl}/auth/users/technician`);
      console.log(response.data);
      setTechnicians(response.data);
      
      // Optional: Set default technician if data exists
      if (response.data && response.data.length > 0) {
        setFormData((prev) => ({
          ...prev,
          assigned_to: response.data[0].userId.toString(),
        }));
      }
    } catch (error) {
      console.error("Error fetching technicians:", error);
    }
  };

  useEffect(() => {
    fetchTechnicians();
  }, []);

  // Sync internal form data if parent props change
  useEffect(() => {
    setFormData((prev) => ({ ...prev, hadazardId }));
  }, [hadazardId]);

  // Fixed the ReferenceError by using formData.assigned_to
  const selectedUser = technicians.find(
    (item) => item.userId?.toString() === formData.assigned_to.toString()
  );

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>
  ) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      setLoading(true);

      const response = await axios.post(
        `${BaseUrl}/mitigations/add`,
        {
          hazardId: formData.hadazardId,
          actionTitle: formData.action_title,
          assignedToId: selectedUser?.userId || formData.assigned_to,
          targetDate: formData.target_date,
          // status: formData.status,
        }
      );

      alert("Mitigation Action Added Successfully");
      console.log(response.data);

      // Reset form fields
      setFormData({
        hadazardId: hadazardId,
        action_title: "",
        assigned_to: "",
        target_date: "",
        // status: "",
      });
    window.location.reload()
    } catch (error: any) {
      console.error(error);
      alert(
        error.response?.data?.message ||
        "Failed to save mitigation."
      );
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="container-fluid py-4">
      <div className="row justify-content-center">
        <div className="col-lg-12">

          <div className="card shadow border-0 rounded-4">

            {/* Header */}
            <div
              className="card-header text-white py-4"
              style={{ background: "#0f172a" }}
            >
              <h3 className="mb-1 fw-bold">
                Add Mitigation Action
              </h3>
              <p className="mb-0 opacity-75">
                Create and assign a mitigation action for identified risks.
              </p>
            </div>

            {/* Form */}
            <div className="card-body p-4">

              <form onSubmit={handleSubmit}>

                {/* Risk ID */}
                <div className="mb-4">
                  <label className="form-label fw-semibold">
                    Hazard Name
                  </label>
                  <div className="input-group">
                    <span className="input-group-text bg-light">
                      <i className="fas fa-triangle-exclamation text-primary"></i>
                    </span>
                    <input
                      type="text"
                      name="hadazardId"
                      value={hadazardTitle}
                      readOnly
                      className="form-control bg-light"
                    />
                  </div>
                </div>

                {/* Action Title */}
                <div className="mb-4">
                  <label className="form-label fw-semibold">
                    Action Title
                  </label>
                  <div className="input-group">
                    <span className="input-group-text bg-light">
                      <i className="fas fa-list-check text-primary"></i>
                    </span>
                    <input
                      type="text"
                      name="action_title"
                      value={formData.action_title}
                      onChange={handleChange}
                      className="form-control"
                      placeholder="Enter Action Title"
                      required
                      disabled={loading}
                    />
                  </div>
                </div>

                {/* Assigned To */}
                <div className="mb-4">
                  <label className="form-label fw-semibold">
                    Assigned To
                  </label>
                  <div className="input-group">
                    <span className="input-group-text bg-light">
                      <i className="fas fa-user-gear text-primary"></i>
                    </span>
                    <select
                      name="assigned_to"
                      value={formData.assigned_to}
                      onChange={handleChange}
                      className="form-select"
                      required
                      disabled={loading}
                    >
                      <option value="">
                        Select Technician
                      </option>
                      {technicians.map((item) => (
                        <option key={item.userId} value={item.userId}>
                          {item.fullName}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>

                {/* Target Date */}
                <div className="mb-4">
                  <label className="form-label fw-semibold">
                    Target Date
                  </label>
                  <div className="input-group">
                    <span className="input-group-text bg-light">
                      <i className="fas fa-calendar-days text-primary"></i>
                    </span>
                    <input
                      type="date"
                      name="target_date"
                      value={formData.target_date}
                      onChange={handleChange}
                      className="form-control"
                      required
                      disabled={loading}
                      style={{ colorScheme: 'light' }}
                    />
                  </div>
                </div>

                {/* Status */}
                {/* <div className="mb-4">
                  <label className="form-label fw-semibold">
                    Status
                  </label>
                  <div className="input-group">
                    <span className="input-group-text bg-light">
                      <i className="fas fa-circle-check text-primary"></i>
                    </span>
                    <select
                      name="status"
                      value={formData.status}
                      onChange={handleChange}
                      className="form-select"
                      required
                      disabled={loading}
                    >
                      <option value="">
                        Select Status
                      </option>
                      <option value="Pending">
                        Pending
                      </option>
                      <option value="In Progress">
                        In Progress
                      </option>
                      <option value="Completed">
                        Completed
                      </option>
                      <option value="Overdue">
                        Overdue
                      </option>
                    </select>
                  </div>
                </div> */}

                {/* Buttons */}
                <div className="d-flex justify-content-end gap-3 mt-5">
                  <button
                    type="button"
                    className="btn btn-light px-4 py-2"
                    disabled={loading}
                  >
                    Cancel
                  </button>
                  <button
                    type="submit"
                    className="btn text-white px-4 py-2"
                    style={{ background: "#1e66ff" }}
                    disabled={loading}
                  >
                    <i className="fas fa-save me-2"></i>
                    {loading ? "Saving..." : "Save Mitigation Action"}
                  </button>
                </div>

              </form>

            </div>

          </div>

        </div>
      </div>
    </div>
  );
}
