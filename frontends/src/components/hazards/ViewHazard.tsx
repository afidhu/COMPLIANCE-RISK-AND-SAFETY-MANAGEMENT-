import React from "react";
import Technicians from "../technicians/Technicians";
import AddRisk from "../risks/AddRisk";
import AddMitigation from "../mitigations/AddMitigation";
import { useLocation, useParams } from "react-router-dom";
import AddCAPA from "../CAPA/AddCapa";
import RiskHazard from "../risks/RiskHazard";
import CapaHazard from "../CAPA/CapaHazard";
import HazardMitigation from "../mitigations/HazardMitigation";

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
              background: "linear-gradient(135deg, #1e66ff 0%, #4a97ff 100%)",
              borderRadius: "10px",
              minHeight: "140px",
            }}
          >
            <div className="d-flex flex-column justify-content-between h-100">
              <div>
                <h3 className="mb-2 fw-bold">{state.hazardTitle}</h3>
                <p className="mb-0 fs-6 text-white-75">{state.hazardDescription}</p>
              </div>
            </div>
          </div>
        </div>


        {/* ================= RISKS ================= */}
          <RiskHazard hadazardId ={hazardId}/>

        {/* ================= MITIGATION ================= */}
       <HazardMitigation hazardId={hazardId} />

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