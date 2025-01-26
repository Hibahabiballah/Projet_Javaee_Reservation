<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Reservations</title>
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
            color: #444;
            background-color: #f3f3f3;
            border-bottom: 1px solid #ddd;
        }

        .back-button {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .back-button a {
            text-decoration: none;
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .back-button a:hover {
            background-color: #0056b3;
        }

        .success-message {
            color: #28a745;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .error-message {
            color: #dc3545;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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

        th {
            font-weight: bold;
        }

        tbody tr:hover {
            background-color: #f2f2f2;
        }

        button {
            background-color: #17a2b8;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #117a8b;
        }

        select {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        form {
            display: inline;
        }
    </style>
</head>
<body>
<h1>Room Reservations</h1>

<!-- Functional Go Back Button -->
<div class="back-button">
    <a href="admin-dashboard.jsp">&larr; Go Back to Menu</a>
</div>

<!-- Success or Error Messages -->
<c:if test="${not empty success}">
    <div class="success-message">${success}</div>
</c:if>
<c:if test="${not empty error}">
    <div class="error-message">${error}</div>
</c:if>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Date</th>
        <th>Start Time</th>
        <th>End Time</th>
        <th>Status</th>
        <th>User</th>
        <th>Room</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="reservation" items="${reservations}">
        <tr>
            <td>${reservation[0]}</td> <!-- ID -->
            <td>${reservation[1]}</td> <!-- Date -->
            <td>${reservation[2]}</td> <!-- Start Time -->
            <td>${reservation[3]}</td> <!-- End Time -->
            <td>${reservation[4]}</td> <!-- Status -->
            <td>${reservation[5]}</td> <!-- User Name -->
            <td>${reservation[6]}</td> <!-- Room Name -->
            <td>
                <!-- Admin can update the status -->
                <form action="view-reservations" method="post">
                    <input type="hidden" name="id" value="${reservation[0]}"> <!-- Reservation ID -->
                    <input type="hidden" name="date" value="${reservation[1]}"> <!-- Date -->
                    <input type="hidden" name="start_time" value="${reservation[2]}"> <!-- Start Time -->
                    <input type="hidden" name="end_time" value="${reservation[3]}"> <!-- End Time -->
                    <input type="hidden" name="room_id" value="${reservation[6]}"> <!-- Room ID -->
                    <input type="hidden" name="user_id" value="${reservation[5]}"> <!-- User ID -->
                    <select name="status">
                        <option value="Confirmed" ${reservation[4] == 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                        <option value="Pending" ${reservation[4] == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Rejected" ${reservation[4] == 'Rejected' ? 'selected' : ''}>Rejected</option>
                    </select>
                    <button type="submit">Update</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
