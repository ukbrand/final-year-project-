package com.nt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InventoryDAO {

    // Method to dispatch item (update stock and log dispatch)
    public static boolean dispatchItem(String itemId, int quantity) throws SQLException {
        Connection conn = Database.getConnection();
        
        // Check current stock
        String selectSQL = "SELECT quantity FROM inventory WHERE item_id = ?";
        PreparedStatement ps = conn.prepareStatement(selectSQL);
        ps.setString(1, itemId);
        ResultSet rs = ps.executeQuery();

        if (rs.next() && rs.getInt("quantity") >= quantity) {
            // Update stock
            String updateSQL = "UPDATE inventory SET quantity = quantity - ? WHERE item_id = ?";
            PreparedStatement update = conn.prepareStatement(updateSQL);
            update.setInt(1, quantity);
            update.setString(2, itemId);
            update.executeUpdate();

            // Log dispatch in dispatch_log table
            String logSQL = "INSERT INTO dispatch_log (item_id, quantity) VALUES (?, ?)";
            PreparedStatement log = conn.prepareStatement(logSQL);
            log.setString(1, itemId);
            log.setInt(2, quantity);
            log.executeUpdate();

            return true;  // Dispatch success
        }

        return false;  // Not enough stock
    }

    // Method to fetch dispatch logs (history of dispatched items)
    public static List<DispatchLog> getDispatchLogs() throws SQLException {
        List<DispatchLog> logs = new ArrayList<>();
        Connection conn = Database.getConnection();

        // SQL to fetch dispatch logs in descending order (newest first)
        String sql = "SELECT * FROM dispatch_log ORDER BY dispatch_date DESC";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        // Collecting all dispatch logs
        while (rs.next()) {
            DispatchLog log = new DispatchLog();
            log.setItemId(rs.getString("item_id"));
            log.setQuantity(rs.getInt("quantity"));
            log.setDispatchDate(rs.getTimestamp("dispatch_date"));
            logs.add(log);
        }

        return logs;  // Return list of logs
    }
}
