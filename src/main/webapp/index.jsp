<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cold Storage Login</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #0066ff, #00ccff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }

        h1 {
            margin-bottom: 10px;
            color: #333;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            box-shadow: inset 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s;
        }

        .login-btn {
            background-color: #28a745;
            color: white;
            margin-bottom: 10px;
        }

        .login-btn:hover {
            background-color: #218838;
        }

        .signup-btn {
            background-color: #007bff;
            color: white;
        }

        .signup-btn:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Cold Storage System</h1>
        <h2>Login</h2>
        <form id="loginForm" method="post" action="a">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="t1" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="t2" required>
            </div>
            <button type="submit" class="login-btn">Login</button>
        </form>
        <button><a href="k.jsp">Sign Up</a></button>
    </div>  
   </body>
</html>
