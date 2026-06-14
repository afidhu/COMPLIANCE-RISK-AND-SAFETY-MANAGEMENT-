import { Link } from "react-router-dom";

export default function Dashboard() {
    var user = "usertype";
    const r = 3;
    return (
        <div>
            <div className="container">
                <div className="page-inner">

                    <div className="row">
                        <div className="row g-4">

                            {/* ASSETS */}
                            <div className="col-sm-6 col-md-3">
                                <div className="card card-stats card-round shadow-sm border-0 h-100">
                                    <div className="card-body py-4">

                                        <div className="d-flex justify-content-between align-items-center">

                                            <div className="d-flex align-items-center">

                                                <div
                                                    className="d-flex align-items-center justify-content-center me-3"
                                                    style={iconBoxStyle}
                                                >
                                                    <i className="fas fa-building"></i>
                                                </div>

                                                <div className="numbers">
                                                    <p className="card-category mb-1 text-muted fw-semibold">
                                                        Assets
                                                    </p>

                                                    <h3 className="card-title mb-0 fw-bold">
                                                        1,294
                                                    </h3>
                                                </div>

                                            </div>

                                            <Link to={'/assets'}
                                                className="d-flex align-items-center justify-content-center text-decoration-none"
                                                style={eyeButtonStyle}
                                            >
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

                                                <div
                                                    className="d-flex align-items-center justify-content-center me-3"
                                                    style={iconBoxStyle}
                                                >
                                                    <i className="fas fa-user-check"></i>
                                                </div>

                                                <div className="numbers">
                                                    <p className="card-category mb-1 text-muted fw-semibold">
                                                        Inspectors
                                                    </p>

                                                    <h3 className="card-title mb-0 fw-bold">
                                                        1,303
                                                    </h3>
                                                </div>

                                            </div>

                                            <a
                                                href="./inspectors/inspector.html"
                                                className="d-flex align-items-center justify-content-center text-decoration-none"
                                                style={eyeButtonStyle}
                                            >
                                                <i className="fas fa-eye"></i>
                                            </a>

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

                                                <div
                                                    className="d-flex align-items-center justify-content-center me-3"
                                                    style={iconBoxStyle}
                                                >
                                                    <i className="fas fa-screwdriver-wrench"></i>
                                                </div>

                                                <div className="numbers">
                                                    <p className="card-category mb-1 text-muted fw-semibold">
                                                        Technicians
                                                    </p>

                                                    <h3 className="card-title mb-0 fw-bold">
                                                        1,345
                                                    </h3>
                                                </div>

                                            </div>

                                            <a
                                                href="./technicians/technician.html"
                                                className="d-flex align-items-center justify-content-center text-decoration-none"
                                                style={eyeButtonStyle}
                                            >
                                                <i className="fas fa-eye"></i>
                                            </a>

                                        </div>

                                    </div>
                                </div>
                            </div>

                            {/* SAFETY OFFICERS */}
                            <div className="col-sm-6 col-md-3">
                                <div className="card card-stats card-round shadow-sm border-0 h-100">
                                    <div className="card-body py-4">

                                        <div className="d-flex justify-content-between align-items-center">

                                            <div className="d-flex align-items-center">

                                                <div
                                                    className="d-flex align-items-center justify-content-center me-3"
                                                    style={iconBoxStyle}
                                                >
                                                    <i className="fas fa-shield-halved"></i>
                                                </div>

                                                <div className="numbers">
                                                    <p className="card-category mb-1 text-muted fw-semibold">
                                                        Safety Officers
                                                    </p>

                                                    <h3 className="card-title mb-0 fw-bold">
                                                        576
                                                    </h3>
                                                </div>

                                            </div>

                                            <a
                                                href="./safety_officers/safety_officer.html"
                                                className="d-flex align-items-center justify-content-center text-decoration-none"
                                                style={eyeButtonStyle}
                                            >
                                                <i className="fas fa-eye"></i>
                                            </a>

                                        </div>

                                    </div>
                                </div>
                            </div>

                            {/* ESTATE MANAGER */}

                            {
                                user === 'admin' ? <div className="col-sm-6 col-md-3">
                                    <div className="card card-stats card-round shadow-sm border-0 h-100">
                                        <div className="card-body py-4">

                                            <div className="d-flex justify-content-between align-items-center">

                                                <div className="d-flex align-items-center">

                                                    <div
                                                        className="d-flex align-items-center justify-content-center me-3"
                                                        style={iconBoxStyle}
                                                    >
                                                        <i className="fas fa-user-tie"></i>
                                                    </div>

                                                    <div className="numbers">
                                                        <p className="card-category mb-1 text-muted fw-semibold">
                                                            Estate Managers
                                                        </p>

                                                        <h3 className="card-title mb-0 fw-bold">
                                                            576
                                                        </h3>
                                                    </div>

                                                </div>

                                                <a
                                                    href="./estate_managers/estate_manager.html"
                                                    className="d-flex align-items-center justify-content-center text-decoration-none"
                                                    style={eyeButtonStyle}
                                                >
                                                    <i className="fas fa-eye"></i>
                                                </a>

                                            </div>

                                        </div>
                                    </div>
                                </div> : null
                            }



                            {/* STAFF USERS */}
                            <div className="col-sm-6 col-md-3">
                                <div className="card card-stats card-round shadow-sm border-0 h-100">
                                    <div className="card-body py-4">

                                        <div className="d-flex justify-content-between align-items-center">

                                            <div className="d-flex align-items-center">

                                                <div
                                                    className="d-flex align-items-center justify-content-center me-3"
                                                    style={iconBoxStyle}
                                                >
                                                    <i className="fas fa-users"></i>
                                                </div>

                                                <div className="numbers">
                                                    <p className="card-category mb-1 text-muted fw-semibold">
                                                        Staff Users
                                                    </p>

                                                    <h3 className="card-title mb-0 fw-bold">
                                                        576
                                                    </h3>
                                                </div>

                                            </div>

                                            <a
                                                href="./staff/staff.html"
                                                className="d-flex align-items-center justify-content-center text-decoration-none"
                                                style={eyeButtonStyle}
                                            >
                                                <i className="fas fa-eye"></i>
                                            </a>

                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    )
}


const iconBoxStyle = {
    width: "65px",
    height: "65px",
    borderRadius: "18px",
    background: "#1e66ff",
    color: "white",
    fontSize: "28px",
    boxShadow: "0 8px 20px rgba(30,102,255,0.25)",
};

const eyeButtonStyle = {
    width: "52px",
    height: "52px",
    borderRadius: "14px",
    background: "#f4f7ff",
    color: "#1e66ff",
    fontSize: "22px",
    transition: "0.3s",
};