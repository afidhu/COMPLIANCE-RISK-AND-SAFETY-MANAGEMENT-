import React, { useEffect, useState } from "react";
import axios from "axios";
import { Link } from "react-router-dom";

export default function Dashboard() {
  const [counts, setCounts] = useState([]);
  const [loading, setLoading] = useState(false);

  const user = "admin"; // replace with real auth user role

  const getCounts = async () => {
    try {
      setLoading(true);

      const res = await axios.get(
        "http://localhost:51213/auth/users/countUsersByRole"
      );

      setCounts(res.data);
    } catch (error) {
      console.log(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getCounts();
  }, []);

  const getCount = (role) => {
    return counts.find((c) => c.role === role)?.count || 0;
  };

  return (
    <div className="container">
      <div className="page-inner">

        <div className="row">
          <div className="row g-4">

            {/* SYSTEM USERS */}
            {/* <div className="col-sm-6 col-md-3">
              <div className="card card-stats card-round shadow-sm border-0 h-100">
                <div className="card-body py-4">
                  <div className="d-flex justify-content-between align-items-center">

                    <div className="d-flex align-items-center">
                      <div style={iconBoxStyle}>
                        <i className="fas fa-cogs"></i>
                      </div>

                      <div className="ms-3">
                        <p className="mb-1 text-muted fw-semibold">
                          System Users
                        </p>

                        <h3 className="fw-bold mb-0">
                          {loading ? "..." : getCount("SYSTEM")}
                        </h3>
                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div> */}

                {/* Safety officer */}
            <div className="col-sm-6 col-md-3">
              <div className="card card-stats card-round shadow-sm border-0 h-100">
                <div className="card-body py-4">

                  <div className="d-flex justify-content-between align-items-center">

                    <div className="d-flex align-items-center">

                      <div style={iconBoxStyle}>
                        <i className="fas fa-fire-alt"></i>
                      </div>

                      <div className="ms-3">
                        <p className="mb-1 text-muted fw-semibold">
                          Safety officer
                        </p>

                        <h3 className="fw-bold mb-0">
                          {loading ? "..." : getCount("SAFETY_OFFICER")}
                        </h3>
                      </div>

                    </div>

                    <Link to={'/AllUsers'} style={eyeButtonStyle}>
                      <i className="fas fa-eye"></i>
                    </Link>

                  </div>

                </div>
              </div>
            </div>



            {/* INSPECTORS */}
            <div className="col-sm-6 col-md-3">
              <div className="card card-stats card-round shadow-sm border-0 h-100">
                <div className="card-body py-4">

                  <div className="d-flex justify-content-between align-items-center">

                    <div className="d-flex align-items-center">

                      <div style={iconBoxStyle}>
                        <i className="fas fa-user-check"></i>
                      </div>

                      <div className="ms-3">
                        <p className="mb-1 text-muted fw-semibold">
                          Inspectors
                        </p>

                        <h3 className="fw-bold mb-0">
                          {loading ? "..." : getCount("INSPECTOR")}
                        </h3>
                      </div>

                    </div>

                    <Link to={'/AllUsers'} style={eyeButtonStyle}>
                      <i className="fas fa-eye"></i>
                    </Link>

                  </div>

                </div>
              </div>
            </div>

            {/* TECHNICIANS */}
            <div className="col-sm-6 col-md-3">
              <div className="card card-stats card-round shadow-sm border-0 h-100">
                <div className="card-body py-4">

                  <div className="d-flex justify-content-between align-items-center">

                    <div className="d-flex align-items-center">

                      <div style={iconBoxStyle}>
                        <i className="fas fa-screwdriver-wrench"></i>
                      </div>

                      <div className="ms-3">
                        <p className="mb-1 text-muted fw-semibold">
                          Technicians
                        </p>

                        <h3 className="fw-bold mb-0">
                          {loading ? "..." : getCount("TECHNICIAN")}
                        </h3>
                      </div>

                    </div>

                    <Link to={'/AllUsers'} style={eyeButtonStyle}>
                      <i className="fas fa-eye"></i>
                    </Link>

                  </div>

                </div>
              </div>
            </div>

            {/* STAFF USERS */}
            <div className="col-sm-6 col-md-3">
              <div className="card card-stats card-round shadow-sm border-0 h-100">
                <div className="card-body py-4">

                  <div className="d-flex justify-content-between align-items-center">

                    <div className="d-flex align-items-center">

                      <div style={iconBoxStyle}>
                        <i className="fas fa-users"></i>
                      </div>

                      <div className="ms-3">
                        <p className="mb-1 text-muted fw-semibold">
                          Staff Members
                        </p>

                        <h3 className="fw-bold mb-0">
                          {loading ? "..." : getCount("STAFF_MEMBER")}
                        </h3>
                      </div>

                    </div>

                    <Link to={'/AllUsers'} style={eyeButtonStyle}>
                      <i className="fas fa-eye"></i>
                    </Link>

                  </div>

                </div>
              </div>
            </div>

            {/* ESTATE MANAGER (ONLY ADMIN) */}
            {user === "admin" && (
              <div className="col-sm-6 col-md-3">
                <div className="card card-stats card-round shadow-sm border-0 h-100">
                  <div className="card-body py-4">

                    <div className="d-flex justify-content-between align-items-center">

                      <div className="d-flex align-items-center">

                        <div style={iconBoxStyle}>
                          <i className="fas fa-user-tie"></i>
                        </div>

                        <div className="ms-3">
                          <p className="mb-1 text-muted fw-semibold">
                            Estate Managers
                          </p>

                          <h3 className="fw-bold mb-0">
                            {loading ? "..." : getCount("ESTATE_MANAGER")}
                          </h3>
                        </div>

                      </div>

                      <Link to={'/AllUsers'} style={eyeButtonStyle}>
                        <i className="fas fa-eye"></i>
                      </Link>

                    </div>

                  </div>
                </div>
              </div>
            )}

            {/* ESTATE MANAGER NOT SEE HIS SELF */}
            {counts.role != "ESTATE_MANAGER" && (
              <div className="col-sm-6 col-md-3">
                <div className="card card-stats card-round shadow-sm border-0 h-100">
                  <div className="card-body py-4">

                    <div className="d-flex justify-content-between align-items-center">

                      <div className="d-flex align-items-center">

                        <div style={iconBoxStyle}>
                          <i className="fas fa-user-tie"></i>
                        </div>

                        <div className="ms-3">
                          <p className="mb-1 text-muted fw-semibold">
                            Estate Managers
                          </p>

                          <h3 className="fw-bold mb-0">
                            {loading ? "..." : getCount("ESTATE_MANAGER")}
                          </h3>
                        </div>

                      </div>

                      <Link to={'/AllUsers'} style={eyeButtonStyle}>
                        <i className="fas fa-eye"></i>
                      </Link>

                    </div>

                  </div>
                </div>
              </div>
            )}

          </div>
        </div>

      </div>
    </div>
  );
}

/* STYLES */
const iconBoxStyle = {
  width: "65px",
  height: "65px",
  borderRadius: "18px",
  background: "#1e66ff",
  color: "white",
  fontSize: "28px",
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
  boxShadow: "0 8px 20px rgba(30,102,255,0.25)",
};

const eyeButtonStyle = {
  width: "52px",
  height: "52px",
  borderRadius: "14px",
  background: "#f4f7ff",
  color: "#1e66ff",
  fontSize: "22px",
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
  textDecoration: "none",
};