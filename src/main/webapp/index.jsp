<!DOCTYPE html>
<html>
<head>
  <title>Room Reservation System</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
      color: #333;
    }

    .container {
      max-width: 600px;
      margin: 50px auto;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      font-size: 24px;
      color: #007BFF;
      text-align: center;
      margin-bottom: 20px;
    }

    form {
      margin-bottom: 30px;
    }

    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    input, select {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ddd;
      border-radius: 5px;
      box-sizing: border-box;
    }

    input[type="submit"] {
      background-color: #007BFF;
      color: white;
      border: none;
      cursor: pointer;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Add New User</h1>
  <form method="post" action="app">
    <input type="hidden" name="action" value="addUser">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>

    <label for="role">Role:</label>
    <select id="role" name="role">
      <option value="admin">Admin</option>
      <option value="client">Client</option>
    </select>

    <input type="submit" value="Add User">
  </form>

  <h1>Add New Room</h1>
  <form method="post" action="app">
    <input type="hidden" name="action" value="addRoom">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="capacity">Capacity:</label>
    <input type="number" id="capacity" name="capacity" required>

    <label for="equipment">Equipment:</label>
    <input type="text" id="equipment" name="equipment">

    <input type="submit" value="Add Room">
  </form>

  <h1>Add New Reservation</h1>
  <form method="post" action="app">
    <input type="hidden" name="action" value="addReservation">
    <label for="userId">User ID:</label>
    <input type="number" id="userId" name="userId" required>

    <label for="roomId">Room ID:</label>
    <input type="number" id="roomId" name="roomId" required>

    <label for="date">Date:</label>
    <input type="text" id="date" name="date" placeholder="yyyy-MM-dd" required>

    <label for="status">Status:</label>
    <input type="text" id="status" name="status" required>

    <input type="submit" value="Add Reservation">
  </form>
</div>
</body>
</html>
