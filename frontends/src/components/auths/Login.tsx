
import { useContext, useState } from "react";
import axios from "axios";
import { Link, useNavigate } from "react-router-dom";
import { UserContext } from "../includes/AuthContext";

const Login = () => {
  const navigate = useNavigate();

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [success, setSuccess] = useState("");

const { setUser } = useContext(UserContext);

const handleLogin = async (e: React.FormEvent) => {
  e.preventDefault();
  setError("");
  setSuccess("");

  try {
    setLoading(true);

    const response = await axios.post(
      "http://localhost:51213/auth/login/",
      { email, password }
    );

    setSuccess("Login successful");

    // 2. Save to localStorage to persist across page reloads
    localStorage.setItem(
      "user",
      JSON.stringify(response.data)
    );

    // 3. IMMEDIATELY update your context state so the whole app knows the user is logged in
    if (setUser) {
      setUser(response.data);
    }

    setTimeout(() => {
      navigate("/dashboard");
    }, 1000);
    
  } catch (err: any) {
    alert(`error:${err.message}`);
    setError(
      err?.response?.data?.message || "Invalid credentials"
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
          width: "430px",
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
              🛡️
            </div>

            <h3 className="text-white fw-bold">
              Facility Compliance
            </h3>

            <p className="text-light opacity-75">
              Sign in to continue
            </p>
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

          <form onSubmit={handleLogin}>

            <div className="mb-3">
              <label className="text-white mb-2">
                Email
              </label>

              <input
                type="email"
                className="form-control form-control-lg"
                placeholder="Enter email"
                value={email}
                onChange={(e) =>
                  setEmail(e.target.value)
                }
              />
            </div>

            <div className="mb-4">
              <label className="text-white mb-2">
                Password
              </label>

              <input
                type="password"
                className="form-control form-control-lg"
                placeholder="Enter password"
                value={password}
                onChange={(e) =>
                  setPassword(e.target.value)
                }
              />
            </div>

            <button type="submit"
              className="btn btn-primary btn-lg w-100"
              disabled={loading}
            >
              {loading
                ? "Signing In..."
                : "Login"}
            </button>

            <div className="text-center mt-4">
              <span className="text-light">
                Don't have an account?
              </span>

              <Link
                to="/Register"
                className="ms-2 text-info text-decoration-none"
              >
                Register
              </Link>
            </div>

          </form>
        </div>
      </div>
    </div>
  );
};

export default Login;