<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/blood_bank";
    String user = "root"; // your DB username
    String pass = "Rajp@123"; // your DB password
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String message = "";
    String messageType = "success"; // success or error

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);

        // Check if form is submitted
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String name = request.getParameter("name");
            String blood_group = request.getParameter("blood_group");
            String contact = request.getParameter("contact");
            String city = request.getParameter("city");

            if (name != null && blood_group != null && contact != null && city != null &&
                !name.trim().isEmpty() && !blood_group.trim().isEmpty() &&
                !contact.trim().isEmpty() && !city.trim().isEmpty()) {

                String sql = "INSERT INTO blood_donors (full_name, blood_group, email, city) VALUES (?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, blood_group);
                ps.setString(3, contact);
                ps.setString(4, city);
                int inserted = ps.executeUpdate();
                if (inserted > 0) {
                    message = "Donor added successfully!";
                    messageType = "success";
                } else {
                    message = "Failed to add donor.";
                    messageType = "error";
                }
                ps.close();
            } else {
                message = "Please fill all fields.";
                messageType = "error";
            }
        }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Portal - Blood Bank</title>
    <style>
        /* Reset some default styles */
        * {
            box-sizing: border-box;
        }
        body {
           font-family: 'Courier New', Courier, monospace;
            background: #f4f7f8;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #fff;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        h2, h3 {
            text-align: center;
            color: #d32f2f; /* blood red */
            margin-bottom: 20px;
        }
        form {
            margin-bottom: 40px;
            background: #fafafa;
            padding: 20px 25px;
            border-radius: 6px;
            border: 1px solid #ddd;
        }
        form label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #555;
        }
        form input[type="text"], form input[type="email"] {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }
        form input[type="text"]:focus, form input[type="email"]:focus {
            border-color: #d32f2f;
            outline: none;
        }
        form input[type="submit"] {
            background-color: #d32f2f;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: block;
            margin: 0 auto;
            width: 150px;
        }
        form input[type="submit"]:hover {
            background-color: #b71c1c;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }
        table thead {
            background-color: #d32f2f;
            color: white;
        }
        table th, table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }
        table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tbody tr:hover {
            background-color: #ffe6e6;
        }
        .message {
            max-width: 600px;
            margin: 0 auto 30px auto;
            padding: 12px 20px;
            border-radius: 5px;
            font-weight: 600;
            text-align: center;
        }
        .message.success {
            background-color: #d0f0d8;
            color: #2e7d32;
            border: 1px solid #2e7d32;
        }
        .message.error {
            background-color: #f8d7da;
            color: #a94442;
            border: 1px solid #a94442;
        }
        @media (max-width: 600px) {
            .container {
                padding: 20px 15px;
            }
            form input[type="submit"] {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Admin Portal - Blood Bank</h2>

    <% if (!message.isEmpty()) { %>
        <div class="message <%= messageType %>"><%= message %></div>
    <% } %>

    <h3>Add New Donor</h3>
    <form method="post" action="admin.jsp" autocomplete="off">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" placeholder="Enter full name" required />

        <label for="blood_group">Blood Group</label>
        <input type="text" id="blood_group" name="blood_group" placeholder="e.g. A+, B-, O+" required />

        <label for="contact">Email</label>
        <input type="email" id="contact" name="contact" placeholder="Enter email address" required />

        <label for="city">City</label>
        <input type="text" id="city" name="city" placeholder="Enter city" required />

        <input type="submit" value="Add Donor" />
    </form>

    <h3>Donor List</h3>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Blood Group</th>
            <th>Email</th>
            <th>City</th>
        </tr>
        </thead>
        <tbody>
        <%
            String selectSQL = "SELECT * FROM blood_donors ORDER BY id DESC";
            ps = conn.prepareStatement(selectSQL);
            rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("full_name") %></td>
            <td><%= rs.getString("blood_group") %></td>
            <td><%= rs.getString("email") %></td>
            <td><%= rs.getString("city") %></td>
        </tr>
        <%
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        }
        %>
        </tbody>
    </table>
</div>
</body>
</html>