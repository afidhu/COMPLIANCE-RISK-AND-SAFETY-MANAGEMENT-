import { use, useContext, useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { UserContext } from "./AuthContext";
import EmanagerHeaderNotification from "../notifications/EmanagerHeaderNotification";
import InspectorHeaderNotification from "../notifications/InspectorHeaderNotification";
import axios from 'axios';
import BaseUrl from '../utils/api_provider/ApiProviders';


export default function NavBar() {

    const navigation = useNavigate()
    const context = useContext(UserContext);
    // Destructure properties from your specific API response user object
    const { user } = context;

    const [notificationCount, setNotificationCount] = useState<number>(0);

    useEffect(() => {
        const fetchCounts = async () => {
            try {
                const usersResp = await axios.get(`${BaseUrl}/auth/users`);
                const users = Array.isArray(usersResp.data) ? usersResp.data : [];
                const unapproved = users.filter((u: any) => u.isApproved === false).length;

                const capasResp = await axios.get(`${BaseUrl}/capa/get-completed-unapproved`);
                const capas = Array.isArray(capasResp.data) ? capasResp.data : [];
                const completedUnapproved = capas.length;

                setNotificationCount(unapproved + completedUnapproved);
            } catch (error) {
                console.error('Failed to fetch notification counts', error);
            }
        };
        fetchCounts();
    }, []);

    const logOut = async () => {
        localStorage.removeItem('user')
        navigation('/Login')
    }

    return (
        <div>
            <nav className="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom">
                <div className="container-fluid">
                    <nav className="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex">
                        <div className="input-group">
                            <div className="input-group-prepend">
                                <button type="submit" className="btn btn-search pe-1">
                                    <i className="fa fa-search search-icon"></i>
                                </button>
                            </div>
                            <input type="text" placeholder="Search ..." className="form-control" />
                        </div>
                    </nav>

                    <ul className="navbar-nav topbar-nav ms-md-auto align-items-center">
                        <li className="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none">
                            <a className="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                                aria-expanded="false" aria-haspopup="true">
                                <i className="fa fa-search"></i>
                            </a>
                            <ul className="dropdown-menu dropdown-search animated fadeIn">
                                <form className="navbar-left navbar-form nav-search">
                                    <div className="input-group">
                                        <input type="text" placeholder="Search ..." className="form-control" />
                                    </div>
                                </form>
                            </ul>
                        </li>
                        <li className="nav-item topbar-icon dropdown hidden-caret">
                            <a className="nav-link dropdown-toggle" href="#" id="messageDropdown" role="button"
                                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i className="fa fa-envelope"></i>
                            </a>
                            <ul className="dropdown-menu messages-notif-box animated fadeIn" aria-labelledby="messageDropdown">
                                <li>
                                    <div className="dropdown-title d-flex justify-content-between align-items-center">
                                        Messages
                                        <a href="#" className="small">Mark all as read</a>
                                    </div>
                                </li>
                                <li>
                                    <div className="message-notif-scroll scrollbar-outer">
                                        <div className="notif-center">
                                            <a href="#">
                                                <div className="notif-img">
                                                    <img src="assets/img/jm_denis.jpg" alt="Img Profile" />
                                                </div>
                                                <div className="notif-content">
                                                    <span className="subject">Jimmy Denis</span>
                                                    <span className="block"> How are you ? </span>
                                                    <span className="time">5 minutes ago</span>
                                                </div>
                                            </a>
                                            <a href="#">
                                                <div className="notif-img">
                                                    <img src="assets/img/chadengle.jpg" alt="Img Profile" />
                                                </div>
                                                <div className="notif-content">
                                                    <span className="subject">Chad</span>
                                                    <span className="block"> Ok, Thanks ! </span>
                                                    <span className="time">12 minutes ago</span>
                                                </div>
                                            </a>
                                            <a href="#">
                                                <div className="notif-img">
                                                    <img src="assets/img/mlane.jpg" alt="Img Profile" />
                                                </div>
                                                <div className="notif-content">
                                                    <span className="subject">Jhon Doe</span>
                                                    <span className="block">
                                                        Ready for the meeting today...
                                                    </span>
                                                    <span className="time">12 minutes ago</span>
                                                </div>
                                            </a>
                                            <a href="#">
                                                <div className="notif-img">
                                                    <img src="assets/img/talha.jpg" alt="Img Profile" />
                                                </div>
                                                <div className="notif-content">
                                                    <span className="subject">Talha</span>
                                                    <span className="block"> Hi, Apa Kabar ? </span>
                                                    <span className="time">17 minutes ago</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <a className="see-all" href="javascript:void(0);">See all messages<i className="fa fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li className="nav-item topbar-icon dropdown hidden-caret">
                            <a className="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button" data-bs-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <i className={`bi bi-lightbulb-fill notif-bulb ${notificationCount > 0 ? 'bulb-pulse ping' : ''}`} aria-hidden="true"></i>
                                {notificationCount > 0 && (
                                    // <span className="notification">{notificationCount}</span>
                                    <span className="notification"><small>New</small></span>
                                )}
                            </a>
                            <ul className="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
                                <li>
                                    <div className="dropdown-title">
                                        {/* You have {notificationCount} new notification */}
                                        You have new notification
                                    </div>
                                </li>
                                <li>
                                   {/* notification bar */}
                                    {
                                        user.role ==='ESTATE_MANAGER' ?  <EmanagerHeaderNotification/>: (user.role =='INSPECTOR'? <InspectorHeaderNotification />: <><small>SAFETY_OFFICER wait</small></>)
                                    }
                                    {/* <EmanagerHeaderNotification/> */}
                                    {/* <InspectorHeaderNotification /> */}
                                </li>
                                <li>
                                    <a className="see-all" href="javascript:void(0);">See all notifications<i className="fa fa-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        {/* <li className="nav-item topbar-icon dropdown hidden-caret">
                            <a className="nav-link" data-bs-toggle="dropdown" href="#" aria-expanded="false">
                                <i className="fas fa-layer-group"></i>
                            </a>
                            <div className="dropdown-menu quick-actions animated fadeIn">
                                <div className="quick-actions-header">
                                    <span className="title mb-1">Quick Actions</span>
                                    <span className="subtitle op-7">Shortcuts</span>
                                </div>
                                <div className="quick-actions-scroll scrollbar-outer">
                                    <div className="quick-actions-items">
                                        <div className="row m-0">
                                            <a className="col-6 col-md-4 p-0" href="#">
                                                <div className="quick-actions-item">
                                                    <div className="avatar-item bg-danger rounded-circle">
                                                        <i className="far fa-calendar-alt"></i>
                                                    </div>
                                                    <span className="text">Calendar</span>
                                                </div>
                                            </a>
                                            <a className="col-6 col-md-4 p-0" href="#">
                                                <div className="quick-actions-item">
                                                    <div className="avatar-item bg-warning rounded-circle">
                                                        <i className="fas fa-map"></i>
                                                    </div>
                                                    <span className="text">Maps</span>
                                                </div>
                                            </a>
                                            <a className="col-6 col-md-4 p-0" href="#">
                                                <div className="quick-actions-item">
                                                    <div className="avatar-item bg-info rounded-circle">
                                                        <i className="fas fa-file-excel"></i>
                                                    </div>
                                                    <span className="text">Reports</span>
                                                </div>
                                            </a>
                                            <a className="col-6 col-md-4 p-0" href="#">
                                                <div className="quick-actions-item">
                                                    <div className="avatar-item bg-success rounded-circle">
                                                        <i className="fas fa-envelope"></i>
                                                    </div>
                                                    <span className="text">Emails</span>
                                                </div>
                                            </a>
                                            <a className="col-6 col-md-4 p-0" href="#">
                                                <div className="quick-actions-item">
                                                    <div className="avatar-item bg-primary rounded-circle">
                                                        <i className="fas fa-file-invoice-dollar"></i>
                                                    </div>
                                                    <span className="text">Invoice</span>
                                                </div>
                                            </a>
                                            <a className="col-6 col-md-4 p-0" href="#">
                                                <div className="quick-actions-item">
                                                    <div className="avatar-item bg-secondary rounded-circle">
                                                        <i className="fas fa-credit-card"></i>
                                                    </div>
                                                    <span className="text">Payments</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li> */}

                        <li className="nav-item topbar-user dropdown hidden-caret">
                            <a className="dropdown-toggle profile-pic" data-bs-toggle="dropdown" href="#" aria-expanded="false">
                                <div className="avatar-sm">
                                    <img src="assets/img/profile.jpg" alt="..." className="avatar-img rounded-circle" />
                                </div>
                                <span className="profile-username">
                                    <span className="op-7">Hi,</span>
                                    <span className="fw-bold">{user?.fullName}</span>
                                </span>
                            </a>
                            <ul className="dropdown-menu dropdown-user animated fadeIn">
                                <div className="dropdown-user-scroll scrollbar-outer">
                                    <li>
                                        <div className="user-box">
                                            <div className="avatar-lg">
                                                <img src="assets/img/profile.jpg" alt="image profile" className="avatar-img rounded" />
                                            </div>
                                            <div className="u-text">
                                                <h4>{user?.fullName}</h4>
                                                <p className="text-muted">{user?.email}</p>
                                                <a href="profile.html" className="btn btn-xs btn-secondary btn-sm">View Profile</a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div className="dropdown-divider"></div>
                                        <a className="dropdown-item" href="#">Role: <small><b>{user.role}</b></small></a>
                                        {/* <a className="dropdown-item" href="#">My Balance</a> */}
                                        {/* <a className="dropdown-item" href="#">Inbox</a> */}
                                        <div className="dropdown-divider"></div>
                                        <a className="dropdown-item" href="#">Account Setting</a>
                                        <div className="dropdown-divider"></div>
                                        <a onClick={logOut} className="dropdown-item" href="#">Logout </a>
                                    </li>
                                </div>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    )
}
