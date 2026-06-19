


import { useEffect, useMemo, useState } from "react";
import axios from "axios";
import { dateFormater } from "../utils/DateFormater";

interface Compliance {
    compliance_id: number;
    asset_id: number;
    compliance_name: string;
    frequency: string;
    last_due_date: string;
    due_date: string;
    status: "Compliant" | "Due Soon" | "Overdue";
}

export default function Compliance() {
    const [compliances, setCompliances] = useState<Compliance[]>([]);
    const [loading, setLoading] = useState(true);
    const [search, setSearch] = useState("");

    useEffect(() => {
        getCompliance();
    }, []);

    const getCompliance = async () => {
        try {
            const response = await axios.get(
                "http://localhost:51213/compliance/get/"
            );

            setCompliances(response.data);
        } catch (error) {
            console.log(error);
        } finally {
            setLoading(false);
        }
    };

    const filteredData = useMemo(() => {
        return compliances.filter(
            (item) =>
                item.complianceName
                    .toLowerCase()
                    .includes(search.toLowerCase()) ||
                item.status.toLowerCase().includes(search.toLowerCase())
        );
    }, [compliances, search]);

    const compliantCount = compliances.filter(
        (x) => x.status === "COMPLIANT"
    ).length;

    const dueSoonCount = compliances.filter(
        (x) => x.status === "DUE_SOON"
    ).length;

    const overdueCount = compliances.filter(
        (x) => x.status === "OVERDUE"
    ).length;

    const getBadge = (status: string) => {
        switch (status) {
            case "COMPLIANT":
                return "bg-success";

            case "DUE_SOON":
                return "bg-warning text-dark";

            case "OVERDUE":
                return "bg-danger";

            default:
                return "bg-secondary";
        }
    };

    return (
        <div
            className="container-fluid py-4"
            style={{
                background: "#f4f7fc",
                minHeight: "100vh",
            }}
        >
            {/* HEADER */}

            <div className="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2
                        className="fw-bold mb-1"
                        style={{ color: "#0b2e59" }}
                    >
                        Compliance Management
                    </h2>

                    <p className="text-muted mb-0">
                        Track compliance schedules and due dates
                    </p>
                </div>

                <button
                    className="btn text-white"
                    style={{
                        background: "#1e66ff",
                        borderRadius: 10,
                    }}
                >
                    + Add Compliance
                </button>
            </div>

            {/* STATS */}

            <div className="row g-4 mb-4">

                <div className="col-md-4">
                    <div className="card border-0 shadow-sm h-100">
                        <div className="card-body">
                            <h6 className="text-muted">
                                Compliant
                            </h6>

                            <h2 className="text-success fw-bold">
                                {compliantCount}
                            </h2>
                        </div>
                    </div>
                </div>

                <div className="col-md-4">
                    <div className="card border-0 shadow-sm h-100">
                        <div className="card-body">
                            <h6 className="text-muted">
                                Due Soon
                            </h6>

                            <h2 className="text-warning fw-bold">
                                {dueSoonCount}
                            </h2>
                        </div>
                    </div>
                </div>

                <div className="col-md-4">
                    <div className="card border-0 shadow-sm h-100">
                        <div className="card-body">
                            <h6 className="text-muted">
                                Overdue
                            </h6>

                            <h2 className="text-danger fw-bold">
                                {overdueCount}
                            </h2>
                        </div>
                    </div>
                </div>

            </div>

            {/* SEARCH */}

            <div className="card border-0 shadow-sm mb-4">
                <div className="card-body">

                    <input
                        type="text"
                        className="form-control"
                        placeholder="Search compliance..."
                        value={search}
                        onChange={(e) =>
                            setSearch(e.target.value)
                        }
                    />

                </div>
            </div>

            {/* TABLE */}

            <div className="card border-0 shadow-sm">

                <div
                    className="card-header text-white fw-bold"
                    style={{
                        background: "#0b2e59",
                    }}
                >
                    Compliance Records
                </div>

                <div className="card-body p-0">

                    {loading ? (
                        <div className="text-center py-5">
                            <div
                                className="spinner-border text-primary"
                                role="status"
                            />
                        </div>
                    ) : (
                        <div className="table-responsive">

                            <table className="table table-hover align-middle mb-0">

                                <thead
                                    style={{
                                        background: "#eaf1ff",
                                    }}
                                >
                                    <tr>
                                        <th>Asset ID</th>
                                        <th>Compliance Name</th>
                                        <th>Frequency</th>
                                        <th>Last Due Date</th>
                                        <th>Due Date</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    {filteredData.length > 0 ? (
                                        filteredData.map((item, index) => {
                                            const formaterlastDueDate =dateFormater(item.lastDueDate)
                                            const formaterdueDate =dateFormater(item.dueDate)
                                            return <>
                                                <tr key={index}>

                                                    <td>
                                                        {item.asset.assetName}
                                                    </td>

                                                    <td>
                                                        <strong>
                                                            {item.complianceName}
                                                        </strong>
                                                    </td>

                                                    <td>
                                                        {item.frequency}
                                                    </td>

                                                    <td>
                                                        {formaterlastDueDate}
                                                    </td>

                                                    <td>
                                                        {formaterdueDate}
                                                    </td>

                                                    <td>

                                                        <span
                                                            className={`badge ${getBadge(
                                                                item.status
                                                            )}`}
                                                        >
                                                            {item.status}
                                                        </span>

                                                    </td>

                                                </tr>
                                            </>
                                        })
                                    ) : (
                                        <tr>

                                            <td
                                                colSpan={6}
                                                className="text-center py-4"
                                            >
                                                No compliance found
                                            </td>

                                        </tr>
                                    )}

                                </tbody>

                            </table>

                        </div>
                    )}

                </div>

            </div>
        </div>
    );
}