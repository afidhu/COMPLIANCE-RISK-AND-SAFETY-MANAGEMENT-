import axios from "axios";
import React, { useEffect, useState } from "react";
import { dateFormater } from "../utils/DateFormater";
import BaseUrl from "../utils/api_provider/ApiProviders";

export default function CapaHazard({ hazardid, hadazardTitle }: any) {
  console.log("DZID", hazardid);

  const [capa, setCapa] = useState([]);
  const [expandedItems, setExpandedItems] = useState<Set<string>>(new Set());

  const fetchCapa = async () => {
    try {
      const response = await axios.get(
        `${BaseUrl}/capa/get-by-hazardid/${hazardid}`,
      );
      setCapa(response.data);
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => {
    fetchCapa();
  }, [hazardid]);

  // update capa as approved
  const approveHandle = async (capaId: string) => {
    try {
      await axios.patch(`${BaseUrl}/capa/isapproved/${capaId}`);
      await fetchCapa();
    } catch (error) {
      console.error("Failed to approve CAPA:", error);
    }
  };

  // edit handler - navigate to edit page with CAPA data
  const editHandle = (capaId: string) => {
    console.log("Edit CAPA with ID:", capaId);
    // You can implement navigation to edit page here
    // Example: navigation(`/edit-capa/${capaId}`, { state: { capaId } });
  };

  // delete handler
  const deleteHandle = async (capaId: string) => {
    if (window.confirm("Are you sure you want to delete this CAPA action?")) {
      try {
        await axios.delete(`${BaseUrl}/capa/delete/${capaId}`);
        await fetchCapa();
        console.log("CAPA deleted successfully");
      } catch (error) {
        console.error("Failed to delete CAPA:", error);
        alert("Failed to delete CAPA action");
      }
    }
  };

  // toggle expanded state for an item
  const toggleExpand = (capaId: string) => {
    setExpandedItems((prev) => {
      const newSet = new Set(prev);
      if (newSet.has(capaId)) {
        newSet.delete(capaId);
      } else {
        newSet.add(capaId);
      }
      return newSet;
    });
  };

  return (
    <div>
      <div className="card mb-4 border-0 shadow-sm">
        <div className="card-header bg-danger text-white fw-bold d-flex justify-content-between align-items-center">
          <span>CAPA Actions (Corrective & Preventive)</span>
          <button
            type="button"
            className="btn btn-primary btn-sm-3"
            data-bs-toggle="modal"
            data-bs-target="#staticBackdrop"
          >
            Assign <i className="fa fa-arrow-right"></i>
          </button>
        </div>

        <div className="card-body">
          <div className="table-responsive">
            <table className="table table-striped align-middle mb-0">
              <thead className="table-danger">
                <tr>
                  <th>Action Title</th>
                  {/* <th>dueDate</th> */}
                  <th>Assigned To</th>
                  <th>Status</th>
                  <th>Due Date</th>
                  <th>Action</th>
                  <th>Created</th>
                </tr>
              </thead>

              <tbody>
                {capa.length > 0 ? (
                  capa.map((item, index) => {
                    const dateformated = dateFormater(item.createdAt);
                    const dateformateDue = dateFormater(item.dueDate);
                    const isExpanded = expandedItems.has(item.capaId);
                    return (
                      <React.Fragment key={item._id ?? index}>
                        <tr>
                          <td>{item.actionTitle}</td>
                          <td>{item.assignedTo?.fullName || "Unassigned"}</td>
                          <td>
                            <span
                              className={`badge ${item.status === "COMPLETED" ? "bg-success" : "bg-warning"} text-dark`}
                            >
                              {item.status}
                            </span>
                          </td>
                          <td>{dateformateDue}</td>
                          <td className="text-center">
                            {item.isApproved ? (
                              <span
                                onClick={() => approveHandle(item.capaId)}
                                className="badge btn btn-back-home bg-success text-white ms-3 py-2 px-4"
                              >
                                Approved
                              </span>
                            ) : (
                              <span
                                onClick={() => approveHandle(item.capaId)}
                                className="badge btn btn bg-success text-white ms-3 py-2 px-4"
                              >
                                Approve
                              </span>
                            )}

                            <span
                              onClick={() => toggleExpand(item.capaId)}
                              className="btn btn-sm btn-outline-primary bg-primary ms-2"
                            >
                              <i className="text-white fa fa-eye"></i>
                            </span>
                            <span
                              onClick={() => deleteHandle(item.capaId)}
                              className="btn btn-sm btn-outline-danger bg-danger ms-2"
                            >
                              <i className="text-white fa fa-trash"></i>
                            </span>
                          </td>
                          <td>{dateformated}</td>
                        </tr>
                        {isExpanded && (
                          <tr>
                            <td colSpan={6} className="p-0">
                              <div className="card card-body m-2 bg-light">
                                <div className="row">
                                  <div className="col-md-4 d-flex align-items-center justify-content-center">
                                    {item.imageUrl ? (
                                      <img 
                                        src={item.imageUrl} 
                                        alt={`${item.status}`} 
                                        className="img-fluid rounded"
                                        style={{ maxHeight: '200px', objectFit: 'cover' }}
                                      />
                                    ) : (
                                      <div className="text-muted text-center">
                                        <i className="fa fa-image fa-3x mb-2"></i>
                                        <p>No image available</p>
                                      </div>
                                    )}
                                  </div>
                                  <div className="col-md-8">
                                    <h6 className="fw-bold mb-3">CAPA Details</h6>
                                    <p><strong>Action Title:</strong> {item.actionTitle}</p>
                                    <p><strong>Assigned To:</strong> {item.assignedTo?.fullName || "Unassigned"}</p>
                                    <p><strong>Status:</strong> {item.status}</p>
                                    <p><strong>Due Date:</strong> {dateformateDue}</p>
                                    <p><strong>Created:</strong> {dateformated}</p>
                                    <p><strong>Approved:</strong> {item.isApproved ? "Yes" : "No"}</p>
                                  </div>
                                </div>
                              </div>
                            </td>
                          </tr>
                        )}
                      </React.Fragment>
                    );
                  })
                ) : (
                  <tr>
                    <td colSpan={6} className="text-center text-danger py-4">
                      No Actions Created
                    </td>
                  </tr>
                )}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  );
}
