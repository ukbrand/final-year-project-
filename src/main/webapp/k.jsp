<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        /* Google Font */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #007bff, #00ccff);
        }

        .login-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 350px;
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
            font-weight: bold;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }

        .buttons {
            margin-top: 20px;
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
            margin-bottom: 10px;
        }

        .login-btn {
            background-color: #28a745;
            color: white;
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

        /* Link Button */
        .link-btn {
            text-decoration: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            display: block;
            padding: 1px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form id="loginForm" method="post" action="as">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="t1" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="t2" required>
            </div>
            <button type="submit" class="login-btn">Submit</button>
        </form>

        <!-- Back to Login Button -->
        <button class="signup-btn">
            <a href="index.jsp" class="link-btn">Back to Login</a>
        </button>
    </div>
</body>
</html>
