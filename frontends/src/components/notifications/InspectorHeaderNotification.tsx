
import React, { useEffect, useState } from 'react'
import BaseUrl from '../utils/api_provider/ApiProviders';
import axios from 'axios';

export default function InspectorHeaderNotification() {

    const [compliances, setCompliances] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [dueSoonCount, setDueSoonCount] = useState(0);
    const [overdueCount, setOverdueCount] = useState(0);

    useEffect(() => {
        getCompliance();
    }, []);

    const getCompliance = async () => {
        try {
            const response = await axios.get(
                `${BaseUrl}/compliance/get/`
            );

            const data = Array.isArray(response.data) ? response.data : [];
            setCompliances(data);

            let dueSoon = 0;
            let overdue = 0;

            data.forEach((item: any) => {
                const status = (item.status || '').toString().toUpperCase();

                if (status === 'OVERDUE') {
                    overdue += 1;
                } else if (status === 'DUE_SOON' || status === 'DUE') {
                    dueSoon += 1;
                }
            });

            setDueSoonCount(dueSoon);
            setOverdueCount(overdue);
        } catch (error) {
            console.log(error);
        } finally {
            setLoading(false);
        }
    };

  return (
    <div>

        <div className="notif-scroll scrollbar-outer">
                <div className="notif-center">
                    <a href="#">
                        <div className="notif-icon notif-primary">
                            <i className="fa fa-calendar-alt"></i>
                        </div>
                        <div className="notif-content">
                            <span className="block"> Due within 7 days: {dueSoonCount} </span>
                            <span className="time">Check scheduled inspections</span>
                        </div>
                    </a>
                    <a href="#">
                        <div className="notif-icon notif-danger">
                            <i className="fa fa-exclamation-triangle"></i>
                        </div>
                        <div className="notif-content">
                            <span className="block">
                              Overdue inspections: {overdueCount}
                            </span>
                            <span className="time">Action required</span>
                        </div>
                    </a>
                </div>
            </div>
      
    </div>
  )
}
