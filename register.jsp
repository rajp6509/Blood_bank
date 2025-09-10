<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url = "jdbc:mysql://localhost:3306/blood_bank";
    String user = "root";
    String pass = "Rajp@123";
    String message = "";
    String messageType = "error";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        if (username == null || password == null || confirmPassword == null ||
            username.trim().isEmpty() || password.trim().isEmpty() || confirmPassword.trim().isEmpty()) {
            message = "Please fill all fields.";
        } else if (!password.equals(confirmPassword)) {
            message = "Passwords do not match.";
        } else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, user, pass);

                // Check if username exists
                PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM admin_users WHERE username = ?");
                checkStmt.setString(1, username);
                ResultSet rs = checkStmt.executeQuery();
                if (rs.next()) {
                    message = "Username already exists.";
                } else {
                    // Insert new user
                    PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO admin_users (username, password) VALUES (?, ?)");
                    insertStmt.setString(1, username);
                    insertStmt.setString(2, password); // For production, hash password!
                    int inserted = insertStmt.executeUpdate();
                    if (inserted > 0) {
                        message = "Registration successful! <a href='login.jsp'>Login here</a>.";
                        messageType = "success";
                    } else {
                        message = "Registration failed. Please try again.";
                    }
                    insertStmt.close();
                }
                rs.close();
                checkStmt.close();
                conn.close();
            } catch (Exception e) {
                message = "Error: " + e.getMessage();
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Register - Blood Bank</title>
    <style>
        body {
            font-family: 'Courier New', Courier, monospace;
            background: #f4f7f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-container {
            background: white;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 350px;
        }
        h2 {
            text-align: center;
            color: #d32f2f;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 15px;
        }
        input[type="submit"] {
            margin-top: 25px;
            width: 100%;
            background-color: #d32f2f;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #b71c1c;
        }
        .message {
            margin-top: 15px;
            padding: 10px;
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
        .login-link {
            margin-top: 15px;
            text-align: center;
        }
        .login-link a {
            color: #d32f2f;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="register-container">
    <h2>Admin Register</h2>
    <% if (!message.isEmpty()) { %>
        <div class="message <%= messageType %>"><%= message %></div>
    <% } %>
    <form method="post" action="register.jsp" autocomplete="off">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required />

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required />

        <label for="confirm_password">Confirm Password</label>
        <input type="password" id="confirm_password" name="confirm_password" required />

        <input type="submit" value="Register" />
    </form>
    <div class="login-link">
        Already have an account? <a href="login.jsp">Login here</a>.
    </div>
</div>
</body>
</html>