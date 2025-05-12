package com.nt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class login extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("t1");
        String password = req.getParameter("t2");

        System.out.println("User input name: " + name);
        System.out.println("User input password: " + password);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "root123")) {
                PreparedStatement ps = con.prepareStatement("SELECT name, password FROM user");
                ResultSet rs = ps.executeQuery();
                
                boolean isValidUser = false;
                while (rs.next()) {
                    String dbName = rs.getString("name");
                    String dbPassword = rs.getString("password");
                    
                    if (name.equals(dbName) && password.equals(dbPassword)) {
                        isValidUser = true;
                        break;
                    }
                }
                
                if (isValidUser) {
                    RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
                    rd.forward(req, res);
                } else {
//                    res.setContentType("text/html");
//                    res.getWriter().println("<script>");
//                    res.getWriter().println("alert('Incorrect username or password. Please try again.');");
//                    res.getWriter().println("window.location.href='index.jsp';");
//                    res.getWriter().println("</script>");
                	
                	
                	String message = "Incorrect username or password. Please try again.";
                	req.setAttribute("uk",message);
                	RequestDispatcher rd=req.getRequestDispatcher("ktm.jsp");
                	rd.forward(req, res);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            res.setContentType("text/html");
            res.getWriter().println("<p>Error fetching user data.</p>");
        }
    }
}
