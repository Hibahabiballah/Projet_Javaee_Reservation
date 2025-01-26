<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .dashboard-container {
            max-width: 800px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            font-size: 28px;
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
            margin: 20px 0;
        }

        a {
            display: inline-block;
            text-decoration: none;
            background-color: #007BFF;
            color: white;
            font-size: 16px;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        a:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        a:active {
            background-color: #003f88;
        }
    </style>
</head>
<body>
<div class="dashboard-container">
    <h1>Welcome, Admin!</h1>
    <ul>
        <li><a href="admin/rooms?action=list">Room Management</a></li>
        <li><a href="view-reservations">View Reservations</a></li>
        <li><a href="admin/statistics?action=list">View Statistics</a></li>
    </ul>
</div>
</body>
</html>
