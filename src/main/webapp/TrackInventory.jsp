<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Inventory</title>
    <link rel="stylesheet" href="css/styles.css"> <!-- External CSS -->
</head>
<style>

/* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f7fc;
    margin: 0;
    padding: 0;
}

.form-container {
    width: 80%;
    max-width: 1000px;
    margin: 50px auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
    color: #333;
    font-size: 24px;
    margin-bottom: 30px;
}

/* Form Styles */
form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

label {
    font-size: 14px;
    color: #555;
    margin-bottom: 5px;
}

input[type="text"],
input[type="number"] {
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 100%;
    box-sizing: border-box;
}

button {
    padding: 10px 20px;
    background-color: #007BFF;
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #0056b3;
}

/* Table Styles */
table {
    width: 100%;
    margin-top: 30px;
    border-collapse: collapse;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #007BFF;
    color: white;
    font-size: 16px;
}

td {
    background-color: #fafafa;
}

tbody tr:hover {
    background-color: #f1f1f1;
}

tfoot {
    background-color: #f9f9f9;
    text-align: center;
}

tfoot td {
    padding: 10px;
    color: #333;
}

/* Placeholder Styles */
input::placeholder {
    color: #bbb;
}


</style>
<body>
    <div class="form-container">
        <h2>Track Inventory</h2>

        <!-- Form to accept search input -->
        <form action="TrackInventoryServlet" method="get">
            <label for="item_id">Item ID (optional):</label>
            <input type="text" id="item_id" name="item_id" placeholder="Enter Item ID">

            <label for="item_category">Item Category (optional):</label>
            <input type="text" id="item_category" name="item_category" placeholder="Enter Item Category">

            <label for="quantity">Minimum Quantity (optional):</label>
            <input type="number" id="quantity" name="quantity" placeholder="Enter minimum quantity">

            <button type="submit">Track Inventory</button>
        </form>

        <!-- Table to display results -->
        <table>
            <thead>
                <tr>
                    <th>Item ID</th>
                    <th>Item Name</th>
                    <th>Quantity</th>
                    <th>Supplier</th>
                    <th>Category</th>
                    <th>Storage Date</th>
                    <th>Expiry Date</th>
                </tr>
            </thead>
            <tbody>
                <!-- Results will be populated dynamically by the servlet -->
                <%= request.getAttribute("inventoryResults") != null ? request.getAttribute("inventoryResults") : "<tr><td colspan='7'>No items found</td></tr>" %>
            </tbody>
        </table>
    </div>
</body>
</html>
