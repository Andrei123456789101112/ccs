import React, { useState, useEffect } from "react";
import Sidebar from "../components/Sidebar";
import Navbar from "../components/Navbar";
import Footer from "../components/Footer";
import MobileSidebar from "../components/MobileSidebar";
import DataTable from "react-data-table-component";
import Swal from "sweetalert2";

function RoomsManagement() {
  const user = sessionStorage.getItem("user") || "Guest";
  const [darkMode, setDarkMode] = useState(false);
  const [collapsed, setCollapsed] = useState(false);
  const [mobileSidebarOpen, setMobileSidebarOpen] = useState(false);
  const [filterText, setFilterText] = useState("");
  const [rooms, setRooms] = useState([]);
  const [showAddModal, setShowAddModal] = useState(false);
  const [showEditModal, setShowEditModal] = useState(false);
  const [showDeleteModal, setShowDeleteModal] = useState(false);
  const [editRoomId, setEditRoomId] = useState(null);
  const [deleteRoomId, setDeleteRoomId] = useState(null);

  // Form: room_name, room_type, capacity
  const [formData, setFormData] = useState({
    room_name: "",
    room_type: "",
    capacity: "",
  });

  // Fetch rooms
  useEffect(() => {
    const fetchRooms = async () => {
      try {
        const res = await fetch(process.env.REACT_APP_API_URL + "select", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ table: "rooms" }),
        });
        const data = await res.json();
        setRooms(data.data || []);
      } catch {
        setRooms([]);
      }
    };
    fetchRooms();
  }, []);

  // Add room
  const handleAddRoom = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch(process.env.REACT_APP_API_URL + "insert", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          table: "rooms",
          data: formData,
        }),
      });
      const result = await response.json();
      if (result.success) {
        Swal.fire("Success", "Room added successfully!", "success");
        // Refetch rooms
        const res = await fetch(process.env.REACT_APP_API_URL + "select", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ table: "rooms" }),
        });
        const data = await res.json();
        setRooms(data.data || []);
        closeAddModal();
      } else {
        Swal.fire("Error", result.message || "Failed to add room.", "error");
      }
    } catch {
      Swal.fire("Error", "Failed to add room.", "error");
    }
  };

  // Edit room
  const handleEditRoom = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch(process.env.REACT_APP_API_URL + "update", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          table: "rooms",
          conditions: { id: editRoomId },
          data: formData,
        }),
      });
      const result = await response.json();
      if (result.success) {
        Swal.fire("Success", "Room updated successfully!", "success");
        // Refetch rooms
        const res = await fetch(process.env.REACT_APP_API_URL + "select", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ table: "rooms" }),
        });
        const data = await res.json();
        setRooms(data.data || []);
        closeEditModal();
      } else {
        Swal.fire("Error", result.message || "Failed to update room.", "error");
      }
    } catch {
      Swal.fire("Error", "Failed to update room.", "error");
    }
  };

  // Delete room
  const handleDeleteRoom = async () => {
    try {
      const response = await fetch(process.env.REACT_APP_API_URL + "delete", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          table: "rooms",
          conditions: { id: deleteRoomId },
        }),
      });
      const result = await response.json();
      if (result.success) {
        Swal.fire("Deleted!", "Room deleted successfully.", "success");
        // Refetch rooms
        const res = await fetch(process.env.REACT_APP_API_URL + "select", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ table: "rooms" }),
        });
        const data = await res.json();
        setRooms(data.data || []);
        closeDeleteModal();
      } else {
        Swal.fire("Error", result.message || "Failed to delete room.", "error");
      }
    } catch {
      Swal.fire("Error", "Failed to delete room.", "error");
    }
  };

  // Modal open/close
  const openAddModal = () => {
    setFormData({ room_name: "", room_type: "", capacity: "" });
    setShowAddModal(true);
  };
  const openEditModal = (id) => {
    const room = rooms.find((r) => r.id === id);
    setFormData({
      room_name: room.room_name || "",
      room_type: room.room_type || "",
      capacity: room.capacity || "",
    });
    setEditRoomId(id);
    setShowEditModal(true);
  };
  const openDeleteModal = (id) => {
    setDeleteRoomId(id);
    setShowDeleteModal(true);
  };
  const closeAddModal = () => setShowAddModal(false);
  const closeEditModal = () => setShowEditModal(false);
  const closeDeleteModal = () => setShowDeleteModal(false);

  // Dark mode/sidebar
  const toggleDarkMode = () => {
    setDarkMode(!darkMode);
    document.body.classList.toggle("bg-dark");
    document.body.classList.toggle("text-white");
  };
  const toggleSidebar = () => setCollapsed(!collapsed);
  const openMobileSidebar = () => setMobileSidebarOpen(true);
  const closeMobileSidebar = () => setMobileSidebarOpen(false);
  const sidebarWidth = collapsed ? 80 : 250;

  // Filtered data
