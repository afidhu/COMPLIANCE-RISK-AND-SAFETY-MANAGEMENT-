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
import AddRisk from './components/risks/AddRisk';
import AddMitigation from './components/mitigations/AddMitigation';
import ViewAssetCompliance from './components/compliances/ViewAssetCompliance';
import Login from './components/auths/Login';
import Register from './components/auths/Register';
import { getInitialUser, UserContext } from './components/includes/AuthContext';
import Compliance from './components/compliances/Compliance';
import RisksReport from './components/reports/RisksReport';
import IncidentsReport from './components/reports/IncidentsReport';
import AssetsReport from './components/reports/AssetsReport';
import AllUsers from './components/auths/AllUsers';
import ComplianceAnalysis from './components/compliances/ComplianceAnalysis';
import DashboardAnalysis from './components/dashbaords/DashboardAnalysis';
import UnapprovedScreen from './components/utils/UnapprovedScreen';
import Notifications from './components/notifications/Notifications';
import AppSetting from './components/utils/AppSetting';
import HazardUpdate from './components/hazards/HazardUpdate'
import UpdateIncident from './components/incidents/UpdateIncident';


function App() {
 // Define reactive state for the user using the initial values from local storage
  const [user, setUser] = useState(getInitialUser);
  return (
    
       // Provide both the current user and the setter function to the application
    <UserContext.Provider value={{ user, setUser }}>
   
  
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
        <Route path="/" element={<Login />} /> 
        <Route path="/Unapproved" element={<UnapprovedScreen />} /> 
       
        <Route path="/" element={<MainDashboard />} >
         <Route path="/AllUsers" element={<AllUsers />} /> 
         <Route path="/ComplianceAnalysis" element={<ComplianceAnalysis />} /> 
         <Route path="/DashboardAnalysis" element={<DashboardAnalysis />} /> 
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/assets" element={<Assets />} />
        <Route path="/add-asset" element={<AddAsset />} />
        <Route path="/AddAssetCompliance/:assetId/:assetName" element={<AddAssetCompliance />} />
        <Route path="/ViewAssetCompliance/:assetId" element={<ViewAssetCompliance />} />
        <Route path="/Compliance" element={<Compliance />} />
        <Route path="/AddHazard" element={<AddHazards />} />
        <Route path="/Incidents" element={<Incidents />} /> 
        <Route path="/AddIncident" element={<AddIncident />} /> 
        <Route path="/ViewIncident/:id" element={<ViewIncident/>} /> 
        <Route path="/Hazards" element={<Hazards />} />
        <Route path="/Hazard/:hazardId" element={<ViewHazard />} />
        <Route path="/HazardUpdate/:hazardId" element={<HazardUpdate />} />
        <Route path="/risks" element={<Risks />} /> 

        <Route path="/Notifications" element={<Notifications />} />
        <Route path="/appSetting" element={<AppSetting />} />
      
        <Route path="/RisksReport" element={<RisksReport />} /> 
        <Route path="/IncidentsReport" element={<IncidentsReport />} /> 
        <Route path="/AssetsReport" element={<AssetsReport />} /> 
        <Route path="/UpdateIncident/:id" element={<UpdateIncident />} />
        {/* <Route path="/Incidents" element={<Incidents />} /> Risks */}
        {/* <Route path="/Risks" element={<Risks />} />  */}
        {/* <Route path="/AddRisk" element={<AddRisk  />} /> */}

        {/* <Route path="/AddMitigation" element={<AddMitigation />} /> */}
        <Route path="/Technicians" element={<Technicians />} />
        {/* <Route path="/ViewAssetCertifications" element={<ViewAssetCertifications />} /> */}
        </Route>
        {/* <Route path="/dashboard" element={<Dashboard />} /> */}
        <Route path="/Login" element={<Login />} />
        <Route path="/Register" element={<Register />} />
      </Routes>
    </BrowserRouter>
     </UserContext.Provider>
  )
}

export default App
