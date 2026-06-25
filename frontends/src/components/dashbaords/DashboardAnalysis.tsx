import React, { useEffect, useMemo, useState } from "react";
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

// High-visibility chart layout config
const chartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      position: "bottom" as const,
      labels: {
        boxWidth: 14,
        padding: 15,
        font: { size: 12, weight: "bold" as const },
        color: "#f8fafc",
      },
    },
    tooltip: {
      padding: 12,
      bodyFont: { size: 14 },
      titleFont: { size: 14, weight: "bold" as const },
    },
  },
  scales: {
    x: {
      grid: { display: false },
      ticks: { color: "#94a3b8", font: { size: 11 } },
    },
    y: {
      grid: { color: "rgba(255, 255, 255, 0.05)" },
      ticks: { color: "#94a3b8", font: { size: 11 } },
    },
  },
};

export default function DashboardAnalysis() {
  const [compliances, setCompliances] = useState<any[]>([]);
  const [incidents, setIncidents] = useState<any[]>([]);
  const [hazards, setHazards] = useState<any[]>([]);
  const [risks, setRisks] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, []);

  const loadData = async () => {
    try {
      const [cRes, iRes, hRes, rRes] = await Promise.all([
        axios.get("http://localhost:51213/compliance/get"),
        axios.get("http://localhost:51213/incidents/get"),
        axios.get("http://localhost:51213/hazards/get"),
        axios.get("http://localhost:51213/risks/get"),
      ]);

      setCompliances(cRes.data || []);
      setIncidents(iRes.data || []);
      setHazards(hRes.data || []);
      setRisks(rRes.data || []);
    } catch (err) {
      console.log(err);
    } finally {
      setLoading(false);
    }
  };

  // =======================
  // METRICS & DATA STATS
  // =======================
  const complianceStats = useMemo(() => {
    return {
      compliant: compliances.filter((c) => c.status === "COMPLIANT").length,
      dueSoon: compliances.filter((c) => c.status === "DUE_SOON").length,
      overdue: compliances.filter((c) => c.status === "OVERDUE").length,
    };
  }, [compliances]);

  const incidentStats = useMemo(() => {
    return {
      low: incidents.filter((i) => i.riskLevel === "LOW").length,
      medium: incidents.filter((i) => i.riskLevel === "MEDIUM").length,
      high: incidents.filter((i) => i.riskLevel === "HIGH").length,
      critical: incidents.filter((i) => i.riskLevel === "CRITICAL").length,
    };
  }, [incidents]);

  // Premium, high-contrast palette datasets
  const compliancePie = {
    labels: ["Compliant", "Due Soon", "Overdue"],
    datasets: [
      {
        data: [
          complianceStats.compliant,
          complianceStats.dueSoon,
          complianceStats.overdue,
        ],
        backgroundColor: ["#00e676", "#ffb300", "#ff1744"],
        borderWidth: 0,
      },
    ],
  };

  const incidentPie = {
    labels: ["Low Risk", "Medium Risk", "High Risk", "Critical Risk"],
    datasets: [
      {
        data: [
          incidentStats.low,
          incidentStats.medium,
          incidentStats.high,
          incidentStats.critical,
        ],
        backgroundColor: ["#00e5ff", "#ffb300", "#ff9100", "#ff1744"],
        borderWidth: 0,
      },
    ],
  };

  const incidentBar = {
    labels: ["Low", "Medium", "High", "Critical"],
    datasets: [
      {
        label: "Incidents Logged",
        data: [
          incidentStats.low,
          incidentStats.medium,
          incidentStats.high,
          incidentStats.critical,
        ],
        backgroundColor: ["#00e5ff", "#ffb300", "#ff9100", "#ff1744"],
        borderRadius: 6,
      },
    ],
  };

  return (
    <div style={styles.page}>
      <header style={styles.header}>
        <h1 style={styles.title}>📊 HSE Facility Operations & Analytics</h1>
        <p style={styles.subtitle}>Real-time compliance monitoring, incident control, hazards, and risk tracking matrix</p>
      </header>

      {loading ? (
        <div style={styles.loaderContainer}>
          <div style={styles.loader}>Loading Comprehensive Safety Matrix...</div>
        </div>
      ) : (
        <>
          {/* EXPANSIVE METRIC KPI GRID */}
          <div style={styles.kpiRow}>
            <div style={{ ...styles.card, borderLeft: "5px solid #00e676" }}>
              <span style={styles.cardLabel}>COMPLIANT ITEMS</span>
              <h2 style={{ ...styles.cardValue, color: "#00e676" }}>{complianceStats.compliant}</h2>
            </div>

            <div style={{ ...styles.card, borderLeft: "5px solid #ff1744" }}>
              <span style={styles.cardLabel}>CRITICAL OVERDUE</span>
              <h2 style={{ ...styles.cardValue, color: "#ff1744" }}>{complianceStats.overdue}</h2>
            </div>

            <div style={{ ...styles.card, borderLeft: "5px solid #ff9100" }}>
              <span style={styles.cardLabel}>ACTIVE HAZARDS</span>
              <h2 style={{ ...styles.cardValue, color: "#ff9100" }}>{hazards.length}</h2>
            </div>

            <div style={{ ...styles.card, borderLeft: "5px solid #e040fb" }}>
              <span style={styles.cardLabel}>MANAGED RISKS</span>
              <h2 style={{ ...styles.cardValue, color: "#e040fb" }}>{risks.length}</h2>
            </div>

            <div style={{ ...styles.card, borderLeft: "5px solid #d500f9" }}>
              <span style={styles.cardLabel}>CRITICAL INCIDENTS</span>
              <h2 style={{ ...styles.cardValue, color: "#d500f9" }}>{incidentStats.critical}</h2>
            </div>
          </div>

          {/* LARGE DASHBOARD VISUAL GRID */}
          <div style={styles.grid}>
            <div style={styles.box}>
              <h3 style={styles.boxTitle}>🛡️ Compliance Health Ratio</h3>
              <div style={styles.chartWrapper}>
                <Pie data={compliancePie} options={chartOptions} />
              </div>
            </div>

            <div style={styles.box}>
              <h3 style={styles.boxTitle}>⚠️ Incident Risk Composition</h3>
              <div style={styles.chartWrapper}>
                <Pie data={incidentPie} options={chartOptions} />
              </div>
            </div>

            <div style={styles.box}>
              <h3 style={styles.boxTitle}>🔥 Incident Level Profiles</h3>
              <div style={styles.chartWrapper}>
                <Bar data={incidentBar} options={chartOptions} />
              </div>
            </div>

            <div style={styles.box}>
              <h3 style={styles.boxTitle}>📈 HSE Operations Activity Mix</h3>
              <div style={styles.chartWrapper}>
                <Line
                  options={chartOptions}
                  data={{
                    labels: ["Compliances", "Incidents", "Hazards", "Risks"],
                    datasets: [
                      {
                        label: "Database Records Volume",
                        data: [
                          compliances.length,
                          incidents.length,
                          hazards.length,
                          risks.length,
                        ],
                        borderColor: "#00e5ff",
                        backgroundColor: "rgba(0, 229, 255, 0.1)",
                        pointBackgroundColor: "#fff",
                        pointRadius: 6,
                        fill: true,
                        tension: 0.3,
                      },
                    ],
                  }}
                />
              </div>
            </div>
          </div>
        </>
      )}
    </div>
  );
}

