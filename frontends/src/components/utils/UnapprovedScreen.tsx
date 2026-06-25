import React from "react";

export default function UnapprovedScreen() {
  const user = JSON.parse(localStorage.getItem("user")); // optional if you store user

  return (
    <div className="container-fluid">
      <div className="page-inner d-flex align-items-center justify-content-center" style={{ minHeight: "80vh" }}>

        <div className="card shadow-lg border-0 text-center p-4" style={{ maxWidth: "600px", width: "100%" }}>

          {/* ICON */}
          <div className="mb-3">
            <div
              className="rounded-circle d-inline-flex align-items-center justify-content-center"
              style={{
                width: "90px",
                height: "90px",
                background: "#fff3cd",
                color: "#856404",
                fontSize: "40px",
              }}
            >
              ⏳
            </div>
          </div>

          {/* TITLE */}
          <h3 className="fw-bold text-warning mb-2">
            Account Pending Approval
          </h3>

          {/* MESSAGE */}
          <p className="text-muted mb-3">
            Your account has been successfully created and is now awaiting approval
            from the <strong>Estate Manager</strong>.
          </p>

          {/* USER INFO */}
          {user && (
            <div className="bg-light p-3 rounded mb-3 text-start">
              <p className="mb-1">
                <strong>Name:</strong> {user.fullName}
              </p>
              <p className="mb-1">
                <strong>Email:</strong> {user.email}
              </p>
              <p className="mb-0">
                <strong>Role:</strong>{" "}
                <span className="badge bg-info">{user.role}</span>
              </p>
            </div>
          )}

          {/* STATUS BADGE */}
          <div className="mb-3">
            <span className="badge bg-warning text-dark px-3 py-2 fs-6">
              PENDING APPROVAL
            </span>
          </div>

          {/* INFO BOX */}
          <div className="alert alert-info text-start">
            <ul className="mb-0">
              <li>You cannot access the system yet</li>
              <li>Estate Manager must approve your account</li>
              <li>You will be notified once activated</li>
            </ul>
          </div>

          {/* BUTTONS */}
          <div className="d-flex justify-content-center gap-2 mt-3">
            <button
              className="btn btn-outline-primary"
              onClick={() => window.location.reload()}
            >
              Refresh Status
            </button>

            <button
              className="btn btn-secondary"
              onClick={() => {
                localStorage.clear();
                window.location.href = "/login";
              }}
            >
              Logout
            </button>
          </div>

          {/* FOOTER NOTE */}
          <small className="text-muted d-block mt-3">
            Please contact system administrator if approval takes too long.
          </small>

        </div>

      </div>
    </div>
  );
}