import { Link } from "react-router-dom";
import { useState } from "react";
import axios from "axios";

export default function AddAsset() {
  const [formData, setFormData] = useState({
    assetName: "",
    assetType: "",
    location: "",
    serialNo: "",
    createdById:"cmq3rfv800001rte2k6ioz6ut",
    // status: "",
  });

  const[ isClicked,setIsClicked]=useState(false)
  const[ isAdded,setIsAdded]=useState(false)
  const[ assetId,setassetId]=useState('')
  const[ assetName,setassetName]=useState('')


const addAssetHandle = async (e: React.FormEvent) => {
  e.preventDefault();
   setIsClicked(true)

  try {
    const response = await axios.post(
      "http://localhost:51213/assets/add",
      formData
    );

    console.log(response.data);

    if(response.status ==201){
      setassetId(response.data.assetId)
      setassetName(response.data.assetName)
      setIsClicked(false)
      setIsAdded(true)
      alert(`Asset added successfully :${ response.status}`);
    }
    // setIsClicked(false)
    setIsAdded(false)

    // reset input
  

  } catch (error:any) {
   setTimeout(()=>{
    alert(`Asset added Fail :${error.message}`);
     setIsClicked(false)
   },400)
    setIsAdded(false)
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

          <form onSubmit={addAssetHandle} typeof="POST" >

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
                  name={'assetName'}
                  value={formData.assetName}
                  onChange={handleInputChange}
                 
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
                  name={'assetType'}
                  value={formData.assetType}
                  onChange={handleInputChange}
                >
                  <option value="" disabled>
                    Select asset type
                  </option>

                  <option value={'ELECTRICAL_DEVICE'} >Electrical</option>
                  <option value={'BOILER'} >Boilers</option>
                  <option value={'LIFT'} >Lift</option>
                  <option value={'PRESSURE_VESSEL'} >Pressues vessel</option>
                  <option value={'EXPLOSIVES'}>Explosives</option>
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
                  name={'location'}
                  value={formData.location}
                  onChange={handleInputChange}
                />
              </div>
            </div>

            {/* ASSET SeriaNo */}
            <div className="mb-4">
              <label className="form-label fw-semibold">
              Serial No
              </label>

              <div className="input-group">
                <span className="input-group-text bg-light border-end-0">
                  <i className="fas fa-hashtag text-primary"></i>
                </span>

                <input
                  type="text"
                  className="form-control border-start-0 py-3"
                  placeholder="Enter asset serial No"
                  name={'serialNo'}
                  value={formData.serialNo}
                  onChange={handleInputChange}
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

{
  isClicked ?    <><div className="spinner-border" role="status">
  <span className="sr-only">Loading...</span>
</div></> :<div  className="btn text-white px-4 py-2 rounded-3 fw-semibold"
                style={{ background: "#1e66ff" }}>

                  <button  type="submit" className="btn btn-primary" value={'Save'} style={{ background: "#1e66ff" }}>
                    Save
                  </button>

              </div>
}
              {assetId.length >0? <Link to={`/AddAssetCompliance/${assetId}/${assetName}`}
                className="btn text-white px-4 py-2 rounded-3 fw-semibold"
                style={{ background: "#1e66ff" }}
              >
                Save & Next
                <i className="fas fa-arrow-right ms-2"></i>
              </Link> :null
              } 

              

            </div>

          </form>

        </div>
      </div>
    </div>
  );
}