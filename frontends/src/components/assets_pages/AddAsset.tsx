import { Link } from "react-router-dom";

export default function AddAsset() {
  return (
    <div className="container">
      {/* ADD ASSET FORM */}
      <div className="card shadow-sm border-0 rounded-4">

        {/* HEADER */}
        <div className="card-header bg-white border-0 p-4">
          <div className="d-flex align-items-center">

            <div
              className="d-flex align-items-center justify-content-center me-3"
              style={{
                width: "60px",
                height: "60px",
                borderRadius: "18px",
                background: "#1e66ff",
                color: "white",
                fontSize: "24px",
              }}
            >
              <i className="fas fa-building"></i>
            </div>

            <div>
              <h3 className="fw-bold mb-1">Add Asset</h3>
              <p className="text-muted mb-0">
                Register new asset information
              </p>
            </div>

          </div>
        </div>

        {/* BODY */}
        <div className="card-body p-4">

          <form>

            {/* ASSET ID */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Asset ID
              </label>

              <div className="input-group">
                <span className="input-group-text bg-light border-end-0">
                  <i className="fas fa-hashtag text-primary"></i>
                </span>

                <input
                  type="text"
                  className="form-control border-start-0 py-3"
                  placeholder="Enter asset ID"
                />
              </div>
            </div>

            {/* ASSET NAME */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Asset Name
              </label>

              <div className="input-group">
                <span className="input-group-text bg-light border-end-0">
                  <i className="fas fa-building text-primary"></i>
                </span>

                <input
                  type="text"
                  className="form-control border-start-0 py-3"
                  placeholder="Enter asset name"
                />
              </div>
            </div>

            {/* ASSET TYPE */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Asset Type
              </label>

              <div className="input-group">
                <span className="input-group-text bg-light border-end-0">
                  <i className="fas fa-layer-group text-primary"></i>
                </span>

                <select
                  className="form-select border-start-0 py-3"
                  defaultValue=""
                >
                  <option value="" disabled>
                    Select asset type
                  </option>

                  <option>Elevator</option>
                  <option>Generator</option>
                  <option>Fire Equipment</option>
                  <option>Electrical</option>
                </select>
              </div>
            </div>

            {/* LOCATION */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Location
              </label>

              <div className="input-group">
                <span className="input-group-text bg-light border-end-0">
                  <i className="fas fa-location-dot text-primary"></i>
                </span>

                <input
                  type="text"
                  className="form-control border-start-0 py-3"
                  placeholder="Enter asset location"
                />
              </div>
            </div>

            {/* STATUS */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
                Status
              </label>

              <div className="input-group">
                <span className="input-group-text bg-light border-end-0">
                  <i className="fas fa-circle-check text-primary"></i>
                </span>

                <select
                  className="form-select border-start-0 py-3"
                  defaultValue=""
                >
                  <option value="" disabled>
                    Select status
                  </option>

                  <option>Active</option>
                  <option>Inactive</option>
                  <option>Maintenance</option>
                  <option>Expired</option>
                </select>
              </div>
            </div>

            {/* BUTTONS */}
            <div className="d-flex justify-content-end gap-3 mt-5">

              <a
                href="assets.html"
                className="btn btn-light px-4 py-2 rounded-3 fw-semibold"
              >
                <i className="fas fa-arrow-left me-2"></i>
                Back
              </a>

              <Link to={'/AddAssetCompliance'}
                className="btn text-white px-4 py-2 rounded-3 fw-semibold"
                style={{ background: "#1e66ff" }}
              >
                Save & Next
                <i className="fas fa-arrow-right ms-2"></i>
              </Link>

            </div>

          </form>

        </div>
      </div>
    </div>
  );
}