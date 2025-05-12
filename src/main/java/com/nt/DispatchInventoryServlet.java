package com.nt;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class DispatchInventoryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String itemName = request.getParameter("item_name");
        int dispatchQuantity = Integer.parseInt(request.getParameter("dispatch_quantity"));
        String recipientName = request.getParameter("recipient_name");
        String dispatchDate = request.getParameter("dispatch_date");

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/cold_storage?useSSL=false&serverTimezone=UTC";
        String username = "root";
        String password = "root123";

        try {
            // ✅ Load JDBC driver explicitly (useful if auto-loading fails)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection(url, username, password);

            // Step 1: Check if the item is available in the inventory
            String checkInventorySql = "SELECT quantity FROM cold_storage_inventory WHERE item_name = ?";
            PreparedStatement checkInventoryPs = conn.prepareStatement(checkInventorySql);
            checkInventoryPs.setString(1, itemName);
            ResultSet rs = checkInventoryPs.executeQuery();

            if (rs.next()) {
                int currentQuantity = rs.getInt("quantity");

                // Step 2: If enough quantity is available, proceed to update the inventory
                if (currentQuantity >= dispatchQuantity) {
                    // Update the inventory by reducing the quantity
                    String updateInventorySql = "UPDATE cold_storage_inventory SET quantity = quantity - ? WHERE item_name = ?";
                    PreparedStatement updateInventoryPs = conn.prepareStatement(updateInventorySql);
                    updateInventoryPs.setInt(1, dispatchQuantity);
                    updateInventoryPs.setString(2, itemName);
                    int updateResult = updateInventoryPs.executeUpdate();

                    // Step 3: If inventory update is successful, insert a dispatch record
                    if (updateResult > 0) {
                        String dispatchSql = "INSERT INTO dispatch_records (item_name, dispatch_quantity, recipient_name, dispatch_date) "
                                           + "VALUES (?, ?, ?, ?)";
                        PreparedStatement dispatchPs = conn.prepareStatement(dispatchSql);
                        dispatchPs.setString(1, itemName);
                        dispatchPs.setInt(2, dispatchQuantity);
                        dispatchPs.setString(3, recipientName);
                        dispatchPs.setString(4, dispatchDate);

                        int dispatchResult = dispatchPs.executeUpdate();

                        if (dispatchResult > 0) {
                            response.getWriter().println("Items dispatched successfully!");
                        } else {
                            response.getWriter().println("Error recording dispatch!");
                        }
                    } else {
                        response.getWriter().println("Error updating inventory!");
                    }
                } else {
                    response.getWriter().println("Insufficient inventory for dispatch!");
                }
            } else {
                response.getWriter().println("Item not found in inventory!");
            }

            // Close connections
            rs.close();
            checkInventoryPs.close();
            conn.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("MySQL JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
