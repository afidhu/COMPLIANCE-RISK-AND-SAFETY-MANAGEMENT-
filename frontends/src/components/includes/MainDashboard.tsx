import { Outlet } from "react-router";
import Footer from "./Footer";
import Header from "./Header";
import NavBar from "./NavBar";
import SideBar from "./SideBar";
import Dashboard from "../dashbaords/Dashboard";


export default function MainDashboard() {

    return (
        <div>
            <div className="wrapper">
                {/* <!-- Sidebar --> */}
                <SideBar />
                {/* <!-- End Sidebar --> */}

                <div className="main-panel">
                    <div className="main-header">
                        <div className="main-header-logo">
                            {/* <!-- Logo Header --> */}
                            <Header />
                            {/* <!-- End Logo Header --> */}
                        </div>
                        {/* <!-- Navbar Header --> */}
                        <NavBar />
                        {/* <!-- End Navbar --> */}
                    </div>
                    <br />
                    <br />

                    {/* start Content dynamic rendering */}
                    <Outlet />
                  
                    {/* End Content dynamic rendering */}

                    {/* start footer */}
                    <Footer />
                    {/* end footer */}
                </div>
            </div>
        </div>
    )



}