const filteredData = rooms.filter(
  (item) =>
    (item.room_number && item.room_number.toLowerCase().includes(filterText.toLowerCase())) ||
    (item.status !== undefined && String(item.status).includes(filterText))
);
const columns = [
  {
    name: "#",
    selector: (row, idx) => idx + 1,
    sortable: true,
    width: "70px",
  },
  {
    name: "Room Number",
    selector: (row) => row.room_number,
    sortable: true,
  },
  {
    name: "Status",
    selector: (row) => row.status === 1 ? "Available" : "Unavailable",
    sortable: true,
  },
    {
      name: "Actions",
      cell: (row) => (
        <div className="d-flex justify-content-center">
          <button
            className="btn btn-sm btn-outline-primary me-2"
            title="Edit"
            onClick={() => openEditModal(row.id)}
          >
            <i className="fa fa-edit"></i>
          </button>
          <button
            className="btn btn-sm btn-outline-danger"
            title="Delete"
            onClick={() => openDeleteModal(row.id)}
          >
            <i className="fa fa-trash"></i>
          </button>
        </div>
      ),
      center: true,
    },
  ];

  const customStyles = {
    headCells: { style: { fontWeight: "bold", fontSize: "14px" } },
    rows: { style: { fontSize: "14px" } },
  };

  return (
    <div
      className={`d-flex min-vh-100 ${
        darkMode ? "bg-dark text-white" : "bg-light"
      } overflow-hidden`}
    >
      <Sidebar collapsed={collapsed} />
      <div
        className="d-flex flex-column flex-grow-1"
        style={{
          marginLeft: window.innerWidth >= 768 ? sidebarWidth : 0,
          transition: "margin-left 0.3s",
          minWidth: 0,
        }}
      >
        <Navbar
          user={user}
          darkMode={darkMode}
          toggleDarkMode={toggleDarkMode}
          toggleSidebar={toggleSidebar}
          openMobileSidebar={openMobileSidebar}
        />
        <div className="flex-grow-1 p-4 d-flex flex-column">
          <h2>Rooms Management</h2>
          <div className="mb-3 d-flex justify-content-between align-items-center">
            <input
              type="text"
              placeholder="Search rooms..."
              className="form-control w-50"
              value={filterText}
              onChange={(e) => setFilterText(e.target.value)}
            />
            <button className="btn btn-success ms-3" onClick={openAddModal}>
              <i className="fa fa-plus me-1"></i> Add Room
            </button>
          </div>
          <DataTable
            columns={columns}
            data={filteredData}
            pagination
            highlightOnHover
            striped
            customStyles={customStyles}
            theme={darkMode ? "dark" : "default"}
          />
        </div>
        <Footer darkMode={darkMode} />
      </div>
      <MobileSidebar open={mobileSidebarOpen} onClose={closeMobileSidebar} />

      {/* Add Modal */}
      {showAddModal && (
        <>
          <div className="modal-backdrop fade show" onClick={closeAddModal}></div>
          <div className="modal d-block" tabIndex="-1" role="dialog" onClick={closeAddModal}>
            <div className="modal-dialog" role="document" onClick={(e) => e.stopPropagation()}>
              <form onSubmit={handleAddRoom}>
                <div className="modal-content">
                  <div className="modal-header">
                    <h5 className="modal-title">Add Room</h5>
                    <button type="button" className="btn-close" onClick={closeAddModal}></button>
                  </div>
                  <div className="modal-body">
                    <div className="mb-2">
                      <label className="form-label">Room Name</label>
                      <input
                        type="text"
                        className="form-control"
                        value={formData.room_name}
                        onChange={(e) => setFormData({ ...formData, room_name: e.target.value })}
                        required
                      />
                    </div>
                    <div className="mb-2">
                      <label className="form-label">Room Type</label>
                      <input
                        type="text"
                        className="form-control"
                        value={formData.room_type}
                        onChange={(e) => setFormData({ ...formData, room_type: e.target.value })}
                        required
                      />
                    </div>
                    <div className="mb-2">
                      <label className="form-label">Capacity</label>
                      <input
                        type="number"
                        className="form-control"
                        value={formData.capacity}
                        onChange={(e) => setFormData({ ...formData, capacity: e.target.value })}
                        required
                        min="1"
                      />
                    </div>
                  </div>
                  <div className="modal-footer">
                    <button type="button" className="btn btn-secondary" onClick={closeAddModal}>
                      Cancel
                    </button>
                    <button type="submit" className="btn btn-success">
                      Add
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </>
      )}

      {/* Edit Modal */}
      {showEditModal && (
        <>
          <div className="modal-backdrop fade show" onClick={closeEditModal}></div>
          <div className="modal d-block" tabIndex="-1" role="dialog" onClick={closeEditModal}>
            <div className="modal-dialog" role="document" onClick={(e) => e.stopPropagation()}>
              <form onSubmit={handleEditRoom}>
                <div className="modal-content">
                  <div className="modal-header">
                    <h5 className="modal-title">Edit Room</h5>
                    <button type="button" className="btn-close" onClick={closeEditModal}></button>
                  </div>
                  <div className="modal-body">
                    <div className="mb-2">
                      <label className="form-label">Room Name</label>
                      <input
                        type="text"
                        className="form-control"
                        value={formData.room_name}
                        onChange={(e) => setFormData({ ...formData, room_name: e.target.value })}
                        required
                      />
                    </div>
                    <div className="mb-2">
                      <label className="form-label">Room Type</label>
                      <input
                        type="text"
                        className="form-control"
                        value={formData.room_type}
                        onChange={(e) => setFormData({ ...formData, room_type: e.target.value })}
                        required
                      />
                    </div>
                    <div className="mb-2">
                      <label className="form-label">Capacity</label>
                      <input
                        type="number"
                        className="form-control"
                        value={formData.capacity}
                        onChange={(e) => setFormData({ ...formData, capacity: e.target.value })}
                        required
                        min="1"
                      />
                    </div>
                  </div>
                  <div className="modal-footer">
                    <button type="button" className="btn btn-secondary" onClick={closeEditModal}>
                      Cancel
                    </button>
                    <button type="submit" className="btn btn-primary">
                      Save Changes
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </>
      )}

      {/* Delete Modal */}
      {showDeleteModal && (
        <>
          <div className="modal-backdrop fade show" onClick={closeDeleteModal}></div>
          <div className="modal d-block" tabIndex="-1" role="dialog" onClick={closeDeleteModal}>
            <div className="modal-dialog" role="document" onClick={(e) => e.stopPropagation()}>
              <div className="modal-content">
                <div className="modal-header">
                  <h5 className="modal-title">Delete Room</h5>
                  <button type="button" className="btn-close" onClick={closeDeleteModal}></button>
                </div>
                <div className="modal-body">
                  <p>
                    Are you sure you want to delete this room?
                  </p>
                </div>
                <div className="modal-footer">
                  <button type="button" className="btn btn-secondary" onClick={closeDeleteModal}>
                    Cancel
                  </button>
                  <button type="button" className="btn btn-danger" onClick={handleDeleteRoom}>
                    Delete
                  </button>
                </div>
              </div>
            </div>
          </div>
        </>
      )}
    </div>
  );
}

export default RoomsManagement;
