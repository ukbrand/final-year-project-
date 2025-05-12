<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inventory Dispatch Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        table {
            width: 95%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #999;
            padding: 8px 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .no-data {
            color: red;
            font-weight: bold;
        }
        .print-button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border: none;
            margin-bottom: 20px;
        }
        @media print {
            .print-button {
                display: none;
            }
        }
    </style>
    <script>
        // JavaScript function to trigger print dialog
        function printReport() {
            window.print();
        }
    </script>
</head>
<body>
    <h2>Inventory and Dispatch Report</h2>

    <!-- Print Button -->
    <button class="print-button" onclick="printReport()">Print Report</button>

    <%
        // JDBC Code in JSP (not recommended for production, fine for academic use)
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection conn = java.sql.DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cold_storage?useSSL=false&serverTimezone=UTC",
                "root", "root123");

            String sql = "SELECT i.id, i.item_name, i.item_category, i.quantity AS current_quantity, " +
                         "d.dispatch_quantity, d.recipient_name, d.dispatch_date " +
                         "FROM cold_storage_inventory i " +
                         "JOIN dispatch_records d ON i.item_name = d.item_name " +
                         "ORDER BY d.dispatch_date DESC";

            java.sql.Statement stmt = conn.createStatement();
            java.sql.ResultSet rs = stmt.executeQuery(sql);

            boolean hasData = false;
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Item Name</th>
                <th>Category</th>
                <th>Current Quantity</th>
                <th>Dispatched Quantity</th>
                <th>Recipient</th>
                <th>Dispatch Date</th>
            </tr>
            <%
                while (rs.next()) {
                    hasData = true;
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("item_name") %></td>
                <td><%= rs.getString("item_category") %></td>
                <td><%= rs.getInt("current_quantity") %></td>
                <td><%= rs.getInt("dispatch_quantity") %></td>
                <td><%= rs.getString("recipient_name") %></td>
                <td><%= rs.getDate("dispatch_date") %></td>
            </tr>
            <%
                }
                if (!hasData) {
            %>
            <tr>
                <td colspan="7" class="no-data">No records found.</td>
            </tr>
            <% 
                }
                rs.close();
                stmt.close();
                conn.close();
            %>
        </table>
    <%
        } catch (Exception e) {
    %>
        <p class="no-data">Error loading report: <%= e.getMessage() %></p>
    <%
            e.printStackTrace();
        }
    %>
</body>
</html>
