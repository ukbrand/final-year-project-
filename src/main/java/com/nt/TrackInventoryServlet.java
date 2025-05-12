package com.nt;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class TrackInventoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemId = request.getParameter("item_id");
        String category = request.getParameter("item_category");
        String quantityStr = request.getParameter("quantity");
        int quantity = (quantityStr != null && !quantityStr.isEmpty()) ? Integer.parseInt(quantityStr) : 0;

        // Set response content type
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cold_storage?useSSL=false&serverTimezone=UTC",
                    "root", "root123");

            // SQL query
            StringBuilder query = new StringBuilder("SELECT * FROM cold_storage_inventory WHERE 1=1");

            if (itemId != null && !itemId.isEmpty()) {
                query.append(" AND id = ?");
            }
            if (category != null && !category.isEmpty()) {
                query.append(" AND item_category = ?");
            }
            if (quantity > 0) {
                query.append(" AND quantity >= ?");
            }

            PreparedStatement ps = conn.prepareStatement(query.toString());

            int paramIndex = 1;

            // Set parameters dynamically
            if (itemId != null && !itemId.isEmpty()) {
                ps.setString(paramIndex++, itemId);
            }
            if (category != null && !category.isEmpty()) {
                ps.setString(paramIndex++, category);
            }
            if (quantity > 0) {
                ps.setInt(paramIndex++, quantity);
            }

            // Execute query
            ResultSet rs = ps.executeQuery();

            // Prepare results
            StringBuilder results = new StringBuilder();

            while (rs.next()) {
                String row = "<tr>"
                        + "<td>" + rs.getString("id") + "</td>"
                        + "<td>" + rs.getString("item_name") + "</td>"
                        + "<td>" + rs.getInt("quantity") + "</td>"
                        + "<td>" + rs.getString("supplier_name") + "</td>"
                        + "<td>" + rs.getString("item_category") + "</td>"
                        + "<td>" + rs.getString("storage_date") + "</td>"
                        + "<td>" + rs.getString("expiry_date") + "</td>"
                        + "</tr>";
                results.append(row);
            }

            // Set results as request attribute
            request.setAttribute("inventoryResults", results.toString());

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("inventoryResults", "<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
        }

        // Forward to JSP page to display results
        RequestDispatcher dispatcher = request.getRequestDispatcher("/TrackInventory.jsp");
        dispatcher.forward(request, response);
    }
}
