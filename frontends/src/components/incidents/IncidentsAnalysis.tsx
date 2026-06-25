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
  PointElement,
  LineElement,
} from "chart.js";

import { Pie, Bar, Line } from "react-chartjs-2";

ChartJS.register(
  ArcElement,
  Tooltip,
  Legend,
  CategoryScale,
  LinearScale,
  BarElement,
  PointElement,
  LineElement
);

export default function IncidentsAnalysis() {
  const [incidents, setIncidents] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    try {
      const res = await axios.get("http://localhost:51213/incidents/get");
      setIncidents(res.data || []);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  // RISK LEVEL COUNT
  const riskData = useMemo(() => {
    const low = incidents.filter((i) => i.riskLevel === "LOW").length;
    const medium = incidents.filter((i) => i.riskLevel === "MEDIUM").length;
    const high = incidents.filter((i) => i.riskLevel === "HIGH").length;
    const critical = incidents.filter((i) => i.riskLevel === "CRITICAL").length;

    return { low, medium, high, critical };
  }, [incidents]);

  // MONTHLY TREND (simple grouping)
  const monthlyData = useMemo(() => {
    const months: any = {};

    incidents.forEach((i) => {
      const month = new Date(i.createdAt).toLocaleString("default", {
        month: "short",
      });

      months[month] = (months[month] || 0) + 1;
    });

    return months;
  }, [incidents]);

  const pieData = {
    labels: ["Low", "Medium", "High", "Critical"],
    datasets: [
      {
        data: [
          riskData.low,
          riskData.medium,
          riskData.high,
          riskData.critical,
        ],
        backgroundColor: ["#4caf50", "#ffb300", "#ff5722", "#d32f2f"],
      },
    ],
  };

  const barData = {
    labels: ["Low", "Medium", "High", "Critical"],
    datasets: [
      {
        label: "Incident Risk Levels",
        data: [
          riskData.low,
          riskData.medium,
          riskData.high,
          riskData.critical,
        ],
        backgroundColor: "#1e88e5",
      },
    ],
  };

  const lineData = {
    labels: Object.keys(monthlyData),
    datasets: [
      {
        label: "Incidents Trend",
        data: Object.values(monthlyData),
        borderColor: "#00e5ff",
        backgroundColor: "#00e5ff",
      },
    ],
  };

  return (
    <div style={styles.page}>
      <h2 style={styles.title}>🚨 Incident Analysis Dashboard</h2>

      {loading ? (
        <p style={{ color: "#fff" }}>Loading...</p>
      ) : (
        <>
          {/* CARDS */}
          <div style={styles.cardRow}>
            <div style={styles.cardGreen}>
              <h3>Low</h3>
              <h1>{riskData.low}</h1>
            </div>

            <div style={styles.cardOrange}>
              <h3>Medium</h3>
              <h1>{riskData.medium}</h1>
            </div>

            <div style={styles.cardRed}>
              <h3>High</h3>
              <h1>{riskData.high}</h1>
            </div>

            <div style={styles.cardDarkRed}>
              <h3>Critical</h3>
              <h1>{riskData.critical}</h1>
            </div>
          </div>

          {/* CHARTS */}
          <div style={styles.chartRow}>
            <div style={styles.chartBox}>
              <h4>Risk Distribution</h4>
              <Pie data={pieData} />
            </div>

            <div style={styles.chartBox}>
              <h4>Risk Overview</h4>
              <Bar data={barData} />
            </div>

            <div style={styles.chartBox}>
              <h4>Incident Trend</h4>
              <Line data={lineData} />
            </div>
          </div>
        </>
      )}
    </div>
  );
}

const styles: any = {
  page: {
    background: "linear-gradient(135deg,#0b1c3c,#1a237e)",
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
    flexWrap: "wrap",
  },
  cardGreen: {
    background: "#4caf50",
    padding: "20px",
    borderRadius: "12px",
    width: "150px",
    textAlign: "center",
  },
  cardOrange: {
    background: "#ffb300",
    padding: "20px",
    borderRadius: "12px",
    width: "150px",
    textAlign: "center",
    color: "#000",
  },
  cardRed: {
    background: "#ff5722",
    padding: "20px",
    borderRadius: "12px",
    width: "150px",
    textAlign: "center",
  },
  cardDarkRed: {
    background: "#d32f2f",
    padding: "20px",
    borderRadius: "12px",
    width: "150px",
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