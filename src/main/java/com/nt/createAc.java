package com.nt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class createAc extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 
		 String password= req.getParameter("t2");
		 String name = req.getParameter("t1");
		 
		System.out.println(password);
		System.out.println(name);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","root123");
			PreparedStatement s=con.prepareStatement("INSERT INTO user(password,name) values (?,?)");
			 
			s.setString(1,password);
			s.setString(2, name);
			int rs =s.executeUpdate();
		   	System.out.println(rs);
		    if(rs>=1) {
				res.setContentType("text/html");
				String message = "register successfuly";
				 req.setAttribute("uk",message);
		      	 RequestDispatcher rd=req.getRequestDispatcher("errrorSmg.jsp");
		      	 rd.forward(req, res);
				 
			}else {
				 
				String message = "register successfuly";
				 req.setAttribute("uk",message);
		      	 RequestDispatcher rd=req.getRequestDispatcher("errrorSmg.jsp");
		      	 rd.forward(req, res);

				 			}
		} catch (ClassNotFoundException e) {
			 
			e.printStackTrace();
		} catch (SQLException e) {
			 
			
			e.printStackTrace();
		}
	}

}
