
import axios from "axios";
import React, { useContext, useEffect, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import BaseUrl from "../utils/api_provider/ApiProviders";
import { UserContext } from "../includes/AuthContext";

export default function Hazards() {
    const context = useContext(UserContext);
// Destructure properties from your specific API response user object
  const { user } = context;
  const navigation = useNavigate()
  const [hazards, setHazards] = useState([])
  const fetchHazard = async () => {
    try {
      const response = await axios.get(`${BaseUrl}/hazards/get`)

      setHazards(response.data);
    } catch (error) {
      console.log(error);
    }
  };

  const fetchHazardByStaffMember = async () => {
    try {
      const response = await axios.get(`${BaseUrl}/hazards/get-by-reportedby/${user.userId}`)

      setHazards(response.data);
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => {
  user.role ==='STAFF_MEMBER'?fetchHazardByStaffMember():  fetchHazard();
  }, []);

  const goTo = async (hazardId: any, hazardTitle: any,hazardDescription:any) => {
    navigation(`/Hazard/${hazardId}`, {
      state: { hazardTitle: hazardTitle,hazardDescription:hazardDescription }
    });
  }

  return (
    <div className="container-fluid px-3">
      <div className="page-inner">

        {/* HEADER */}
        <div className="page-header">
          <h3 className="fw-bold mb-3">Hazards Management</h3>

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
              <a href="#">Safety</a>
            </li>

            <li className="separator">
              <i className="icon-arrow-right"></i>
            </li>

            <li className="nav-item">
              <a href="#">Hazards</a>
            </li>
          </ul>
        </div>

        {/* CARD */}
        <div className="card shadow-sm border-0">

          {/* CARD HEADER */}
          <div className="card-header d-flex justify-content-between align-items-center">
            <h4 className="card-title mb-0">Hazard Register</h4>

            <Link to={'/AddHazard'}
              className="btn text-white"
              style={{ background: "#1e66ff" }}
            >
              <i className="fa fa-plus me-2"></i>
              Report Hazard
            </Link>
          </div>

          {/* TABLE */}
          <div className="card-body">
            <div className="table-responsive">

              <table className="table table-striped table-hover align-middle">

                <thead style={{ background: "#1e66ff", color: "white" }}>
                  <tr>
                    <th>Asset Name</th>
                    <th>Location</th>

                    <th>Hazard Title</th>
                    {/* <th>Description</th> */}
                    <th>Reported By</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>
                </thead>

                <tbody>

                  {
                    hazards.length > 0 ?
                      hazards.map((item, index) => {
                        return <tr>
                          <td>{item.asset.assetName}</td>
                          <td> {item.asset.location}</td>
                          <td> {item.hazardTitle}</td>
                          {/* <td> {item.hazardDescription} </td> */}
                          
                          <td>
                            <span > {item.reportedBy.fullName}</span>
                          </td>
                          <td>
                            <span className={item.status === "CLOSED" ? "badge bg-success" : "badge bg-danger"}>{item.status}</span>
                             </td>
                          <td>


                            <button onClick={() => goTo(item.hazardId, item.hazardTitle,item.hazardDescription)} className="btn btn-link text-primary">
                              <i className="fa fa-eye"></i>
                            </button>



                            <button className="btn btn-link text-warning">
                              <i className="fa fa-pen"></i>
                            </button>

                          </td>

                           {/* <td>
                            <div className="d-flex align-items-center gap-2">
                              <button onClick={() => goTo(item.hazardId, item.hazardTitle, item.hazardDescription)} className="btn btn-link text-primary p-0">
                                <i className="fa fa-eye"></i>
                              </button>
                              <button className="btn btn-link text-warning p-0">
                                <i className="fa fa-pen"></i>
                              </button>
                            </div>
                          </td> */}


                        </tr>
                      })
                      :
                      <><tr><td><h1>No have Found</h1></td></tr></>
                  }



                </tbody>

              </table>

            </div>
          </div>

        </div>
      </div>
    </div>
  );
}


