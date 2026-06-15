
import axios from 'axios';
import React, { useState } from 'react'
import { useParams } from 'react-router-dom';

export default function AddRisk({hadazardId,hadazardTitle}: any) {

  // 1. Initialize the risk form state
const [riskData, setRiskData] = useState({
  hazardId:hadazardId,
  riskTitle: "",
  riskDescription: "",
  likelihood: "", // Default selection based on your data
  severity: "",     // Default selection based on your data
});

const [isRiskSubmitting, setIsRiskSubmitting] = useState(false);

// 2. Handle input changes for text, textareas, and select dropdowns
const handleRiskInputChange = (
  e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>
) => {
  const { name, value } = e.target;
  setRiskData((prev) => ({
    ...prev,
    [name]: value,
  }));
};

// 3. Submit function to send the risk data to the API
const addRiskHandle = async (e: React.FormEvent) => {
   console.log('object')
  e.preventDefault();
  setIsRiskSubmitting(true);
  console.log('object')

  try {
    const response = await axios.post(
      "http://localhost:51213/risks/add",
      riskData
    );

    console.log("Risk Response:", response.data);

    // Checks for successful creation codes
    if (response.status === 201 || response.status === 200) {
      alert("Risk assessment added successfully!");
      
      // Reset form fields back to original/default values
      setRiskData({
        hazardId:hadazardId,
        riskTitle: "",
        riskDescription: "",
        likelihood: "",
        severity: "",
      });
  window.location.reload()
    }
  } catch (error: any) {
    alert(`Failed to add risk: ${error.message}`);
    console.error(error);
  } finally {
    setIsRiskSubmitting(false);
  }
};


  return (
    <div>
      <div className="container-fluid py-4">
      <div className="card shadow border-0">
        
        {/* Header */} 
        <div
          className="card-header text-white"
          style={{ background: "#1e66ff" }}
        >
          <h4 className="mb-0">
            <i className="fas fa-triangle-exclamation me-2"></i>
            Add Risk Assessment
          </h4>
        </div>

        <div className="card-body p-4">
          <form onSubmit={addRiskHandle} >

            {/* Hazard ID */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Hazard Name
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-hashtag text-primary"></i>
                </span>

                 <input
                  type="text"
                  className="form-control py-3"
                  placeholder="Enter risk title"
                  name ={'hazardId'} value ={hadazardTitle} 
                  readOnly
                />
              </div>
            </div>

            {/* Risk Title */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Risk Title
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-shield-halved text-primary"></i>
                </span>

                <input
                  type="text"
                  className="form-control py-3"
                  placeholder="Enter risk title"
                  name ={'riskTitle'} value ={riskData.riskTitle} 
                  onChange={handleRiskInputChange}
                />
              </div>
            </div>

            {/* Risk Description */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Risk Description
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-file-lines text-primary"></i>
                </span>

                <textarea
                  rows={5}
                  className="form-control"
                  placeholder="Describe the risk and possible consequences..."
                  name ={'riskDescription'} value ={riskData.riskDescription} 
                  onChange={handleRiskInputChange}
                ></textarea>
              </div>
            </div>

            {/* Likelihood */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Likelihood
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-chart-line text-primary"></i>
                </span>

                <select className="form-select py-3"
                name ={'likelihood'} value ={riskData.likelihood} 
                onChange={handleRiskInputChange}>
                  <option>Select likelihood</option>
                  <option value={'RARE'} > RARE  </option>
                  <option value={'UNLIKELY'} > UNLIKELY </option>
                  <option value={'POSSIBLE'} > POSSIBLE</option>
                  <option value={'LIKELY'} > LIKELY </option>
                  <option value={'ALMOST_CERTAIN'} > ALMOST_CERTAIN </option>
                </select>
              </div>
            </div>

            {/* Severity */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Severity
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-fire text-danger"></i>
                </span>

                <select className="form-select py-3"
                name ={'severity'} value ={riskData.severity}
                onChange={handleRiskInputChange} >
                  <option>Select severity</option>
                  <option value={'LOW'}>  LOW  </option>
                  <option value={'MEDIUM'}>  MEDIUM  </option>
                  <option value={'HIGH'}>  HIGH </option>
                  <option value={'CRITICAL'}>  CRITICAL </option>
               
                </select>
              </div>
            </div>

            {/* Risk Level */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Risk Level
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-gauge-high text-warning"></i>
                </span>

                <select className="form-select py-3">
                  <option>Select risk level</option>
                  <option>Low</option>
                  <option>Medium</option>
                  <option>High</option>
                  <option>Critical</option>
                </select>
              </div>
            </div>

            

            {/* Status */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Status
              </label>

              <div className="input-group">
                <span className="input-group-text">
                  <i className="fas fa-circle-check text-success"></i>
                </span>

                <select className="form-select py-3">
                  <option>Select status</option>
                  <option>Open</option>
                  <option>Under Review</option>
                  <option>Mitigation In Progress</option>
                  <option>Closed</option>
                </select>
              </div>
            </div>

            {/* Buttons */}
            <div className="d-flex justify-content-end gap-3 mt-5">

              <button
                type="submit"
                className="btn btn-light px-4 py-2"
              >
                <i className="fas fa-arrow-left me-2"></i>
                Back
              </button>

              <button
                type="submit"
                className="btn text-white px-4 py-2"
                style={{ background: "#1e66ff" }}
              >
                <i className="fas fa-save me-2"></i>
                Save Risk
              </button>

            </div>

          </form>
        </div>
      </div>
    </div>
    </div>
  )
}
