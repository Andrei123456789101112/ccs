import React, { useState, useEffect } from "react";
import Swal from "sweetalert2";

function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  useEffect(() => {
    const id = sessionStorage.getItem("id");
    if (id) {
      window.location.href = "/dashboard";
    }
  }, []);

  const handleLogin = async (e) => {
    e.preventDefault();
    if (email.trim() !== "" && password.trim() !== "") {
      try {
        const response = await fetch(process.env.REACT_APP_API_URL + "select", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            table: "users",
            conditions: { email, password },
          }),
        });
        const result = await response.json();
        if (result.data && result.data.length > 0) {
          Object.entries(result.data[0]).forEach(([key, value]) => {
            sessionStorage.setItem(key, value);
          });
          window.location.href = "/";
        } else {
          Swal.fire({
            icon: "error",
            title: "Login Failed",
            text: "User not found or password incorrect",
          });
        }
      } catch (error) {
        Swal.fire({
          icon: "error",
          title: "Error",
          text: "Something went wrong. Please try again.",
        });
      }
    } else {
      Swal.fire({
        icon: "warning",
        title: "Missing Fields",
        text: "Please enter email and password",
      });
    }
  };

  return (
    <div className="container d-flex justify-content-center align-items-center vh-100">
      <div className="card shadow p-4" style={{ width: "400px" }}>
        <h3 className="text-center mb-4">Login</h3>
        <form onSubmit={handleLogin}>
          <div className="mb-3">
            <label className="form-label">Email</label>
            <input
              type="email"
              className="form-control"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder="Enter your email"
              required
            />
          </div>
          <div className="mb-3">
            <label className="form-label">Password</label>
            <input
              type="password"
              className="form-control"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder="Enter your password"
              required
            />
          </div>
          <button type="submit" className="btn btn-primary w-100">
            Login
          </button>
        </form>
      </div>
    </div>
  );
}

export default Login;