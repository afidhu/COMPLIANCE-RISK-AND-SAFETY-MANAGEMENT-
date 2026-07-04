import { useEffect, useState } from "react";
import {
  FaMoon,
  FaSun,
  FaDesktop,
  FaBell,
  FaLanguage,
  FaPalette,
  FaShieldAlt,
  FaDownload,
  FaInfoCircle,
  FaSignOutAlt,
  FaCheckCircle,
} from "react-icons/fa";

import "./AppSetting.css";

export default function AppSetting() {
  const [theme, setTheme] = useState(
    localStorage.getItem("theme") || "system"
  );

  const [notification, setNotification] = useState(true);
  const [sound, setSound] = useState(true);
  const [autoRefresh, setAutoRefresh] = useState("30");

  useEffect(() => {
    const root = document.documentElement;

    if (theme === "dark") {
      root.setAttribute("data-theme", "dark");
    } else if (theme === "light") {
      root.setAttribute("data-theme", "light");
    } else {
      const dark = window.matchMedia(
        "(prefers-color-scheme: dark)"
      ).matches;

      root.setAttribute(
        "data-theme",
        dark ? "dark" : "light"
      );
    }

    localStorage.setItem("theme", theme);
  }, [theme]);

  return (
    <div className="settings-page">

      <div className="header">
        <h2>Application Settings</h2>
        <p>Customize your experience</p>
      </div>

      {/* Theme */}

      <div className="card">

        <h3>
          <FaPalette /> Appearance
        </h3>

        <div className="theme-buttons">

          <button
            className={theme === "light" ? "active" : ""}
            onClick={() => setTheme("light")}
          >
            <FaSun />
            Light
          </button>

          <button
            className={theme === "dark" ? "active" : ""}
            onClick={() => setTheme("dark")}
          >
            <FaMoon />
            Dark
          </button>

          <button
            className={theme === "system" ? "active" : ""}
            onClick={() => setTheme("system")}
          >
            <FaDesktop />
            System
          </button>

        </div>
      </div>

      {/* Notification */}

      <div className="card">

        <h3>
          <FaBell /> Notifications
        </h3>

        <label className="setting-row">
          Enable Notifications

          <input
            type="checkbox"
            checked={notification}
            onChange={() =>
              setNotification(!notification)
            }
          />
        </label>

        <label className="setting-row">
          Notification Sound

          <input
            type="checkbox"
            checked={sound}
            onChange={() => setSound(!sound)}
          />
        </label>

      </div>

      {/* Refresh */}

      <div className="card">

        <h3>
          <FaCheckCircle /> Auto Refresh
        </h3>

        <select
          value={autoRefresh}
          onChange={(e) =>
            setAutoRefresh(e.target.value)
          }
        >
          <option value="15">15 Seconds</option>
          <option value="30">30 Seconds</option>
          <option value="60">1 Minute</option>
          <option value="120">2 Minutes</option>
        </select>

      </div>

      {/* Language */}

      <div className="card">

        <h3>
          <FaLanguage /> Language
        </h3>

        <select>
          <option>English</option>
          <option>Swahili</option>
        </select>

      </div>

      {/* Security */}

      <div className="card">

        <h3>
          <FaShieldAlt /> Security
        </h3>

        <button>Change Password</button>

      </div>

      {/* Export */}

      <div className="card">

        <h3>
          <FaDownload /> Data
        </h3>

        <button>Export Settings</button>

      </div>

      {/* Information */}

      <div className="card">

        <h3>
          <FaInfoCircle /> About
        </h3>

        <p>Facility Compliance Management System</p>

        <p>Version 1.0.0</p>

      </div>

      {/* Logout */}

      <div className="card">

        <button className="logout">
          <FaSignOutAlt />
          Logout
        </button>

      </div>

    </div>
  );
}