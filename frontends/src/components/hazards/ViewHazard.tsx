import React from "react";
import Technicians from "../technicians/Technicians";
import AddRisk from "../risks/AddRisk";
import AddMitigation from "../mitigations/AddMitigation";
import { useLocation, useParams } from "react-router-dom";
import AddCAPA from "../CAPA/AddCapa";
import RiskHazard from "../risks/RiskHazard";
import CapaHazard from "../CAPA/CapaHazard";

export default function ViewHazard() {

      const { hazardId } = useParams<{ hazardId?: string }>();
       const { state } = useLocation();
  return (
    <div className="container-fluid px-3">

      {/* HEADER */}
      <div className="page-inner">

        <div className="card shadow-sm border-0 mb-4">
          <div
            className="card-body text-white"
            style={{
              background: "#1e66ff",
              borderRadius: "10px",
            }}
          >
            <h3 className="mb-1 fw-bold">{state.hazardTitle}</h3>
            <small>Hazard Detail Overview</small>
          </div>
        </div>


        {/* ================= RISKS ================= */}
          <RiskHazard hadazardId ={hazardId}/>

        {/* ================= MITIGATION ================= */}
        <div className="card mb-4 border-0 shadow-sm">
          <div className="card-header bg-info text-white fw-bold">
            Mitigation Actions
             <button type={'button'} style={{ float: 'right' }} className="btn btn-primary mb0" data-bs-toggle="modal" data-bs-target="#mitgationModel">
              <i className="fa fa-plus" ></i> Add Actions 
            </button>
          </div>

          <div className="card-body">
            <table className="table table-hover align-middle">
              <thead className="table-info">
                <tr>
                  <th>Action Title </th>
                  <th>Assigned To</th>
                  <th>Target Date</th>
                  <th>Status</th>
                </tr>
              </thead>

              <tbody>
                <tr>
                  <td>Inspect Control Panel</td>
                  <td>Maintenance Team</td>
                  <td>2026-06-20</td>
                  <td>
                    <span className="badge bg-warning text-dark">
                      Pending
                    </span>
                  </td>
                </tr>

                <tr>
                  <td>Check Sensor Wiring</td>
                  <td>Technician Team</td>
                  <td>2026-06-22</td>
                  <td>
                    <span className="badge bg-primary">
                      In Progress
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        {/* ================= CAPA ================= */}
        <CapaHazard hazardid={hazardId} hadazardTitle={state.hazardTitle} />

      </div>

      {/* <!--CaPA Modal  --> */}
      {/* <!-- Scrollable modal --> */}
      <div className="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabIndex={-1} aria-labelledby="staticBackdropLabel" aria-hidden="true">
        {/* Combined sizing (modal-lg or modal-xl) and scrollable utility directly here */}
        <div className="modal-dialog modal-xl modal-dialog-scrollable">
          <div className="modal-content">
            <div className="modal-header">
              <h1 className="modal-title fs-5 text-primary ms-5" id="staticBackdropLabel"><b>Add CAPA for <u style={{color:"red"}} >{state.hazardTitle}</u></b></h1>
              <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div className="modal-body w-100">
                <AddCAPA  hazardid={hazardId} hadazardTitle={state.hazardTitle} />
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              {/* <button type="button" className="btn btn-primary"><i className="fa fa-save"></i> Save</button> */}
            </div>
          </div>
        </div>
      </div>


    {/* <!--Risks Modal  --> */}
      {/* <!-- Scrollable modal --> */}
      <div className="modal fade" id="riskmodel" data-bs-backdrop="static" data-bs-keyboard="false" tabIndex={-1} aria-labelledby="staticBackdropLabel" aria-hidden="true">
        {/* Combined sizing (modal-lg or modal-xl) and scrollable utility directly here */}
        <div className="modal-dialog modal-xl modal-dialog-scrollable">
          <div className="modal-content">
            <div className="modal-header">
              <h1 className="modal-title fs-5 text-primary ms-5" id="staticBackdropLabel"><b> Add risks for <u>{state.hazardTitle}</u></b></h1>
              <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div className="modal-body w-100">
              <AddRisk   hadazardId ={hazardId} hadazardTitle ={state.hazardTitle} />
            </div>
            <div className="modal-footer">
              <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              {/* <button type="button" className="btn btn-primary"><i className="fa fa-save"></i> Save</button> */}
            </div>
          </div>
        </div>
      </div>

          {/* <!--mitgation Modal  --> */}
      {/* <!-- Scrollable modal --> */}
      <div className="modal fade" id="mitgationModel" data-bs-backdrop="static" data-bs-keyboard="false" tabIndex={-1} aria-labelledby="staticBackdropLabel" aria-hidden="true">
        {/* Combined sizing (modal-lg or modal-xl) and scrollable utility directly here */}
        <div className="modal-dialog modal-xl modal-dialog-scrollable">
          <div className="modal-content">
            <div className="modal-header">
              <h1 className="modal-title fs-5 text-primary ms-5" id="staticBackdropLabel"><b>Add Mitigation Action</b></h1>
              <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div className="modal-body w-100">
              <AddMitigation hadazardId={hazardId} hadazardTitle={state.hazardTitle}/>
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