<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Initialize variables
    String selectedBloodGroup = request.getParameter("bloodGroup");
    String city = request.getParameter("city");
    List<Map<String, String>> donors = new ArrayList<>();
    String message = null;

    if ("GET".equalsIgnoreCase(request.getMethod()) && selectedBloodGroup != null && !selectedBloodGroup.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String dbURL = "jdbc:mysql://localhost:3306/blood_bank";
        String dbUser   = "root"; // your DB username
        String dbPass = "Rajp@123"; // your DB password

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser  , dbPass);

            String sql = "SELECT full_name, email, blood_group, city FROM blood_donors WHERE blood_group = ?";
            if (city != null && !city.trim().isEmpty()) {
                sql += " AND city LIKE ?";
            }
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, selectedBloodGroup);
            if (city != null && !city.trim().isEmpty()) {
                stmt.setString(2, "%" + city.trim() + "%");
            }

            rs = stmt.executeQuery();

            while (rs.next()) {
                Map<String, String> donor = new HashMap<>();
                donor.put("full_name", rs.getString("full_name"));
                donor.put("email", rs.getString("email"));
                donor.put("blood_group", rs.getString("blood_group"));
                donor.put("city", rs.getString("city") != null ? rs.getString("city") : "N/A");
                donors.add(donor);
            }

            if (donors.isEmpty()) {
                message = "No donors found matching your criteria.";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Find Donor - Life Flow Blood Bank</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
     body { font-family: 'Courier New', Courier, monospace; }
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 1s ease, transform 1s ease;
        }
        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }
    </style>
</head>
<body class="bg-gray-50 text-gray-900 min-h-screen flex flex-col">

    <!-- Header Section -->
    <header class="bg-red-600 shadow-lg sticky top-0 z-50">
    <div class="container mx-auto px-4 py-4 flex justify-between items-center">
        <div class="text-white text-2xl font-bold">Life Flow Blood Bank</div>
        <nav class="hidden md:flex space-x-6 items-center">
            <a href="index.jsp" class="text-white hover:text-red-200 transition duration-300">Home</a>
            <a href="aboutus.jsp" class="text-white hover:text-red-200 transition duration-300">About Us</a>
            <a href="donate.jsp" class="text-white hover:text-red-200 transition duration-300">Donate Blood</a>
            <a href="findDonor.jsp" class="text-white hover:text-red-200 transition duration-300">Find Donor</a>
            <a href="#contact" class="text-white hover:text-red-200 transition duration-300">Contact</a>

            <!-- Admin Login Icon -->
            <a href="login.jsp" title="Admin Login" class="text-white hover:text-red-200 transition duration-300 flex items-center space-x-1 ml-4">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M5.121 17.804A9 9 0 1118.88 6.196M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                </svg>
                <span class="hidden sm:inline">Login</span>
            </a>

            <!-- Admin Register Icon -->
            <a href="register.jsp" title="Admin Register" class="text-white hover:text-red-200 transition duration-300 flex items-center space-x-1 ml-2">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                </svg>
                <span class="hidden sm:inline">Sign Up</span>
            </a>
        </nav>
        <button id="mobile-menu-btn" class="md:hidden text-white focus:outline-none">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5M3.75 17.25h16.5" />
            </svg>
        </button>
    </div>
    <div id="mobile-menu" class="hidden md:hidden bg-red-700 px-4 py-2 space-y-2">
        <a href="index.jsp" class="block text-white py-2">Home</a>
        <a href="aboutus.jsp" class="block text-white py-2">About</a>
        <a href="#donate" class="block text-white py-2">Donate Blood</a>
        <a href="#find-donor" class="block text-white py-2">Find Donor</a>
        <a href="#contact" class="block text-white py-2">Contact</a>
        <a href="login.jsp" class="block text-white py-2 flex items-center space-x-2">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M5.121 17.804A9 9 0 1118.88 6.196M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
            </svg>
            <span>Login</span>
        </a>
        <a href="register.jsp" class="block text-white py-2 flex items-center space-x-2">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
            </svg>
            <span>Sign Up</span>
        </a>
    </div>
