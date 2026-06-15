
import React, { useEffect, useState } from "react";
import axios from "axios";

const AddCAPA: React.FC = ({hazardid,hadazardTitle}) => {
//   const [riskId, setRiskId] = useState("");
  const [actionTitle, setActionTitle] = useState("");
  const [assignedToId, setAssignedToId] = useState("");
  const [dueDate, setDueDate] = useState("");
  const [hazardId, sethazardId] = useState("");
//   const [userId, setUserId] = useState("");
    const [technicians, setTechnicians] = useState([]);

  
  const [loading, setLoading] = useState(false);



  const fetchTechnicians = async () => {
    try {
     const response = await axios.get('http://localhost:51213/auth/users/technician')
    
    console.log(response.data);
      setTechnicians(response.data);
      setAssignedToId(response.data[0].userId)
    } catch (error) {
      console.log(error);
    }
  };

    useEffect(() => {
    fetchTechnicians();
  }, []);


  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    try {
      setLoading(true);

      const payload = {
       riskId: "cmq3vjm5j0003d5e28d8m32zt",
        hazardId:hazardid,
        actionTitle,
        assignedToId:assignedToId,
        dueDate: new Date(dueDate).toISOString(),
      };
      console.log('payload',payload)

      const response = await axios.post(
        "http://localhost:51213/capa/add",
        payload
      );

      alert("CAPA Added Successfully");

      console.log(response.data);

      setActionTitle("");
      setAssignedToId("");
      setDueDate("");
      window.location.reload()
    } catch (error: any) {
      console.error(error);
      alert(
        error?.response?.data?.message ||
          "Failed to create CAPA action"
      );
    } finally {
      setLoading(false);
    }
  };


  return (
    <div className="container py-4">
      <div className="card shadow border-0">
        <div
          className="card-header text-white"
          style={{ background: "#1e66ff" }}
        >
          <h4 className="mb-0">
            <i className="fas fa-clipboard-check me-2"></i>
            Add CAPA Action
          </h4>
        </div>

        <div className="card-body">

          <form onSubmit={handleSubmit}>

            {/* Risk ID */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Risk ID
              </label>

              <div className="input-group">

                <span className="input-group-text bg-light">
                  <i className="fas fa-triangle-exclamation text-primary"></i>
                </span>

                <input
                  type="text"
                  className="form-control"
                  placeholder="Enter Risk ID"
                  value={hadazardTitle}
                  readOnly
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
                  className="form-control"
                  placeholder="Enter action title"
                  value={actionTitle}
                  onChange={(e) => setActionTitle(e.target.value)}
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
                      className="form-select"
                      required
                      value={assignedToId}
                      onChange={(e)=>setAssignedToId(e.target.value)}
                    >
                      <option disabled selected >
                        Select Technician
                      </option>
                      {
                        technicians.map((item)=>{
                            return <option value={item.userId}>{item.fullName}</option>
                        })
                      }

                    </select>

                  </div>
                </div>

            {/* Due Date */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Due Date
              </label>

              <div className="input-group">

                <span className="input-group-text bg-light">
                  <i className="fas fa-calendar-days text-primary"></i>
                </span>

                <input
                  type="date"
                  className="form-control"
                  value={dueDate}
                  onChange={(e) => setDueDate(e.target.value)}
                  required
                  style={{colorScheme:'light'}}
                />

              </div>
            </div>

            {/* Buttons */}
            <div className="d-flex justify-content-end gap-3">

              <button
                type="submit"
                className="btn btn-light"
                
              >
                Cancel
              </button>

              <button
                type="submit"
                className="btn text-white"
                style={{ background: "#1e66ff" }}
                disabled={loading}
              >
                {loading ? (
                  <>
                    <span
                      className="spinner-border spinner-border-sm me-2"
                    ></span>
                    Saving...
                  </>
                ) : (
                  <>
                    <i className="fas fa-save me-2"></i>
                    Save CAPA
                  </>
                )}
              </button>

            </div>

          </form>

        </div>
      </div>
    </div>
  );
};

export default AddCAPA;