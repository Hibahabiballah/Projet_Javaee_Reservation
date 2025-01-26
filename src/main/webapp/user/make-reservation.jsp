<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Room" %>
<!DOCTYPE html>
<html>
<head>
  <title>Make a Reservation</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
      color: #333;
    }

    h1 {
      text-align: center;
      padding: 20px 0;
      margin: 0;
      color: #007BFF;
      border-bottom: 2px solid #ddd;
    }

    h2 {
      text-align: center;
      color: #444;
      margin-top: 20px;
    }

    .message, .error {
      font-weight: bold;
      text-align: center;
      margin: 20px 0;
      font-size: 16px;
    }

    .message {
      color: #28a745;
    }

    .error {
      color: #dc3545;
    }

    table {
      width: 90%;
      margin: 20px auto;
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

    form {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 10px;
    }

    form label {
      font-weight: bold;
    }

    form input, form button {
      padding: 10px;
      border-radius: 5px;
      border: 1px solid #ddd;
      font-size: 14px;
    }

    form button {
      background-color: #007BFF;
      color: white;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    form button:hover {
      background-color: #0056b3;
    }

    a {
      display: inline-block;
      text-align: center;
      margin: 20px auto;
      text-decoration: none;
      background-color: #007BFF;
      color: white;
      padding: 10px 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      font-size: 16px;
      transition: background-color 0.3s ease;
    }

    a:hover {
      background-color: #0056b3;
    }

    .no-rooms {
      text-align: center;
      font-size: 16px;
      color: #666;
    }
  </style>
</head>
<body>
<h1>Make a Reservation</h1>

<%
  String success = (String) request.getSession().getAttribute("success");
  if (success != null) {
%>
<p class="message"><%= success %></p>
<%
    request.getSession().removeAttribute("success");
  }
  String error = (String) request.getAttribute("error");
  if (error != null) {
%>
<p class="error"><%= error %></p>
<%
  }
%>

<%
  List<Room> rooms = (List<Room>) request.getAttribute("rooms");
%>

<h2>Available Rooms</h2>
<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Capacity</th>
    <th>Equipment</th>
    <th>Availability</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <%
    if (rooms != null && !rooms.isEmpty()) {
      for (Room room : rooms) {
  %>
  <tr>
    <td><%= room.getId() %></td>
    <td><%= room.getName() %></td>
    <td><%= room.getCapacity() %></td>
    <td><%= room.getEquipment() %></td>
    <td><%= room.isAvailability() ? "Available" : "Not Available" %></td>
    <td>
      <form action="reserve-rooms" method="post">
        <input type="hidden" name="action" value="reserve">
        <input type="hidden" name="room" value="<%= room.getId() %>">
        <label>Date:</label>
        <input type="date" name="date" required>
        <label>Start Time:</label>
        <input type="time" name="startTime" required>
        <label>End Time:</label>
        <input type="time" name="endTime" required>
        <button type="submit" <%= !room.isAvailability() ? "disabled" : "" %>>Reserve</button>
      </form>
    </td>
  </tr>
  <%
    }
  } else {
  %>
  <tr>
    <td colspan="6" class="no-rooms">No rooms available</td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>

<a href="user-dashboard.jsp">Back to Dashboard</a>
</body>
</html>
