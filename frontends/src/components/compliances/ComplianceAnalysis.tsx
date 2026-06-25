import React, { useEffect, useState, useMemo } from "react";
import axios from "axios";
import {
  Chart as ChartJS,
  ArcElement,
  Tooltip,
  Legend,
  CategoryScale,
  LinearScale,
  BarElement,
} from "chart.js";

import { Pie, Doughnut, Bar } from "react-chartjs-2";

ChartJS.register(
  ArcElement,
  Tooltip,
  Legend,
  CategoryScale,
  LinearScale,
  BarElement
);

export default function ComplianceAnalysis() {
  const [compliances, setCompliances] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const res = await axios.get("http://localhost:51213/compliance/get");
      setCompliances(res.data || []);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  // STATUS COUNT
  const statusCount = useMemo(() => {
    const compliant = compliances.filter((c) => c.status === "COMPLIANT").length;
    const dueSoon = compliances.filter((c) => c.status === "DUE_SOON").length;
    const overdue = compliances.filter((c) => c.status === "OVERDUE").length;

    return { compliant, dueSoon, overdue };
  }, [compliances]);

  const pieData = {
    labels: ["Compliant", "Due Soon", "Overdue"],
    datasets: [
      {
        data: [
          statusCount.compliant,
          statusCount.dueSoon,
          statusCount.overdue,
        ],
        backgroundColor: ["#1e88e5", "#ffb300", "#e53935"],
        borderWidth: 1,
      },
    ],
  };

  const barData = {
    labels: ["Compliant", "Due Soon", "Overdue"],
    datasets: [
      {
        label: "Compliance Status",
        data: [
          statusCount.compliant,
          statusCount.dueSoon,
          statusCount.overdue,
        ],
        backgroundColor: ["#1565c0", "#ffb300", "#d32f2f"],
      },
    ],
  };

  return (
    <div style={styles.page}>
      <h2 style={styles.title}>📊 Compliance Status Analysis</h2>

      {loading ? (
        <p style={{ color: "#fff" }}>Loading...</p>
      ) : (
        <>
          {/* CARDS */}
          <div style={styles.cardRow}>
            <div style={styles.cardBlue}>
              <h3>Compliant</h3>
              <h1>{statusCount.compliant}</h1>
            </div>

            <div style={styles.cardOrange}>
              <h3>Due Soon</h3>
              <h1>{statusCount.dueSoon}</h1>
            </div>

            <div style={styles.cardRed}>
              <h3>Overdue</h3>
              <h1>{statusCount.overdue}</h1>
            </div>
          </div>

          {/* CHARTS */}
          <div style={styles.chartRow}>
            <div style={styles.chartBox}>
              <h4>Compliance Distribution</h4>
              <Pie data={pieData} />
            </div>

            <div style={styles.chartBox}>
              <h4>Status Overview</h4>
              <Bar data={barData} />
            </div>

            <div style={styles.chartBox}>
              <h4>Breakdown</h4>
              <Doughnut data={pieData} />
            </div>
          </div>
        </>
      )}
    </div>
  );
}

const styles: any = {
  page: {
    background: "linear-gradient(135deg,#0d47a1,#1565c0)",
    minHeight: "100vh",
    padding: "20px",
    color: "#fff",
  },
  title: {
    textAlign: "center",
    marginBottom: "20px",
    fontWeight: "bold",
  },
  cardRow: {
    display: "flex",
    gap: "15px",
    justifyContent: "center",
    marginBottom: "25px",
  },
  cardBlue: {
    background: "#1e88e5",
    padding: "20px",
    borderRadius: "12px",
    width: "180px",
    textAlign: "center",
  },
  cardOrange: {
    background: "#ffb300",
    padding: "20px",
    borderRadius: "12px",
    width: "180px",
    textAlign: "center",
    color: "#000",
  },
  cardRed: {
    background: "#e53935",
    padding: "20px",
    borderRadius: "12px",
    width: "180px",
    textAlign: "center",
  },
  chartRow: {
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit,minmax(300px,1fr))",
    gap: "20px",
  },
  chartBox: {
    background: "#ffffff10",
    padding: "15px",
    borderRadius: "12px",
  },
};