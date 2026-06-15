
import React, { useState } from "react";

export default function AddMitigation({hadazardId,hadazardTitle}) {
  const [formData, setFormData] = useState({
    hadazardId: hadazardId,
    action_title: "",
    assigned_to: "",
    target_date: "",
    status: "",
  });

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>
  ) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    console.log(formData);

    alert("Mitigation Action Added Successfully");
  };

  return (
    <div className="container-fluid py-4">
      <div className="row justify-content-center">
        <div className="col-lg-12">

          <div className="card shadow border-0 rounded-4">

            {/* Header */}
            <div
              className="card-header text-white py-4"
              style={{
                background: "#0f172a",
              }}
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
                  hadazard Name
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
                      onChange={handleChange}
                      className="form-control"
                     
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
                    >
                      <option value="">
                        Select Technician
                      </option>

                      <option value="TECH-001">
                        Technician A
                      </option>

                      <option value="TECH-002">
                        Technician B
                      </option>

                      <option value="TECH-003">
                        Technician C
                      </option>

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
                      style={{colorScheme:'light'}}
                    />

                  </div>
                </div>

                {/* Status */}
                <div className="mb-4">
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
                </div>

                {/* Buttons */}
                <div className="d-flex justify-content-end gap-3 mt-5">

                  <button
                    type="button"
                    className="btn btn-light px-4 py-2"
                  >
                    Cancel
                  </button>

                  <button
                    type="submit"
                    className="btn text-white px-4 py-2"
                    style={{
                      background: "#1e66ff",
                    }}
                  >
                    <i className="fas fa-save me-2"></i>

                    Save Mitigation Action
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