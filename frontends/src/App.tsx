import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from './assets/vite.svg'
import heroImg from './assets/hero.png'
import './App.css'
import { BrowserRouter, Routes, Route, Link } from 'react-router-dom';
import MainDashbaordIncluder from './components/includes/MainDashbaordIncluder';
import Dashboard from './components/dashbaords/Dashboard';
import MainDashboard from './components/includes/MainDashboard';
import Assets from './components/assets_pages/Assets';
import AddAsset from './components/assets_pages/AddAsset';
import ViewAssetCertifications from './components/assets_pages/viewAssetCertifications';
import AddHazards from './components/hazards/AddHazards';
import Hazards from './components/hazards/Hazards';
import ViewHazard from './components/hazards/ViewHazard';
import Risks from './components/risks/Risks';
import Technicians from './components/technicians/Technicians';
import Incidents from './components/incidents/Incidents';
import AddIncident from './components/incidents/AddIncident';
import ViewIncident from './components/incidents/ViewIncident';
import AddAssetCompliance from './components/compliances/AddAssetCompliance';
import ViewAssetCompliance from './components/compliances/AddCompliance';
import AddRisk from './components/risks/AddRisk';


function App() {

  return (
  <BrowserRouter>
      {/* Navigation */}
      {/* <nav>
        <Link to="/">Home</Link> |{" "}
        <Link to="/about">About</Link> |{" "}
        <Link to="/contact">Contact</Link>
      </nav> */}

      {/* Routes */}
      
      <Routes>
        {/* <Route path="/dashboard" element={<Dashboard />} /> */}
        <Route path="/" element={<MainDashboard />} >
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/assets" element={<Assets />} />
        <Route path="/add-asset" element={<AddAsset />} />
        <Route path="/AddAssetCompliance" element={<AddAssetCompliance />} />
        <Route path="/ViewAssetCompliance" element={<ViewAssetCompliance />} />
        <Route path="/AddHazard" element={<AddHazards />} />
        <Route path="/Incidents" element={<Incidents />} /> 
        <Route path="/AddIncident" element={<AddIncident />} /> 
        <Route path="/ViewIncident/:id" element={<ViewIncident />} /> 
        <Route path="/Hazards" element={<Hazards />} />
        <Route path="/Hazard/:id" element={<ViewHazard />} />
        <Route path="/risks" element={<Risks />} />
        <Route path="/AddRisk" element={<AddRisk />} />
        <Route path="/Technicians" element={<Technicians />} />
        {/* <Route path="/ViewAssetCertifications" element={<ViewAssetCertifications />} /> */}
        </Route>
        {/* <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/contact" element={<Contact />} /> */}
      </Routes>
    </BrowserRouter>
  )
}

export default App
