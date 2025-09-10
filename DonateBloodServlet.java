package com.lifeflowbloodbank.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DonateBloodServlet")
public class DonateBloodServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String bloodGroup = request.getParameter("bloodGroup");

        // Simple validation
        if (fullName == null || fullName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            bloodGroup == null || bloodGroup.trim().isEmpty()) {
            request.setAttribute("message", "Please fill all fields.");
            request.getRequestDispatcher("donate.jsp").forward(request, response);
            return;
        }

        // For demo: print to console (replace with DB logic)
        System.out.println("Donation received:");
        System.out.println("Name: " + fullName);
        System.out.println("Email: " + email);
        System.out.println("Blood Group: " + bloodGroup);

        // Send success message back to form
        request.setAttribute("message", "Thank you, " + fullName + "! Your donation info has been received.");
        request.getRequestDispatcher("donate.jsp").forward(request, response);
    }
}