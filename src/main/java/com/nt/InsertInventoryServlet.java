package com.nt;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class InsertInventoryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String itemName = request.getParameter("item_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String supplierName = request.getParameter("supplier_name");
        String storageDate = request.getParameter("storage_date");
        String itemCategory = request.getParameter("item_category");
        String expiryDate = request.getParameter("expiry_date");
        String description = request.getParameter("description");

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/cold_storage";

        String username = "root";
        String password = "root123";

        try {
            // Connect to the database
            Connection conn = DriverManager.getConnection(url, username, password);

            // SQL insert statement
            String sql = "INSERT INTO cold_storage_inventory (item_name, quantity, supplier_name, storage_date, item_category, expiry_date, description) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            // Set values to the PreparedStatement
            ps.setString(1, itemName);
            ps.setInt(2, quantity);
            ps.setString(3, supplierName);
            ps.setString(4, storageDate);
            ps.setString(5, itemCategory);
            ps.setString(6, expiryDate);
            ps.setString(7, description);

            // Execute the insert operation
            int result = ps.executeUpdate();

            // Check if the insert was successful
            if (result > 0) {
                response.getWriter().println("Inventory inserted successfully!");
            } else {
                response.getWriter().println("Error inserting inventory!");
            }
            
            // Close connections
            ps.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
