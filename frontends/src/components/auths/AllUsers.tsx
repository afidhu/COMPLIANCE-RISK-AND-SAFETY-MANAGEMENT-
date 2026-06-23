import React, { useEffect, useMemo, useState } from "react";
import axios from "axios";

export default function AllUsers() {
  const [inspectors, setInspectors] = useState([]);
  const [technicians, setTechnicians] = useState([]);
  const [staffMembers, setStaffMembers] = useState([]);
  const [safetyOfficers, setSafetyOfficers] = useState([]);

  const [loading, setLoading] = useState(false);
  const [search, setSearch] = useState("");
  const [processingUser, setProcessingUser] = useState(null);

  const API_BASE = "http://localhost:51213";

  const loadUsers = async () => {
    try {
      setLoading(true);

      const [
        inspectorsRes,
        techniciansRes,
        staffMembersRes,
        safetyOfficersRes,
      ] = await Promise.all([
        axios.get(`${API_BASE}/auth/users/role/INSPECTOR`),
        axios.get(`${API_BASE}/auth/users/role/TECHNICIAN`),
        axios.get(`${API_BASE}/auth/users/role/STAFF_MEMBER`),
        axios.get(`${API_BASE}/auth/users/role/SAFETY_OFFICER`),
      ]);

      setInspectors(inspectorsRes.data || []);
      setTechnicians(techniciansRes.data || []);
      setStaffMembers(staffMembersRes.data || []);
      setSafetyOfficers(safetyOfficersRes.data || []);
    } catch (error) {
      console.error(error);
      alert("Failed to load users");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadUsers();
  }, []);

  const allUsers = useMemo(() => {
    return [
      ...inspectors,
      ...technicians,
      ...staffMembers,
      ...safetyOfficers,
    ];
  }, [inspectors, technicians, staffMembers, safetyOfficers]);

  const totalUsers = allUsers.length;

  const activeUsers = allUsers.filter(
    (u) => u.status === "ACTIVE"
  ).length;

  const inactiveUsers = allUsers.filter(
    (u) => u.status === "INACTIVE"
  ).length;

  const pendingUsers = allUsers.filter(
    (u) =>
      u.isApproved ===false

  ).length;

  const filterUsers = (users) => {
    return users.filter((user) => {
      const keyword = search.toLowerCase();

      return (
        user.fullName?.toLowerCase().includes(keyword) ||
        user.email?.toLowerCase().includes(keyword) ||
        user.phone?.toLowerCase().includes(keyword)
      );
    });
  };

  const getStatusBadge = (status) => {
    switch (status) {
      case "ACTIVE":
        return "badge bg-success";
      case "INACTIVE":
        return "badge bg-danger";
      case "PENDING":
        return "badge bg-warning text-dark";
      case "UNAPPROVED":
        return "badge bg-warning text-dark";
      default:
        return "badge bg-secondary";
    }
  };

  const approveUser = async (userId) => {
    try {
      setProcessingUser(userId);

      // UPDATE WITH YOUR API
      await axios.patch(
        `${API_BASE}/auth/users/approve/${userId}`
      );

      await loadUsers();

      alert("User approved successfully");
    } catch (error) {
      console.error(error);
      alert("Failed to approve user");
    } finally {
      setProcessingUser(null);
    }
  };

  const activateUser = async (userId) => {
    try {
      setProcessingUser(userId);

      // UPDATE WITH YOUR API
      await axios.put(
        `${API_BASE}/auth/users/activate/${userId}`
      );

      await loadUsers();

      alert("User activated successfully");
    } catch (error) {
      console.error(error);
      alert("Failed to activate user");
    } finally {
      setProcessingUser(null);
    }
  };

  const activateDeactivateUser = async (userId) => {
    try {
      setProcessingUser(userId);
// http://localhost:51213/auth/users/activateUser-deactivate/
      // UPDATE WITH YOUR API
      await axios.patch(
        `${API_BASE}/auth/users/activateUser-deactivate/${userId}`
      );

      await loadUsers();

      alert("User deactivated successfully");
    } catch (error) {
      console.error(error);
      alert("Failed to deactivate user");
    } finally {
      setProcessingUser(null);
    }
  };

  const UserTable = ({ title, users, color }) => (
    <div className="card shadow border-0 mb-4">
      <div className={`card-header bg-${color} text-white`}>
        <div className="d-flex justify-content-between align-items-center">
          <h5 className="mb-0 fw-bold">{title}</h5>

          <span className="badge bg-light text-dark">
            {users.length} Users
          </span>
        </div>
      </div>

      <div className="card-body">
        <div className="table-responsive">
          <table className="table table-hover align-middle">
            <thead>
              <tr>
                <th>#</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Status</th>
                <th>Player ID</th>
                <th>Created</th>
                <th width="240">Actions</th>
              </tr>
            </thead>

            <tbody>
              {users.length === 0 ? (
                <tr>
                  <td colSpan="9" className="text-center py-4">
                    No users found
                  </td>
                </tr>
              ) : (
                users.map((user, index) => (
                  <tr key={user.userId}>
                    <td>{index + 1}</td>

                    <td>
                      <div>
                        <div className="fw-bold">
                          {user.fullName}
                        </div>

                        <small className="text-muted">
                          {user.userId.substring(0, 12)}...
                        </small>
                      </div>
                    </td>

                    <td>{user.email}</td>

                    <td>{user.phone}</td>

                    <td>
                      <span className="badge bg-info">
                        {user.role}
                      </span>
                    </td>

                    <td>
                      <span
                        className={getStatusBadge(
                          user.status
                        )}
                      >
                        {user.status}
                      </span>
                    </td>

                    <td>
                      {user.playerId ? (
                        <span className="badge bg-success">
                          Connected
                        </span>
                      ) : (
                        <span className="badge bg-secondary">
                          Offline
                        </span>
                      )}
                    </td>

                    <td>
                      {new Date(
                        user.createdAt
                      ).toLocaleDateString()}
                    </td>

                    <td>
                      <div className="d-flex gap-1 flex-wrap">

                         {
                            user.isApproved ? 
                            <button
                          className="btn btn-success btn-sm"
                          disabled={
                            processingUser === user.userId
                          }
                          onClick={() =>
                            approveUser(user.userId)
                          }
                        >
                        Approved
                        </button>
                            :
                            <button
                          className="btn-sm btn btn-warning"
                          disabled={
                            processingUser === user.userId
                          }
                          onClick={() =>
                            approveUser(user.userId)
                          }
                        >
                        Pending
                        </button>
                         }
                        

                        {
                            user.status ==="ACTIVE"? 
                             <button
                          className="btn btn-danger btn-sm"
                          disabled={
                            processingUser === user.userId
                          }
                          onClick={() =>
                            activateDeactivateUser(user.userId)
                          }
                        >
                          Deactivate
                        </button>
                            :<button
                          className="btn btn-primary btn-sm"
                          disabled={
                            processingUser === user.userId
                          }
                          onClick={() =>
                            activateDeactivateUser(user.userId)
                          }
                        >
                          Activate
                        </button>

                        }

                        
                       

                      </div>
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );

  return (
    <div className="container-fluid">
      <div className="page-inner">

        {/* PAGE HEADER */}
        <div className="page-header mb-4">
          <h3 className="fw-bold mb-2">
            User Management Dashboard
          </h3> 

          <p className="text-muted mb-0">
            Manage Inspectors, Technicians, Staff
            Members and Safety Officers
          </p>
        </div>

        {/* SUMMARY CARDS */}
        <div className="row mb-4">

          <div className="col-md-3">
            <div className="card shadow border-0 bg-primary text-white">
              <div className="card-body">
                <h6>Total Users</h6>
                <h2 className="fw-bold">{totalUsers}</h2>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card shadow border-0 bg-success text-white">
              <div className="card-body">
                <h6>Active Users</h6>
                <h2 className="fw-bold">{activeUsers}</h2>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card shadow border-0 bg-danger text-white">
              <div className="card-body">
                <h6>Inactive Users</h6>
                <h2 className="fw-bold">{inactiveUsers}</h2>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card shadow border-0 bg-warning">
              <div className="card-body">
                <h6>Pending Approval</h6>
                <h2 className="fw-bold">{pendingUsers}</h2>
              </div>
            </div>
          </div>

        </div>

        {/* SEARCH */}
        <div className="card shadow border-0 mb-4">
          <div className="card-body">
            <div className="row align-items-center">

              <div className="col-md-8">
                <input
                  type="text"
                  className="form-control form-control-lg"
                  placeholder="Search by name, email or phone..."
                  value={search}
                  onChange={(e) =>
                    setSearch(e.target.value)
                  }
                />
              </div>

              <div className="col-md-4 text-end">
                <button
                  className="btn btn-primary"
                  onClick={loadUsers}
                >
                  <i className="fa fa-refresh me-2"></i>
                  Refresh
                </button>
              </div>

            </div>
          </div>
        </div>

        {loading ? (
          <div className="card shadow border-0">
            <div className="card-body text-center py-5">
              <div
                className="spinner-border text-primary"
                role="status"
              ></div>

              <p className="mt-3">
                Loading users...
              </p>
            </div>
          </div>
        ) : (
          <>
            <UserTable
              title="Inspectors"
              users={filterUsers(inspectors)}
              color="primary"
            />

            <UserTable
              title="Technicians"
              users={filterUsers(technicians)}
              color="success"
            />

            <UserTable
              title="Staff Members"
              users={filterUsers(staffMembers)}
              color="warning"
            />

            <UserTable
              title="Safety Officers"
              users={filterUsers(safetyOfficers)}
              color="danger"
            />
          </>
        )}
      </div>
    </div>
  );
}