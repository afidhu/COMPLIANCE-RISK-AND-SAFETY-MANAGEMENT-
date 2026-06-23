
import axios from "axios";
import React, { useEffect, useMemo, useState } from "react";
import { Link, useLocation, useParams } from "react-router-dom";
import { dateFormater } from "../utils/DateFormater";
import BaseUrl from "../utils/api_provider/ApiProviders";

export default function ViewAssetCompliance() {

  const { assetId } = useParams();
  const { state } = useLocation();
  const [search, setSearch] = useState("");
  console.log('state', state, 'id', assetId)
  const [isClicked, setIsClicked] = useState(false)
  const [isAdded, setIsAdded] = useState(false)

  const [formData, setFormData] = useState({
    complianceName: "",
    assetId: assetId,
    frequency: "",
    lastDueDate: "",
    dueDate: "",
  });

  // Destructure the name from the state object safely
  const { assetName } = state || {};

  const [assetsCompliance, setAssetsCompliance] = useState([])

  const fetchAssetsCompliance = async () => {
    try {
      const response = await axios.get(`${BaseUrl}/compliance/get-by-assetid/${assetId}`)

      // console.log(response.data);
      setAssetsCompliance(response.data);
      console.log('assetsCompliance,', assetsCompliance)
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => {
    fetchAssetsCompliance();
  }, []);



  const addComplianceHandle = async (e: React.FormEvent) => {
    e.preventDefault();

    setIsClicked(true);

    try {
      const response = await axios.post(
        `${BaseUrl}/compliance/add/`,
        formData
      );

      console.log(response.data);

      if (response.status === 201 || response.status === 200) {
        setIsClicked(false);
        setIsAdded(true);

        alert(
          `Compliance added successfully : ${response.status}`
        );

        fetchAssetsCompliance()

        // optional: store returned id if backend sends it
        // setComplianceId(response.data.complianceId);
      }
      // reset form after success
      setFormData({
        complianceName: "",
        assetId: "",
        frequency: "",
        lastDueDate: "",
        dueDate: "",
      });
      //navigate to

      // navigate(`/ViewAssetCompliance/${assetId}`, { 
      //   state: { assetName: assetName, location:location }
      // });

      setTimeout(() => {
        setIsAdded(false);
      }, 1000);

    } catch (error: any) {
      setTimeout(() => {
        alert(`Compliance add failed: ${error.message}`);

      }, 400);

      setIsAdded(false);

      console.error(error);
    }
  };



  const handleInputChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>
  ) => {
    const { name, value } = e.target;

    setFormData((prev) => ({
      ...prev,
      [name]: value,
    }));
  };


  const filteredData = useMemo(() => {
    return assetsCompliance.filter(
      (item) =>
        item.complianceName
          .toLowerCase()
          .includes(search.toLowerCase()) ||
        item.status
          .toLowerCase()
          .includes(search.toLowerCase())
    );
  }, [assetsCompliance, search]);

  const compliantCount = assetsCompliance.filter(
    (x) => x.status === "COMPLIANT"
  ).length;

  const dueSoonCount = assetsCompliance.filter(
    (x) => x.status === "DUE_SOON"
  ).length;

  const overdueCount = assetsCompliance.filter(
    (x) => x.status === "OVERDUE"
  ).length;



  const getBadge = (status: string) => {
    switch (status) {
      case "COMPLIANT":
        return "bg-success";

      case "DUE_SOON":
        return "bg-warning text-dark";

      case "OVERDUE":
        return "bg-danger";

      default:
        return "bg-secondary";
    }
  };

  return (
    <div className="container">
      <div className="page-inner">

        {/* Asset Header */}
        <div className="card shadow-sm border-0 mb-4">

          <div className="card-body">

            <div className="d-flex justify-content-between align-items-center">

              <div>
                <h2 className="fw-bold text-primary mb-1">
                  Asset: {assetName}
                </h2>

                <p className="text-muted mb-0">
                  Location:{state.location} • {/*{state.assetType}*/}
                </p>
              </div>

              <div>
                <span className="badge bg-success fs-6 px-3 py-2">
                  Operational
                </span>
              </div>

            </div>

          </div>

        </div>

        {/* Compliance Statistics */}
        <div className="row mb-4">

          <div className="col-md-3">
            <div className="card card-stats shadow-sm border-0">
              <div className="card-body">
                <h5 className="text-muted">
                  Total Compliances
                </h5>

                <h2 className="fw-bold text-primary">
                  {assetsCompliance.length}
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card card-stats shadow-sm border-0">
              <div className="card-body">
                <h5 className="text-muted">
                  Compliant
                </h5>

                <h2 className="fw-bold text-success">
                  {compliantCount}
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card card-stats shadow-sm border-0">
              <div className="card-body">
                <h5 className="text-muted">
                  Due Soon
                </h5>

                <h2 className="fw-bold text-warning">
                  {dueSoonCount}
                </h2>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card card-stats shadow-sm border-0">
              <div className="card-body">
                <h5 className="text-muted">
                  Over Due
                </h5>

                <h2 className="fw-bold text-danger">
                  {overdueCount}
                </h2>
              </div>
            </div>
          </div>
        </div>

        {/* Compliance Table */}
        <div className="card shadow-sm border-0">

          <div className="card-header d-flex justify-content-between">

            <h4 className="card-title">
              Compliance Register
            </h4>

            <button type={'button'} style={{ float: 'right' }} className="btn btn-primary mb0" data-bs-toggle="modal" data-bs-target="#Compliance">
              <i className="fa fa-plus" ></i> Add Compliance
            </button>

            {/* <Link to={`/AddAssetCompliance/${assetId}/${assetName}`}
              className="btn btn-primary"
            >
              <i className="fas fa-plus me-2"></i>
              Add Compliance
            </Link> */}

          </div>

          <div className="card-body">

            <div className="table-responsive">

              <table className="table table-hover align-middle">

                <thead className="table-primary">

                  <tr>
                    <th>Compliance</th>
                    <th>Frequency</th>
                    <th>Last Inspection</th>
                    <th>Next Due Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>
                </thead>

                <tbody>

                  {
                    filteredData.length > 0 ?
                      filteredData.map((item, index) => {
                        const formaterlastDueDate =dateFormater(item.lastDueDate)
                        const formaterdueDate =dateFormater(item.dueDate)
                        return <>
                          <tr>
                            <td> {item.complianceName} </td>
                            <td> {item.frequency} </td>
                            <td> {formaterlastDueDate} </td>
                            <td> {formaterdueDate} </td>

                            <td>
                              <span className={`badge ${getBadge(
                                item.status
                              )}`}>
                                {item.status}
                              </span>
                            </td>

                            <td>
                              <button className="btn btn-link btn-primary">
                                <i className="fa fa-eye"></i>
                              </button>

                              <button className="btn btn-link btn-warning">
                                <i className="fa fa-pen"></i>
                              </button>
                            </td>
                          </tr>
                        </>
                      })


                      : <><tr><td><h6 className="text-danger" >No Assets Compliance</h6></td></tr></>
                  }

                </tbody>

              </table>

            </div>

          </div>

        </div>

      </div>



      {/* <!-- Scrollable modal --> */}
      <div className="modal fade" id="Compliance" data-bs-backdrop="static" data-bs-keyboard="false" tabIndex={-1} aria-labelledby="staticBackdropLabel" aria-hidden="true">
        {/* Combined sizing (modal-lg or modal-xl) and scrollable utility directly here */}
        <div className="modal-dialog modal-xl modal-dialog-scrollable">
          <div className="modal-content">
            <div className="modal-header">
              <h1 className="modal-title fs-5 text-primary ms-5" id="staticBackdropLabel"><b> Add  Compliance Information for <u>{assetName}</u> </b></h1>
              <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div className="modal-body w-100">

              <div className="card shadow-sm border-0">
                {/* <div className="card-header">
                  <h4 className="card-title">
                    Compliance Information
                  </h4>
                </div> */}

                <div className="card-body">

                  <form onSubmit={addComplianceHandle} >

                    {/*Assset name */}
                    <div className="mb-4">
                      <label className="form-label fw-semibold">
                        Asset nem
                      </label>

                      <div className="input-group">
                        <span className="input-group-text bg-light">
                          <i className="fas fa-font-awesome text-primary"></i>
                        </span>

                        <input
                          type="text"
                          className="form-control"
                          value={assetName}
                          readOnly
                        />
                      </div>
                    </div>

                    {/* Asset */}
                    {/* <div className="mb-4">
                <label className="form-label fw-semibold">
                  Asset
                </label>

                <div className="input-group">
                  <span className="input-group-text bg-light">
                    <i className="fas fa-building text-primary"></i>
                  </span>

                  <select className="form-select">
                    <option>Select Asset</option>
                    <option>AST-001 - Main Lift</option>
                    <option>AST-002 - Fire Extinguisher</option>
                    <option>AST-003 - Generator</option>
                  </select>
                </div>
              </div> */}

                    {/* Compliance Name */}
                    <div className="mb-4">
                      <label className="form-label fw-semibold">
                        Compliance Name
                      </label>

                      <div className="input-group">
                        <span className="input-group-text bg-light">
                          <i className="fas fa-clipboard-check text-primary"></i>
                        </span>

                        <input
                          type="text"
                          className="form-control"
                          placeholder="Annual Lift Inspection"
                          onChange={handleInputChange}
                          name={"complianceName"}
                          value={formData.complianceName}
                        />
                      </div>
                    </div>

                    {/* Frequency */}
                    <div className="mb-4">
                      <label className="form-label fw-semibold">
                        Frequency
                      </label>

                      <div className="input-group">
                        <span className="input-group-text bg-light">
                          <i className="fas fa-repeat text-primary"></i>
                        </span>

                        <select className="form-select"
                          onChange={handleInputChange}
                          name={"frequency"}
                          value={formData.frequency}>
                          <option>Select Frequency</option>
                          <option>Monthly</option>
                          <option>Quarterly</option>
                          <option>Bi-Annual</option>
                          <option>Annual</option>
                        </select>
                      </div>
                    </div>

                    {/* Last Due Date */}
                    <div className="mb-4">
                      <label className="form-label fw-semibold">
                        Last Inspection Date
                      </label>

                      <div className="input-group">
                        <span className="input-group-text bg-light">
                          <i className="fas fa-calendar-check text-primary"></i>
                        </span>

                        <input
                          type="date"
                          className="form-control"
                          style={{ colorScheme: 'light' }}
                          onChange={handleInputChange}
                          name={"lastDueDate"}
                          value={formData.lastDueDate}
                        />
                      </div>
                    </div>

                    {/* Due Date */}
                    <div className="mb-4">
                      <label className="form-label fw-semibold">
                        Next Due Date
                      </label>

                      <div className="input-group">
                        <span className="input-group-text bg-light">
                          <i className="fas fa-calendar-days text-primary"></i>
                        </span>

                        <input
                          type="date"
                          className="form-control"
                          style={{ colorScheme: 'light' }}
                          onChange={handleInputChange}
                          name={"dueDate"}
                          value={formData.dueDate}
                        />
                      </div>
                    </div>

                    {/* Status */}
                    <div className="mb-4">
                      <label className="form-label fw-semibold">
                        Compliance Status
                      </label>

                      <div className="input-group">
                        <span className="input-group-text bg-light">
                          <i className="fas fa-circle-check text-primary"></i>
                        </span>

                        <select className="form-select">
                          <option>Select Status</option>
                          <option>Compliant</option>
                          <option>Due Soon</option>
                          <option>Overdue</option>
                        </select>
                      </div>
                    </div>

                    <div className="d-flex justify-content-end gap-3 mt-5">

                      <button
                        type="button"
                        className="btn btn-light"
                      >
                        Back
                      </button>

                      <button
                        type="submit"
                        className="btn text-white"
                        style={{ background: "#1e66ff" }}
                      >
                        <i className="fas fa-save me-2"></i>
                        Save Compliance
                      </button>

                    </div>

                  </form>

                </div>
              </div>


            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              {/* <button type="button" className="btn btn-primary"><i className="fa fa-save"></i> Save</button> */}
            </div>
          </div>
        </div>
      </div>

    </div>
  );
}