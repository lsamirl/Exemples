package com.appointment;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BankPortal extends HttpServlet {
	Connection connection = null;
	PreparedStatement preStat = null;

	public void init(ServletConfig config) throws ServletException {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("Exception " + e);
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:3306/myfirstsqleexemple";
		String username = "root";
		String password = "Root";
		
		try {
			connection = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String username = request.getParameter("username");
		String password=request.getParameter("password");
		String phone=request.getParameter("mobile");
		long mobile=Long.parseLong(phone);
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		try {
			preStat= connection.prepareStatement("insert into banko(username, password, mobile, email, address) values(?,?,?,?,?)");
			System.out.println("everything");
			preStat.setString(1, username);
			preStat.setString(2, password);
			preStat.setLong(3, mobile);
			preStat.setString(4, email);
			preStat.setString(5, address);
			int Value = preStat.executeUpdate();
			
			if(Value !=0) {
				response.sendRedirect("./Bank_Login.html");
				return;}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	public void destroy() {
	
		
	}
	
}