</header>

    <!-- Main Content -->
    <main class="flex-grow container mx-auto px-4 py-16 max-w-4xl">
        <h1 class="text-4xl font-bold text-red-600 mb-8 text-center fade-in">Find a Blood Donor</h1>

        <form action="findDonor.jsp" method="get" class="bg-white shadow-md rounded-lg p-8 mb-12 fade-in" novalidate>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label for="bloodGroup" class="block mb-2 font-semibold text-gray-700">Blood Group <span class="text-red-600">*</span></label>
                    <select id="bloodGroup" name="bloodGroup" required
                        class="w-full px-4 py-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-600">
                        <option value="" disabled <%= (selectedBloodGroup == null || selectedBloodGroup.isEmpty()) ? "selected" : "" %>>Select blood group</option>
                        <option value="A+" <%= "A+".equals(selectedBloodGroup) ? "selected" : "" %>>A+</option>
                        <option value="A-" <%= "A-".equals(selectedBloodGroup) ? "selected" : "" %>>A-</option>
                        <option value="B+" <%= "B+".equals(selectedBloodGroup) ? "selected" : "" %>>B+</option>
                        <option value="B-" <%= "B-".equals(selectedBloodGroup) ? "selected" : "" %>>B-</option>
                        <option value="AB+" <%= "AB+".equals(selectedBloodGroup) ? "selected" : "" %>>AB+</option>
                        <option value="AB-" <%= "AB-".equals(selectedBloodGroup) ? "selected" : "" %>>AB-</option>
                        <option value="O+" <%= "O+".equals(selectedBloodGroup) ? "selected" : "" %>>O+</option>
                        <option value="O-" <%= "O-".equals(selectedBloodGroup) ? "selected" : "" %>>O-</option>
                    </select>
                </div>
                <div>
                    <label for="city" class="block mb-2 font-semibold text-gray-700">City (optional)</label>
                    <input type="text" id="city" name="city" placeholder="Enter city"
                        value="<%= city != null ? city : "" %>"
                        class="w-full px-4 py-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-600" />
                </div>
            </div>
            <div class="mt-8 text-center">
                <button type="submit"
                    class="bg-red-600 text-white font-bold py-3 px-10 rounded-md hover:bg-red-700 transition duration-300">
                    Search
                </button>
            </div>
        </form>

        <% if (message != null) { %>
            <p class="text-center text-red-600 font-semibold mb-8 fade-in"><%= message %></p>
        <% } %>

        <% if (!donors.isEmpty()) { %>
            <div class="overflow-x-auto fade-in">
                <table class="min-w-full bg-white rounded-lg shadow-md">
                    <thead class="bg-red-600 text-white">
                        <tr>
                            <th class="py-3 px-6 text-left">Name</th>
                            <th class="py-3 px-6 text-left">Email</th>
                            <th class="py-3 px-6 text-left">Blood Group</th>
                            <th class="py-3 px-6 text-left">City</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Map<String, String> donor : donors) { %>
                            <tr class="border-b hover:bg-red-50">
                                <td class="py-3 px-6"><%= donor.get("full_name") %></td>
                                <td class="py-3 px-6"><a href="mailto:<%= donor.get("email") %>" class="text-red-600 hover:underline"><%= donor.get("email") %></a></td>
                                <td class="py-3 px-6 font-semibold text-red-600"><%= donor.get("blood_group") %></td>
                                <td class="py-3 px-6"><%= donor.get("city") %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>
    </main>

    <!-- Footer -->
    <footer id="contact" class="bg-red-600 text-white py-10 mt-auto">
        <div class="container mx-auto px-4 grid grid-cols-1 md:grid-cols-3 gap-8">
            <div>
                <h3 class="text-xl font-bold mb-4">Contact Us</h3>
                <p>Email: info@lifeflowbloodbank.com</p>
                <p>Phone: (123) 456-7890</p>
                <p>Address: 123 Blood Lane, Life City, 00000</p>
            </div>
            <div>
                <h3 class="text-xl font-bold mb-4">Quick Links</h3>
                <ul class="space-y-2">
                    <li><a href="index.jsp" class="hover:text-red-200">Home</a></li>
                    <li><a href="aboutus.jsp" class="hover:text-red-200">About</a></li>
                    <li><a href="donate.jsp" class="hover:text-red-200">Donate Blood</a></li>
                </ul>
            </div>
            <div class="text-center">
                <h3 class="text-xl font-bold mb-4">Stay Connected</h3>
                <p>Follow us for updates on blood drives and success stories.</p>
            </div>
        </div>
        <div class="text-center mt-8 border-t border-red-500 pt-4">
            <p>© 2025 Life Flow Blood Bank. All rights reserved. | Designed with care for humanity.</p>
        </div>
    </footer>

    <!-- JavaScript for Interactions -->
    <script>
        // Mobile menu toggle
        const btn = document.getElementById('mobile-menu-btn');
        const menu = document.getElementById('mobile-menu');
        btn.addEventListener('click', () => {
            menu.classList.toggle('hidden');
        });

        // Fade-in animation on scroll
        const faders = document.querySelectorAll('.fade-in');
        const appearOptions = { threshold: 0.6, rootMargin: '0px 0px -100px 0px' };
        const appearOnScroll = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, appearOptions);
        faders.forEach(fader => appearOnScroll.observe(fader));
    </script>
</body>
</html>