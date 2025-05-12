package com.nt;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class GenerateReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Step 1: HTML structure
        out.println("<html><head><title>Inventory Dispatch Report</title>");
        out.println("<style>table { width: 90%; border-collapse: collapse; } th, td { border: 1px solid #ccc; padding: 8px; }</style>");
        out.println("</head><body>");
        out.println("<h2>Cold Storage Dispatch Report</h2>");

        try {
            // Step 2: Load driver and connect to DB
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cold_storage?useSSL=false&serverTimezone=UTC", "root", "root123");

            // Step 3: Join Query
            String sql = "SELECT i.id, i.item_name, i.item_category, i.quantity AS current_quantity, " +
                         "d.dispatch_quantity, d.recipient_name, d.dispatch_date " +
                         "FROM cold_storage_inventory i " +
                         "JOIN dispatch_records d ON i.item_name = d.item_name " +
                         "ORDER BY d.dispatch_date DESC";

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            // Step 4: Print table
            out.println("<table>");
            out.println("<tr><th>ID</th><th>Item Name</th><th>Category</th><th>Current Quantity</th>" +
                        "<th>Dispatched</th><th>Recipient</th><th>Dispatch Date</th></tr>");

            boolean found = false;
            while (rs.next()) {
                found = true;
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" + rs.getString("item_name") + "</td>");
                out.println("<td>" + rs.getString("item_category") + "</td>");
                out.println("<td>" + rs.getInt("current_quantity") + "</td>");
                out.println("<td>" + rs.getInt("dispatch_quantity") + "</td>");
                out.println("<td>" + rs.getString("recipient_name") + "</td>");
                out.println("<td>" + rs.getDate("dispatch_date") + "</td>");
                out.println("</tr>");
            }

            if (!found) {
                out.println("<tr><td colspan='7'>No data found</td></tr>");
            }

            out.println("</table>");
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace(out);
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }

        out.println("</body></html>");
    }
}
