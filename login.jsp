<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url = "jdbc:mysql://localhost:3306/blood_bank";
    String user = "root";
    String pass = "Rajp@123";
    String message = "";
    boolean loggedIn = false;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            message = "Please enter username and password.";
        } else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, user, pass);

                PreparedStatement ps = conn.prepareStatement("SELECT * FROM admin_users WHERE username = ? AND password = ?");
                ps.setString(1, username);
                ps.setString(2, password); // For production, hash password!
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    // ✅ Use JSP implicit session, no redeclare
                    session.setAttribute("adminUser", username);
                    loggedIn = true;
                    response.sendRedirect("admin.jsp"); 
                    return;
                } else {
                    message = "Invalid username or password.";
                }
                rs.close();
                ps.close();
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
    <title>Admin Login - Blood Bank</title>
    <style>
        body {
           font-family: 'Courier New', Courier, monospace;
            background: #f4f7f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
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
            background-color: #f8d7da;
            color: #a94442;
            border: 1px solid #a94442;
        }
        .register-link {
            margin-top: 15px;
            text-align: center;
        }
        .register-link a {
            color: #d32f2f;
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Admin Login</h2>
    <% if (!message.isEmpty()) { %>
        <div class="message"><%= message %></div>
    <% } %>
    <form method="post" action="login.jsp" autocomplete="off">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required />

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required />

        <input type="submit" value="Login" />
    </form>
    <div class="register-link">
        Don't have an account? <a href="register.jsp">Register here</a>.
    </div>
</div>
</body>
</html>