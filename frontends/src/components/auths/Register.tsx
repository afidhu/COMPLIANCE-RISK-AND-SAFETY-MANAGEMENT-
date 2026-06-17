import { useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";

const Register = () => {
  const navigate = useNavigate();

  const [full_name, setFullName] =
    useState("");

  const [email, setEmail] =
    useState("");

  const [phone, setPhone] =
    useState("");

  const [role, setRole] =
    useState("Inspector");

  const [status, setStatus] =
    useState("Active");

  const [password, setPassword] =
    useState("");

  const [loading, setLoading] =
    useState(false);

  const [error, setError] =
    useState("");

  const [success, setSuccess] =
    useState("");

  const handleRegister = async (
    e: React.FormEvent
  ) => {
    e.preventDefault();

    setError("");
    setSuccess("");

    try {
      setLoading(true);

     const response =  await axios.post(
       "http://localhost:51213/auth/register/",
        {
          fullName:full_name,
          email,
          role,
          phone,
          status,
          password,
        }
      );

      setSuccess(
        "Account created successfully"
      );
         localStorage.setItem(
      "user",
      JSON.stringify(response.data)
    );

      setTimeout(() => {
        navigate("/dashboard");
      }, 1500);
    } catch (err: any) {
      setError(
        err?.response?.data?.message ||
          "Registration failed"
      );
    } finally {
      setLoading(false);
    }
  };

  return (
    <div
      className="min-vh-100 d-flex align-items-center justify-content-center"
      style={{
        background:
          "linear-gradient(135deg,#061a33,#0d47a1,#0a2540)",
      }}
    >
      <div
        className="card border-0 shadow-lg"
        style={{
          width: "550px",
          borderRadius: "20px",
          background: "#0f2747",
        }}
      >
        <div className="card-body p-5">

          <div className="text-center mb-4">

            <div
              className="mx-auto mb-3 d-flex align-items-center justify-content-center"
              style={{
                width: "70px",
                height: "70px",
                borderRadius: "50%",
                background: "#1e66ff",
                color: "white",
                fontSize: "30px",
              }}
            >
              👤
            </div>

            <h3 className="text-white fw-bold">
              Create Account
            </h3>

          </div>

          {error && (
            <div className="alert alert-danger">
              {error}
            </div>
          )}

          {success && (
            <div className="alert alert-success">
              {success}
            </div>
          )}

          <form onSubmit={handleRegister}>

            <div className="row">

              <div className="col-md-6 mb-3">
                <label className="text-white">
                  Full Name
                </label>

                <input
                  className="form-control"
                  value={full_name}
                  onChange={(e) =>
                    setFullName(e.target.value)
                  }
                />
              </div>

              <div className="col-md-6 mb-3">
                <label className="text-white">
                  Email
                </label>

                <input
                  type="email"
                  className="form-control"
                  value={email}
                  onChange={(e) =>
                    setEmail(e.target.value)
                  }
                />
              </div>

              <div className="col-md-6 mb-3">
                <label className="text-white">
                  Phone
                </label>

                <input
                  className="form-control"
                  value={phone}
                  onChange={(e) =>
                    setPhone(e.target.value)
                  }
                />
              </div>

              <div className="col-md-6 mb-3">
                <label className="text-white">
                  Role
                </label>

                <select
                  className="form-select"
                  value={role}
                  onChange={(e) =>
                    setRole(e.target.value)
                  }
                >
                
                  <option  value={'ESTATE_MANAGER'} >Estate menager</option>
                  <option  value={'INSPECTOR'} >Inspector</option>
                  <option  value={'SAFETY_OFFICER'} > Safety Officer </option>
                  <option  value={'TECHNICIAN'} >Technician</option>
                  <option  value={'STAFF_MEMBER'} >Staff member</option>
                </select>
              </div>

              <div className="col-md-6 mb-3">
                <label className="text-white">
                  Status
                </label>

                <select
                  className="form-select"
                  value={status}
                  onChange={(e) =>
                    setStatus(e.target.value)
                  }
                >
                  <option>Active</option>
                  <option>Inactive</option>
                </select>
              </div>

              <div className="col-md-6 mb-3">
                <label className="text-white">
                  Password
                </label>

                <input
                  type="password"
                  className="form-control"
                  value={password}
                  onChange={(e) =>
                    setPassword(e.target.value)
                  }
                />
              </div>

            </div>

            <button
              className="btn btn-primary w-100 mt-3"
              disabled={loading}
            >
              {loading
                ? "Creating Account..."
                : "Register"}
            </button>

            <div className="text-center mt-4">

              <span className="text-light">
                Already have an account?
              </span>

              <Link
                to="/Login"
                className="ms-2 text-info text-decoration-none"
              >
                Login
              </Link>

            </div>

          </form>
        </div>
      </div>
    </div>
  );
};

export default Register;