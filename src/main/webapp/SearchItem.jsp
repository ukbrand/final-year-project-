<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Item</title>
    <style>
        /* Reset default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #ecf0f1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            text-align: center;
        }

        h2 {
            color: #34495e;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: 600;
        }

        label {
            font-size: 16px;
            color: #2c3e50;
            margin-bottom: 10px;
            display: block;
        }

        input[type="text"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 25px;
            border: 1px solid #dcdde1;
            border-radius: 8px;
            font-size: 16px;
            background-color: #f9f9f9;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: #3498db;
            background-color: #fff;
        }

        .search-btn {
            width: 100%;
            padding: 15px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .search-btn:hover {
            background-color: #2980b9;
        }

        .search-btn i {
            font-size: 18px;
        }

        .message {
            margin-top: 20px;
            font-size: 14px;
            color: #e74c3c;
        }

        .message.success {
            color: #28a745;
        }

    </style>
    <!-- Link to Font Awesome for the search icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="form-container">
        <h2>Search Item by ID</h2>

        <form action="UpdateInventory.jsp" method="get">
            <label for="item_id">Item ID:</label>
            <input type="text" id="item_id" name="item_id" placeholder="Enter Item ID" required>

            <button type="submit" class="search-btn">
                <i class="fas fa-search"></i> Search
            </button>
        </form>

        <!-- Display message on successful or unsuccessful search -->
        <div class="message"></div>
    </div>
</body>
</html>
