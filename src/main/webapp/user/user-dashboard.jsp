<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>User Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
      color: #333;
    }

    .dashboard-container {
      max-width: 600px;
      margin: 50px auto;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    h1 {
      font-size: 24px;
      color: #007BFF;
      margin-bottom: 30px;
      border-bottom: 2px solid #ddd;
      padding-bottom: 10px;
    }

    ul {
      list-style: none;
      padding: 0;
      margin: 20px 0;
    }

    li {
      margin: 15px 0;
    }

    a {
      text-decoration: none;
      color: #007BFF;
      font-size: 18px;
      font-weight: bold;
      transition: color 0.3s ease;
    }

    a:hover {
      color: #0056b3;
    }

    .logout {
      margin-top: 30px;
    }

    .logout a {
      color: #dc3545;
      font-size: 16px;
      font-weight: bold;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .logout a:hover {
      color: #c82333;
    }

    .action-link {
      display: inline-block;
      padding: 10px 20px;
      background-color: #007BFF;
      color: white;
      font-size: 16px;
      font-weight: bold;
      text-decoration: none;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      transition: background-color 0.3s ease;
    }

    .action-link:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<div class="dashboard-container">
  <h1>Welcome, ${sessionScope.userName}</h1>
  <ul>
    <li><a class="action-link" href="reserve-rooms?action=list">Make a Reservation</a></li>
    <li><a class="action-link" href="view-reservations?action=list">View My Reservations</a></li>
  </ul>
  <div class="logout">
    <a href="<%= request.getContextPath() %>/logout">Logout</a>
  </div>
</div>
</body>
</html>