// ===============================
// LARGE HIGH-VISIBILITY STYLES
// ===============================
const styles: any = {
  page: {
    minHeight: "100vh",
    padding: "32px 40px",
    background: "#0b0f19", // Deep midnight tone makes elements pop neon bright
    color: "#f8fafc",
    fontFamily: "'Inter', system-ui, -apple-system, sans-serif",
  },

  header: {
    marginBottom: "32px",
  },

  title: {
    fontSize: "28px",
    fontWeight: "800",
    letterSpacing: "-0.5px",
    margin: "0 0 6px 0",
  },

  subtitle: {
    color: "#64748b",
    fontSize: "14px",
    margin: 0,
  },

  kpiRow: {
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit, minmax(200px, 1fr))",
    gap: "20px",
    marginBottom: "32px",
  },

  card: {
    background: "#111827",
    padding: "24px",
    borderRadius: "12px",
    boxShadow: "0 10px 15px -3px rgba(0, 0, 0, 0.3)",
    display: "flex",
    flexDirection: "column",
    justifyContent: "center",
  },

  cardLabel: {
    fontSize: "12px",
    fontWeight: "700",
    color: "#64748b",
    letterSpacing: "1px",
  },

  cardValue: {
    fontSize: "36px",
    fontWeight: "800",
    margin: "8px 0 0 0",
    lineHeight: 1,
  },

  grid: {
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit, minmax(450px, 1fr))",
    gap: "24px",
  },

  box: {
    background: "#111827",
    border: "1px solid rgba(255, 255, 255, 0.03)",
    padding: "24px",
    borderRadius: "16px",
    boxShadow: "0 20px 25px -5px rgba(0, 0, 0, 0.4)",
  },

  boxTitle: {
    margin: "0 0 20px 0",
    fontSize: "16px",
    fontWeight: "700",
    color: "#f1f5f9",
  },

  chartWrapper: {
    position: "relative",
    height: "280px", // Large layout height
    width: "100%",
  },

  loaderContainer: {
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    height: "50vh",
  },

  loader: {
    fontSize: "16px",
    color: "#64748b",
  },
};
