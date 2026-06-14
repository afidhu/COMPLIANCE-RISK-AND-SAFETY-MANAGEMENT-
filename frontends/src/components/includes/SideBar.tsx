import { Link } from "react-router-dom";


export default function SideBar() {
    return (
        <div>
            <div className="sidebar" data-background-color="dark">
                <div className="sidebar-logo">
                    {/* <!-- Logo Header --> */}
                    <div className="logo-header" data-background-color="dark">
                        <Link to={'/dashboard'} className="logo">
                            <img src="data:image/png;base64,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" alt="navbar brand" className="navbar-brand" height="66" width="160" />
                        </Link>
                        <div className="nav-toggle">
                            <button className="btn btn-toggle toggle-sidebar">
                                <i className="gg-menu-right"></i>
                            </button>
                            <button className="btn btn-toggle sidenav-toggler">
                                <i className="gg-menu-left"></i>
                            </button>
                        </div>
                        <button className="topbar-toggler more">
                            <i className="gg-more-vertical-alt"></i>
                        </button>
                    </div>
                    {/* <!-- End Logo Header --> */}
                </div>
                <div className="sidebar-wrapper scrollbar scrollbar-inner">
                    <div className="sidebar-content">
                        <ul className="nav nav-secondary">
                            <li className="nav-item active">
                                <a data-bs-toggle="collapse" href="#dashboard" className="collapsed" aria-expanded="false">
                                    <i className="fas fa-home"></i>
                                    <p>Dashboard</p>
                                    <span className="caret"></span>
                                </a>
                                <div className="collapse" id="dashboard">
                                    <ul className="nav nav-collapse">
                                        <li>
                                            <a href="index.html">
                                                <span className="sub-item">Dashboard</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li className="nav-section">
                                <span className="sidebar-mini-icon">
                                    <i className="fa fa-ellipsis-h"></i>
                                </span>
                                <h4 className="text-section">Components</h4>
                            </li>



                            <li className="nav-item">
                                <a data-bs-toggle="collapse" href="#assetCompliance">
                                    <i className="fas fa-layer-group"></i>
                                    <p>Asset & Compliance</p>
                                    <span className="caret"></span>
                                </a>
                                <div className="collapse" id="assetCompliance">
                                    <ul className="nav nav-collapse">
                                        <li>
                                            <Link to={'/assets'}>
                                                <span className="sub-item">Assets</span>
                                            </Link>
                                        </li>
                                        <li>
                                            <a href="./incidents/incidents.html">
                                                <span className="sub-item">Compliance</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>

                            <li className="nav-item">
                                <a data-bs-toggle="collapse" href="#HazardIncident">
                                    <i className="fas fa-layer-group"></i>
                                    <p>Hazard & Incident</p>
                                    <span className="caret"></span>
                                </a>
                                <div className="collapse" id="HazardIncident">
                                    <ul className="nav nav-collapse">
                                        <li>
                                            <Link to={'/Hazards'}>
                                                <span className="sub-item">Hazard</span>
                                            </Link>
                                        </li>
                                        <li>
                                            <Link to={'/Incidents'}>
                                                <span className="sub-item">Incidents</span>
                                            </Link>
                                        </li>
                                    </ul>
                                </div>
                            </li>

                            <li className="nav-item">
                                <a data-bs-toggle="collapse" href="#MitigationsRisks">
                                    <i className="fas fa-layer-group"></i>
                                    <p> Risks & Mitigation</p>
                                    <span className="caret"></span>
                                </a>
                                <div className="collapse" id="MitigationsRisks">
                                    <ul className="nav nav-collapse">
                                        <li>
                                            <Link to={'/risks'}>
                                                <span className="sub-item">Risks</span>
                                            </Link>
                                        </li>
                                        <li>
                                            <a href="./incidents/incidents.html">
                                                <span className="sub-item">Mitigation</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>

                            <li className="nav-item">
                                <a data-bs-toggle="collapse" href="#sidebarLayouts">
                                    <i className="fas fa-th-list"></i>
                                    <p>Reports</p>
                                    <span className="caret"></span>
                                </a>
                                <div className="collapse" id="sidebarLayouts">
                                    <ul className="nav nav-collapse">
                                        <li>
                                            <a href="./reports/risks.html">
                                                <span className="sub-item">Risks</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="./reports/incidents.html">
                                                <span className="sub-item">Incidents</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="./reports/assets.html">
                                                <span className="sub-item">Assets</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>

                            <li className="nav-item">
                                <a data-bs-toggle="collapse" href="#inspections">
                                    <i className="fas fa-th-list"></i>
                                    <p>Inspections</p>
                                    <span className="caret"></span>
                                </a>
                                <div className="collapse" id="inspections">
                                    <ul className="nav nav-collapse">
                                        <li>
                                            <a href="./inspections/inspection.html">
                                                <span className="sub-item">Inspection</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>


                            <li className="nav-item">
                                <a data-bs-toggle="collapse" href="#forms">
                                    <i className="fas fa-pen-square"></i>
                                    <p>Forms</p>
                                    <span className="caret"></span>
                                </a>
                                <div className="collapse" id="forms">
                                    <ul className="nav nav-collapse">
                                        <li>
                                            <a href="forms/forms.html">
                                                <span className="sub-item">Basic Form</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li className="nav-item">
                                <a data-bs-toggle="collapse" href="#tables">
                                    <i className="fas fa-table"></i>
                                    <p>Tables</p>
                                    <span className="caret"></span>
                                </a>
                                <div className="collapse" id="tables">
                                    <ul className="nav nav-collapse">
                                        <li>
                                            <a href="tables/tables.html">
                                                <span className="sub-item">Basic Table</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="tables/datatables.html">
                                                <span className="sub-item">Datatables</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li className="nav-item">
                                <a data-bs-toggle="collapse" href="#maps">
                                    <i className="fas fa-map-marker-alt"></i>
                                    <p>Maps</p>
                                    <span className="caret"></span>
                                </a>
                                <div className="collapse" id="maps">
                                    <ul className="nav nav-collapse">
                                        <li>
                                            <a href="maps/googlemaps.html">
                                                <span className="sub-item">Google Maps</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="maps/jsvectormap.html">
                                                <span className="sub-item">Jsvectormap</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li className="nav-item">
                                <a data-bs-toggle="collapse" href="#charts">
                                    <i className="far fa-chart-bar"></i>
                                    <p>Charts</p>
                                    <span className="caret"></span>
                                </a>
                                <div className="collapse" id="charts">
                                    <ul className="nav nav-collapse">
                                        <li>
                                            <a href="charts/charts.html">
                                                <span className="sub-item">Chart Js</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="charts/sparkline.html">
                                                <span className="sub-item">Sparkline</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li className="nav-item">
                                <a href="widgets.html">
                                    <i className="fas fa-desktop"></i>
                                    <p>Widgets</p>
                                    <span className="badge badge-success">4</span>
                                </a>
                            </li>
                            <li className="nav-item">
                                <a href="../../documentation/index.html">
                                    <i className="fas fa-file"></i>
                                    <p>Documentation</p>
                                    <span className="badge badge-secondary">1</span>
                                </a>
                            </li>
                            <li className="nav-item">
                                <a data-bs-toggle="collapse" href="#submenu">
                                    <i className="fas fa-bars"></i>
                                    <p>Menu Levels</p>
                                    <span className="caret"></span>
                                </a>
                                <div className="collapse" id="submenu">
                                    <ul className="nav nav-collapse">
                                        <li>
                                            <a data-bs-toggle="collapse" href="#subnav1">
                                                <span className="sub-item">Level 1</span>
                                                <span className="caret"></span>
                                            </a>
                                            <div className="collapse" id="subnav1">
                                                <ul className="nav nav-collapse subnav">
                                                    <li>
                                                        <a href="#">
                                                            <span className="sub-item">Level 2</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="#">
                                                            <span className="sub-item">Level 2</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                            <a data-bs-toggle="collapse" href="#subnav2">
                                                <span className="sub-item">Level 1</span>
                                                <span className="caret"></span>
                                            </a>
                                            <div className="collapse" id="subnav2">
                                                <ul className="nav nav-collapse subnav">
                                                    <li>
                                                        <a href="#">
                                                            <span className="sub-item">Level 2</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span className="sub-item">Level 1</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    )
}
