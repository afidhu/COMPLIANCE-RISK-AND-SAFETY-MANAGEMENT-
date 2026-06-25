import axios from "axios";
import React, { useContext, useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { UserContext } from "../includes/AuthContext";
import BaseUrl from "../utils/api_provider/ApiProviders";
import Select from "react-select";

export default function AddHazards() {

  const context = useContext(UserContext);
// Destructure properties from your specific API response user object
  const { user } = context;
    const navigation = useNavigate()
  // 1. Initialize the hazard form state
  const [hazardData, setHazardData] = useState({
    assetId: '',// Can be dynamically set from your asset creation
    complianceId: "cmq3t3yq800071ze2a1nx1shs",
    hazardTitle: "",
    hazardDescription: "",
    status: "OPEN",
    reportedById: user?.userId ??''
  });
  console.log('hazardData', hazardData.assetId)

  const [isHazardSubmitting, setIsHazardSubmitting] = useState(false);


  // 1. Define an interface for the Hazard type based on your data structure
  interface Asset {
    assetId: string;
    assetName: string;

  }

  // Inside your React component:
  const [asset, setAsset] = useState<Asset[]>([]);
  // const [isLoadingHazards, setIsLoadingHazards] = useState<boolean>(false);
  const [isLoadingAsset, setisLoadingAsset] = useState<boolean>(false);
  const [assetError, setAssetError] = useState<string | null>(null);
  // 2. Create the function to fetch hazards
  const fetchAssets = async () => {
    setisLoadingAsset(true);
    setAssetError(null);

    try {
      const response = await axios.get(`${BaseUrl}/assets/get`);

      // Assumes your backend returns an array of hazards directly or inside response.data
      setAsset(response.data);
      hazardData.assetId = `${response.data[0].assetId}`
      console.log('data :', response.data)
    } catch (error: any) {
      setAssetError(error.message || "Failed to fetch hazards");
      console.error("Error fetching hazards:", error);
    } finally {
      setisLoadingAsset(false);
    }
  };
const assetOptions = asset.map((item) => ({
  value: item.assetId,
  label: item.assetName,
  assetType: item.assetType,
  location: item.location,
  serialNo: item.serialNo,
}));
  // 3. Automatically fetch data when the page or component mounts
  useEffect(() => {
    fetchAssets();
  }, []);




  // 3. Submit function to send data to the API
  const addHazardHandle = async (e: React.FormEvent) => {
    e.preventDefault();
    if (hazardData.assetId === '' || hazardData.complianceId === '' || hazardData.hazardDescription === '' || hazardData.hazardTitle === "") {
      alert("All fields required!");
    }
    else{
    
    setIsHazardSubmitting(true);

    try {
      const response = await axios.post(
       `${BaseUrl}/hazards/add`,
        hazardData
      );

      console.log("Hazard Response:", response.data);

      if (response.status === 201 || response.status === 200) {
        alert("Hazard reported successfully!");

        // Reset form fields but keep static IDs if needed
        setHazardData({
          assetId: '',// Can be dynamically set from your asset creation
          complianceId: '',
          hazardTitle: "",
          hazardDescription: "",
          status: '',
          reportedById: '',          
        });
        navigation('/Hazards')
      }
    } catch (error: any) {
      alert(`Failed to add hazard: ${error.message}`);
      console.error(error);
    } finally {
      setIsHazardSubmitting(false);
    }
  }
  };

  const handleHazardInputChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>
  ) => {
    const { name, value } = e.target;
    setHazardData((prev) => ({
      ...prev,
      [name]: value,
    }));
  };
  return (
    <div className="container">
      <div className="page-inner">

        {/* HEADER */}
        <div className="page-header">
          <h3 className="fw-bold mb-3">Add Hazard</h3>

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
              <a href="#">Hazards</a>
            </li>

            <li className="separator">
              <i className="icon-arrow-right"></i>
            </li>

            <li className="nav-item">
              <a href="#">Add Hazard</a>
            </li>
          </ul>
        </div>

        {/* FORM CARD */}
        <div className="row">
          <div className="col-md-12">
            <div className="card shadow-sm border-0">

              <div className="card-header">
                <h4 className="card-title">Hazard Details</h4>
              </div>

              <div className="card-body">

                <form onSubmit={addHazardHandle} >

                  {/* ASSET name */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Select Asset
                    </label>

                    <div className="input-group">
  <span className="input-group-text bg-light">
    <i className="fas fa-building text-primary"></i>
  </span>

  <div style={{ flex: 1 }}>
    <Select
      options={assetOptions}
      isLoading={isLoadingAsset}
      placeholder="Search and Select Asset..."
      isSearchable
      value={
        assetOptions.find(
          (option) =>
            option.value === hazardData.assetId
        ) || null
      }
      onChange={(selectedOption) =>
        setHazardData({
          ...hazardData,
          assetId: selectedOption?.value || "",
        })
      }
      formatOptionLabel={(option) => (
        <div>
          <div className="fw-bold">
            {option.label}
          </div>

          <small className="text-muted">
            {option.assetType} • {option.location}
          </small>

          {option.serialNo && (
            <div>
              <small className="text-primary">
                {option.serialNo}
              </small>
            </div>
          )}
        </div>
      )}
    />
  </div>
</div>
                  </div>


                  {/* HAZARD TITLE */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Hazard Title
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-triangle-exclamation text-primary"></i>
                      </span>

                      <input
                        type="text"
                        className="form-control border-start-0 py-3"
                        placeholder="Enter hazard title"
                        value={hazardData.hazardTitle}
                        name={'hazardTitle'}
                        onChange={handleHazardInputChange}
                      />
                    </div>
                  </div>

                  {/* DESCRIPTION */}
                  <div className="mb-4">
                    <label className="form-label fw-semibold">
                      Hazard Description
                    </label>

                    <div className="input-group">
                      <span className="input-group-text bg-light border-end-0">
                        <i className="fas fa-align-left text-primary"></i>
                      </span>

                      <textarea
                        className="form-control border-start-0 py-3"
                        rows={3}
                        placeholder="Describe the hazard"
                        value={hazardData.hazardDescription}
                        name={'hazardDescription'}
                        onChange={handleHazardInputChange}
                      ></textarea>
                    </div>
                  </div>

                  {/* BUTTONS */}
                  <div className="d-flex justify-content-end gap-3 mt-5">

                    <a
                      href="./hazards.html"
                      className="btn btn-light px-4 py-2 rounded-3 fw-semibold"
                    >
                      <i className="fas fa-arrow-left me-2"></i>
                      Back
                    </a>
                    {
                      isHazardSubmitting ? <><div className="spinner-border" role="status">
                        <span className="sr-only">Loading...</span>
                      </div></> : <button
                        type="submit"
                        className="btn text-white px-4 py-2 rounded-3 fw-semibold"
                        style={{ background: "#1e66ff" }}
                      >
                        <i className="fas fa-plus me-2"></i>
                        Save Hazard
                      </button>
                    }



                  </div>

                </form>

              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  );
}