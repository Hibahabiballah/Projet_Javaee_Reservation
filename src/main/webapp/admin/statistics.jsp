<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Statistics</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
      color: #333;
    }

    .statistics-container {
      max-width: 1000px;
      margin: 50px auto;
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      padding: 20px 0;
      margin: 0;
      color: #007BFF;
      border-bottom: 2px solid #ddd;
    }

    h2 {
      color: #444;
      margin-top: 30px;
    }

    p {
      font-size: 18px;
      font-weight: bold;
      text-align: center;
      margin: 10px 0;
    }

    table {
      width: 100%;
      margin-top: 20px;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      overflow: hidden;
    }

    thead {
      background-color: #007BFF;
      color: white;
    }

    th, td {
      padding: 15px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }

    tbody tr:hover {
      background-color: #f2f2f2;
    }

    a {
      display: inline-block;
      text-decoration: none;
      background-color: #007BFF;
      color: white;
      padding: 10px 20px;
      border-radius: 5px;
      font-size: 16px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      transition: background-color 0.3s ease;
      margin-top: 30px;
      text-align: center;
    }

    a:hover {
      background-color: #0056b3;
    }

    .no-data {
      text-align: center;
      font-style: italic;
      color: #999;
    }
  </style>
</head>
<body>
<div class="statistics-container">
  <h1>Admin Statistics</h1>

  <h2>Total Reservations</h2>
  <p><%= request.getAttribute("totalReservations") %></p>

  <h2>Most Booked Rooms</h2>
  <table>
    <thead>
    <tr>
      <th>Room ID</th>
      <th>Number of Reservations</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Object[]> mostBookedRooms = (List<Object[]>) request.getAttribute("mostBookedRooms");
      if (mostBookedRooms != null && !mostBookedRooms.isEmpty()) {
        for (Object[] room : mostBookedRooms) {
    %>
    <tr>
      <td><%= room[0] %></td>
      <td><%= room[1] %></td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="2" class="no-data">No data available</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>

  <h2>Reservations Per Day</h2>
  <table>
    <thead>
    <tr>
      <th>Date</th>
      <th>Number of Reservations</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Object[]> reservationsPerDay = (List<Object[]>) request.getAttribute("reservationsPerDay");
      if (reservationsPerDay != null && !reservationsPerDay.isEmpty()) {
        for (Object[] day : reservationsPerDay) {
    %>
    <tr>
      <td><%= day[0] %></td>
      <td><%= day[1] %></td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="2" class="no-data">No data available</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>

  <h2>Reservations by User</h2>
  <table>
    <thead>
    <tr>
      <th>User ID</th>
      <th>Number of Reservations</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Object[]> reservationsByUser = (List<Object[]>) request.getAttribute("reservationsByUser");
      if (reservationsByUser != null && !reservationsByUser.isEmpty()) {
        for (Object[] user : reservationsByUser) {
    %>
    <tr>
      <td><%= user[0] %></td>
      <td><%= user[1] %></td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="2" class="no-data">No data available</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>

  <a href="../admin-dashboard.jsp">&larr; Back to Dashboard</a>
</div>
</body>
</html>
