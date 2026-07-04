import { useEffect, useState } from "react";
import axios from "axios";
import BaseUrl from "../utils/api_provider/ApiProviders";

interface User {
  userId: string;
  fullName: string;
  email: string;
  role: string;
}

interface Notification {
  notify_id: string;
  sender_id: string;
  receiver_id: string;
  title: string;
  content: string;
  notify_type: string;
  reference_id: string;
  is_read: boolean;
  createdAt: string;
  sender: User;
  receiver: User;
}

export default function Notifications() {
  const [notifications, setNotifications] = useState<Notification[]>([]);
  const [loading, setLoading] = useState(true);

  const fetchNotification = async () => {
    try {
      setLoading(true);

      const response = await axios.get(`${BaseUrl}/notifications`);

      const data = Array.isArray(response.data)
        ? response.data
        : [];

      setNotifications(data);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchNotification();
  }, []);

  const unreadCount = notifications.filter(
    (item) => !item.is_read
  ).length;

  const formatDate = (date: string) => {
    return new Date(date).toLocaleString();
  };

  return (
    <div
      style={{
        padding: 25,
        background: "#f4f6f9",
        minHeight: "100vh",
      }}
    >
      {/* HEADER */}

      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          marginBottom: 25,
        }}
      >
        <h2
          style={{
            margin: 0,
            color: "#0000BA",
          }}
        >
          Notifications
        </h2>

        <div
          style={{
            background: "#0000BA",
            color: "white",
            borderRadius: 30,
            padding: "8px 18px",
            fontWeight: 600,
          }}
        >
          Unread : {unreadCount}
        </div>
      </div>

      {loading && (
        <div
          style={{
            textAlign: "center",
            marginTop: 60,
          }}
        >
          Loading notifications...
        </div>
      )}

      {!loading && notifications.length === 0 && (
        <div
          style={{
            background: "white",
            borderRadius: 12,
            padding: 40,
            textAlign: "center",
          }}
        >
          No notifications found.
        </div>
      )}

      {!loading &&
        notifications.map((item) => (
          <div
            key={item.notify_id}
            style={{
              background: "white",
              borderRadius: 15,
              padding: 18,
              marginBottom: 18,
              boxShadow:
                "0 3px 10px rgba(0,0,0,.08)",
              borderLeft: item.is_read
                ? "5px solid #4CAF50"
                : "5px solid #F44336",
            }}
          >
            <div
              style={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
              }}
            >
              <div>
                <h3
                  style={{
                    margin: 0,
                    color: "#0000BA",
                  }}
                >
                  {item.title}
                </h3>

                <div
                  style={{
                    color: "#666",
                    marginTop: 4,
                  }}
                >
                  {item.notify_type}
                </div>
              </div>

              <div
                style={{
                  background: item.is_read
                    ? "#E8F5E9"
                    : "#FFEBEE",
                  color: item.is_read
                    ? "#2E7D32"
                    : "#C62828",
                  padding: "6px 14px",
                  borderRadius: 30,
                  fontSize: 12,
                  fontWeight: 600,
                }}
              >
                {item.is_read ? "Read" : "Unread"}
              </div>
            </div>

            <hr
              style={{
                margin: "16px 0",
                border: "none",
                borderTop: "1px solid #eee",
              }}
            />

            <p
              style={{
                margin: 0,
                lineHeight: 1.7,
              }}
            >
              {item.content}
            </p>

            <div
              style={{
                marginTop: 20,
                display: "grid",
                gridTemplateColumns: "repeat(auto-fit,minmax(220px,1fr))",
                gap: 10,
              }}
            >
              <div>
                <strong>Sender</strong>

                <br />

                {item.sender.fullName}

                <br />

                <small>{item.sender.role}</small>
              </div>

              <div>
                <strong>Receiver</strong>

                <br />

                {item.receiver.fullName}

                <br />

                <small>{item.receiver.role}</small>
              </div>

              <div>
                <strong>Reference</strong>

                <br />

                {item.reference_id}
              </div>

              <div>
                <strong>Date</strong>

                <br />

                {formatDate(item.createdAt)}
              </div>
            </div>
          </div>
        ))}
    </div>
  );
}