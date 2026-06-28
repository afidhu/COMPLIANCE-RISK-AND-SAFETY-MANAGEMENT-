

import axios from 'axios';
import React, { useEffect, useState } from 'react';
import BaseUrl from '../utils/api_provider/ApiProviders';
import { Link } from 'react-router-dom';

export default function EmanagerHeaderNotification() {
    const [unapprovedUserCount, setUnapprovedUserCount] = useState(0);
    const [completedTaskCount, setCompletedTaskCount] = useState(0);

    const fetchUnapprovedUserCount = async () => {
        try {
            const response = await axios.get(`${BaseUrl}/auth/users`);
            const users = Array.isArray(response.data) ? response.data : [];
            const count = users.filter((user: any) => user.isApproved === false).length;
            console.log('count:',count)
            setUnapprovedUserCount(count);
        } catch (error) {
            console.error('Failed to fetch unapproved user count:', error);
        }
    };

    const fetchCompletedTaskCount = async () => {
        try {
            const response = await axios.get(`${BaseUrl}/capa/get-completed-unapproved`);
            const tasks = Array.isArray(response.data) ? response.data : [];
            setCompletedTaskCount(tasks.length);
        } catch (error) {
            console.error('Failed to fetch completed task count:', error);
        }
    };

    useEffect(() => {
        fetchUnapprovedUserCount();
        fetchCompletedTaskCount();
    }, []);

    return (
        <div>
            <div className="notif-scroll scrollbar-outer">
                <div className="notif-center">
                    <Link to={'/AllUsers'}>
                        <div className="notif-icon notif-primary">
                            <i className="fa fa-user-plus"></i>
                        </div>
                        <div className="notif-content">
                            <span className="block"> Unapproved users: {unapprovedUserCount} </span>
                            <span className="time">Pending approval</span>
                        </div>
                    </Link>
                    <Link to={'#'}>
                        <div className="notif-icon notif-success">
                            <i className="fa fa-check-circle"></i>
                        </div>
                        <div className="notif-content">
                            <span className="block">
                              Completed tasks awaiting approval: {completedTaskCount}
                            </span>
                            <span className="time">Updated just now</span>
                        </div>
                    </Link>
                
                </div>
            </div>

        </div>
    )
}



{/* <div className="notif-scroll scrollbar-outer">
                <div className="notif-center">
                    <a href="#">
                        <div className="notif-icon notif-primary">
                            <i className="fa fa-user-plus"></i>
                        </div>
                        <div className="notif-content">
                            <span className="block"> New user registered </span>
                            <span className="time">5 minutes ago</span>
                        </div>
                    </a>
                    <a href="#">
                        <div className="notif-icon notif-success">
                            <i className="fa fa-comment"></i>
                        </div>
                        <div className="notif-content">
                            <span className="block">
                              Task Completed <br />
                              <small>by:Alex</small>
                            </span>
                            <span className="time">12 minutes ago</span>
                        </div>
                    </a>
                    <a href="#">
                        <div className="notif-img">
                            <img src="assets/img/profile2.jpg" alt="Img Profile" />
                        </div>
                        <div className="notif-content">
                            <span className="block">
                                Reza send messages to you
                            </span>
                            <span className="time">12 minutes ago</span>
                        </div>
                    </a>
                    <a href="#">
                        <div className="notif-icon notif-danger">
                            <i className="fa fa-heart"></i>
                        </div>
                        <div className="notif-content">
                            <span className="block"> Farrah liked Admin </span>
                            <span className="time">17 minutes ago</span>
                        </div>
                    </a>
                </div>
            </div> */}