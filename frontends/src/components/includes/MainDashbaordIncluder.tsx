

import { Outlet } from "react-router";
import MainDashboard from "./MainDashboard";



export default function MainDashbaordIncluder() {
  return (
    <div>
      <MainDashboard/>
      
       <Outlet />
    </div>
  )
}

