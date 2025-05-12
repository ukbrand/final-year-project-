<%@ page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventory Update</title>
    <style>
        /* General reset for margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin-top:200px;
            padding: 20px;
        }

        .form-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2C3E50;
        }

        label {
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .message {
            padding: 10px;
            margin-top: 15px;
            border-radius: 4px;
        }

        .message.success {
            background-color: #28a745;
            color: white;
        }

        .message.error {
            background-color: #e74c3c;
            color: white;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Update Inventory Information</h2>

        <%
            String itemId = request.getParameter("item_id");
            String itemName = "", supplierName = "", storageDate = "", itemCategory = "", expiryDate = "", description = "";
            int quantity = 0;

            if (itemId != null && request.getMethod().equalsIgnoreCase("GET")) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/cold_storage?useSSL=false&serverTimezone=UTC",
                        "root", "root123");

                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM cold_storage_inventory WHERE id = ?");
                    ps.setString(1, itemId);
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        itemName = rs.getString("item_name");
                        quantity = rs.getInt("quantity");
                        supplierName = rs.getString("supplier_name");
                        storageDate = rs.getString("storage_date");
                        itemCategory = rs.getString("item_category");
                        expiryDate = rs.getString("expiry_date");
                        description = rs.getString("description");
                    } else {
                        out.println("<p class='message error'>Item not found!</p>");
                    }

                    rs.close(); ps.close(); conn.close();
                } catch (Exception e) {
                    out.println("<p class='message error'>Error: " + e.getMessage() + "</p>");
                }
            }
        %>

        <form method="post">
            <input type="hidden" name="item_id" value="<%= itemId %>">

            <label>Item Name:</label>
            <input type="text" name="item_name" value="<%= itemName %>" required>

            <label>Quantity:</label>
            <input type="number" name="quantity" value="<%= quantity %>" required>

            <label>Supplier Name:</label>
            <input type="text" name="supplier_name" value="<%= supplierName %>" required>

            <label>Storage Date:</label>
            <input type="date" name="storage_date" value="<%= storageDate %>" required>

            <label>Item Category:</label>
            <input type="text" name="item_category" value="<%= itemCategory %>" required>

            <label>Expiry Date:</label>
            <input type="date" name="expiry_date" value="<%= expiryDate %>" required>

            <label>Description:</label>
            <textarea name="description" required><%= description %></textarea>

            <input type="submit" value="Update">
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String updatedItemName = request.getParameter("item_name");
                int updatedQuantity = Integer.parseInt(request.getParameter("quantity"));
                String updatedSupplierName = request.getParameter("supplier_name");
                String updatedStorageDate = request.getParameter("storage_date");
                String updatedItemCategory = request.getParameter("item_category");
                String updatedExpiryDate = request.getParameter("expiry_date");
                String updatedDescription = request.getParameter("description");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/cold_storage?useSSL=false&serverTimezone=UTC",
                        "root", "root123");

                    String updateSQL = "UPDATE cold_storage_inventory SET item_name = ?, quantity = ?, supplier_name = ?, storage_date = ?, item_category = ?, expiry_date = ?, description = ? WHERE id = ?";
                    PreparedStatement ps = conn.prepareStatement(updateSQL);
                    ps.setString(1, updatedItemName);
                    ps.setInt(2, updatedQuantity);
                    ps.setString(3, updatedSupplierName);
                    ps.setString(4, updatedStorageDate);
                    ps.setString(5, updatedItemCategory);
                    ps.setString(6, updatedExpiryDate);
                    ps.setString(7, updatedDescription);
                    ps.setString(8, itemId);

                    int result = ps.executeUpdate();
                    if (result > 0) {
                        out.println("<p class='message success'>Information updated successfully!</p>");
                    } else {
                        out.println("<p class='message error'>Update failed!</p>");
                    }

                    ps.close(); conn.close();
                } catch (Exception e) {
                    out.println("<p class='message error'>Database Error: " + e.getMessage() + "</p>");
                }
            }
        %>
    </div>
</body>
</html>
