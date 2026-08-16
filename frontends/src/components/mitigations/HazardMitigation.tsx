import axios from "axios";
import React, { useEffect, useState } from "react";
import BaseUrl from "../utils/api_provider/ApiProviders";

export default function HazardMitigation({ hazardId }) {
  const [mitigation, setMitigation] = useState([]);
  const [loading, setLoading] = useState(true);
  

  const fetchMitigation = async () => {
    // alert('ccc')
    try {
      setLoading(true);

      const response = await axios.get(
        `${BaseUrl}/mitigations/get-by-hazardid/${hazardId}`
      );
      console.log('mmmm:',response.data)

      setMitigation(response.data);
    } catch (error) {
      console.log('mmmmmm',error)
      console.log(error);
    } finally {
      setLoading(false);
    }
  };
// fetchMitigation()
  useEffect(() => {
  
      fetchMitigation();
    
  }, [hazardId]);

  const getStatusBadge = (status) => {
    switch (status) {
      case "PENDING":
        return "badge bg-warning text-dark";

      case "IN_PROGRESS":
        return "badge bg-primary";

      case "COMPLETED":
        return "badge bg-success";

      case "CANCELLED":
        return "badge bg-danger";

      default:
        return "badge bg-secondary";
    }
  };

  const formatDate = (date) => {
    if (!date) return "-";

    return new Date(date).toLocaleDateString("en-GB");
  };

  return (
    <div>
      <div className="card border-0 shadow-sm mb-4">

        <div className="card-header bg-info text-white d-flex justify-content-between align-items-center">

          <h5 className="mb-0">
            <i className="fa fa-shield-alt me-2"></i>
            Mitigation Actions
          </h5>

          <button
            type="button"
            className="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#mitgationModel"
          >
            <i className="fa fa-plus me-2"></i>
            Add Action
          </button>

        </div>

        <div className="card-body">

          {loading ? (
            <div className="text-center py-5">

              <div
                className="spinner-border text-info"
                role="status"
              ></div>

              <p className="mt-3">Loading mitigation actions...</p>

            </div>
          ) : (
            <div className="table-responsive">

              <table className="table table-hover align-middle">

                <thead className="table-info">

                  <tr>
                    <th>#</th>
                    <th>Asset</th>
                    <th>Hazard</th>
                    <th>Action Title</th>
                    {/* <th>Assigned To</th> */}
                    <th> Date</th>
                    <th>Status</th>
                  </tr>

                </thead>

                <tbody>

                  {mitigation.length === 0 ? (
                    <tr>
                      <td
                        colSpan="7"
                        className="text-center text-muted py-5"
                      >
                        No mitigation actions found.
                      </td>
                    </tr>
                  ) : (
                    mitigation.map((item, index) => (
                      <tr key={item.mitigationId}>

                        <td>{index + 1}</td>

                        <td>
                          <strong>
                            {item.hazard?.asset?.assetName}
                          </strong>

                          <br />

                          <small className="text-muted">
                            {item.hazard?.asset?.assetType}
                          </small>
                        </td>

                        <td>
                          {item.hazard?.hazardTitle}
                        </td>

                        <td>
                          {item.actionTitle}
                        </td>
{/* 
                        <td>

                          <div className="fw-bold">
                            {item.assignedTo?.fullName}
                          </div>

                          <small className="text-muted">
                            {item.assignedTo?.role}
                          </small>

                        </td> */}

                        <td>
                          {formatDate(item.targetDate)}
                        </td>

                        <td>

                          <span className={getStatusBadge(item.status)}>
                            {item.status}
                          </span>

                        </td>

                      </tr>
                    ))
                  )}

                </tbody>

              </table>

            </div>
          )}
        </div>
      </div>
    </div>
  );
}