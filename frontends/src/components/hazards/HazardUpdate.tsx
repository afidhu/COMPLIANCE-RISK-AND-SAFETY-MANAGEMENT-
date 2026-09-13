import axios from "axios";
import React, { useEffect, useState } from "react";
import { useLocation, useNavigate, useParams } from "react-router-dom";
import BaseUrl from "../utils/api_provider/ApiProviders";
import Select from "react-select";

export default function HazardUpdate() {
  const navigation = useNavigate();
  const { hazardId } = useParams();
   const { state } = useLocation();

  const [hazardData, setHazardData] = useState({
    assetId: `${state.assetId}`,
    hazardTitle: `${state.hazardTitle}`,
    hazardDescription:`${state.hazardDescription}`,
  });

  const [isHazardSubmitting, setIsHazardSubmitting] = useState(false);
  const [isLoadingHazard, setIsLoadingHazard] = useState(false);

  interface Asset {
    assetId: string;
    assetName: string;
    assetType: string;
    location: string;
    serialNo?: string;
  }

  const [asset, setAsset] = useState<Asset[]>([]);
  const [isLoadingAsset, setisLoadingAsset] = useState<boolean>(false);

  const fetchAssets = async () => {
    setisLoadingAsset(true);

    try {
      const response = await axios.get(`${BaseUrl}/assets/get`);
      setAsset(response.data);
      console.log('Assets data:', response.data);
    } catch (error: any) {
      console.error("Error fetching assets:", error);
    } finally {
      setisLoadingAsset(false);
    }
  };

  const fetchHazardById = async () => {
    setIsLoadingHazard(true);
    try {
      const response = await axios.get(`${BaseUrl}/hazards/get/${hazardId}`);
      const hazard = response.data;
      setHazardData({
        assetId: hazard.assetId || '',
        hazardTitle: hazard.hazardTitle || '',
        hazardDescription: hazard.hazardDescription || '',
      });
      console.log('Hazard data:', hazard);
    } catch (error: any) {
      console.error("Error fetching hazard:", error);
      alert("Failed to load hazard data");
    } finally {
      setIsLoadingHazard(false);
    }
  };

  const assetOptions = asset.map((item) => ({
    value: item.assetId,
    label: item.assetName,
    assetType: item.assetType,
    location: item.location,
    serialNo: item.serialNo,
  }));

  useEffect(() => {
    fetchAssets();
    if (hazardId) {
      fetchHazardById();
    }
  }, [hazardId]);

  const updateHazardHandle = async (e: React.FormEvent) => {
    e.preventDefault();
    if (hazardData.assetId === '' || hazardData.hazardDescription === '' || hazardData.hazardTitle === "") {
      alert("All fields required!");
    } else {
      setIsHazardSubmitting(true);

      try {
        const response = await axios.put(
          `${BaseUrl}/hazards/update/${hazardId}`,
          hazardData
        );

        console.log("Update Response:", response.data);

        if (response.status === 200 || response.status === 201) {
          alert("Hazard updated successfully!");
          navigation('/Hazards');
        }
      } catch (error: any) {
        alert(`Failed to update hazard: ${error.message}`);
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

  if (isLoadingHazard) {
    return (
      <div className="container">
        <div className="page-inner">
          <div className="text-center py-5">
            <div className="spinner-border text-primary" role="status">
              <span className="visually-hidden">Loading...</span>
            </div>
            <p className="mt-3">Loading hazard data...</p>
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
          <h3 className="fw-bold mb-3">Update Hazard</h3>

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
              <a href="#">Update Hazard</a>
            </li>
          </ul>
        </div>

        {/* FORM CARD */}
        <div className="row">
          <div className="col-md-12">
            <div className="card shadow-sm border-0">

              <div className="card-header">
                <h4 className="card-title">Update Hazard Details</h4>
              </div>

              <div className="card-body">

                <form onSubmit={updateHazardHandle}>

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

                  {/* SUBMIT BUTTON */}
                  <div className="d-flex justify-content-end gap-2">
                    <button
                      type="button"
                      className="btn btn-secondary px-4 py-2"
                      onClick={() => navigation('/Hazards')}
                    >
                      Cancel
                    </button>

                    <button
                      type="submit"
                      className="btn btn-primary px-4 py-2"
                      disabled={isHazardSubmitting}
                    >
                      {isHazardSubmitting ? (
                        <>
                          <span className="spinner-border spinner-border-sm me-2"></span>
                          Updating...
                        </>
                      ) : (
                        "Update Hazard"
                      )}
                    </button>
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
