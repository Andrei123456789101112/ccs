import React from "react";
import { useLocation } from "react-router-dom";

const Sidebar = ({ collapsed }) => {
  const sidebarWidth = collapsed ? 80 : 250;
  const location = useLocation();
  const { pathname } = location;

  // Get role from sessionStorage
  const role = sessionStorage.getItem("role");

  // Grouped nav items by category
  const navGroups = [
    {
      category: "Overview",
      items: [
        { label: "Dashboard", icon: "bi-house-door", path: "/dashboard" },
        { label: "Calendar", icon: "bi-calendar2-week", path: "/calendar" },
      ],
    },
    {
      category: "Academic Management",
      items: [
        { label: "Classes", icon: "bi-journal", path: "/classes" },
        { label: "Subjects", icon: "bi-book", path: "/subjects" },
      ],
    },
    {
      category: "Facility Management",
      items: [
        { label: "Rooms", icon: "bi-door-open", path: "/rooms" },
      ],
    },
    {
      category: "Administration",
      items: [
        { label: "Users", icon: "bi-people", path: "/usersmanagement" },
      ],
    },
  ];

  const filteredNavGroups =
    role === "Admin"
      ? [
            {
      category: "Overview",
      items: [
        { label: "Dashboard", icon: "bi-house-door", path: "/dashboard" },
        { label: "Calendar", icon: "bi-calendar2-week", path: "/calendar" },
      ],
    },
        ]
      : navGroups;

  return (
    <div
      className="d-none d-md-flex flex-column p-3 border-end"
      style={{
        backgroundColor: "#1F378D",
        color: "white",
        width: sidebarWidth,
        minHeight: "100vh",
        transition: "width 0.3s",
        position: "fixed",
        top: 0,
        left: 0,
        zIndex: 1000,
        overflowX: "hidden",
      }}
    >
      <a
        href="/"
        className="d-flex align-items-center mb-3 mb-md-0 text-decoration-none text-white"
      >
        <img
          src="logo.png"
          alt="dashboard-logo"
          className="rounded-circle me-2"
          style={{ width: 40, height: 40 }}
        />
        {!collapsed && <span className="fs-4">SMSIII PORTAL</span>}
      </a>
      <hr className="text-white" />
      {filteredNavGroups.map((group) => (
        <div key={group.category} className="mb-3">
          {!collapsed && (
            <div className="fw-bold text-uppercase mb-2" style={{ fontSize: "0.85rem", opacity: 0.7 }}>
              {group.category}
            </div>
          )}
          <ul className="nav nav-pills flex-column mb-auto">
            {group.items.map((item) => (
              <li className="nav-item" key={item.path}>
                <a
                  href={item.path}
                  className={`nav-link text-white${pathname === item.path ? " active" : ""}`}
                >
                  <i className={`bi ${item.icon} me-2`}></i>
                  {!collapsed && item.label}
                </a>
              </li>
            ))}
          </ul>
        </div>
      ))}
    </div>
  );
};

export default Sidebar;
