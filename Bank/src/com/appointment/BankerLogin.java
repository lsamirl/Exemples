package com.appointment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class BankerLogin extends HttpServlet {
	Connection con = null;
	PreparedStatement ps=null;
	public void init(ServletConfig config) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url="jdbc:mysql://localhost:3306/myfirstsqleexemple";
		String username = "root";
		String password = "Root";
		try {
			con = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password=request.getParameter("password");
		String phone=request.getParameter("mobile");
		long mobile=Long.parseLong(phone);
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		try {
			ps= con.prepareStatement("insert into Banker(username, password, mobile, email, address) values(?,?,?,?,?)");
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setLong(3, mobile);
			ps.setString(4, email);
			ps.setString(5, address);
			int x = ps.executeUpdate();
			if(x!=0) {
				response.sendRedirect("./Banker_login.html");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void destroy() {
		
	}
}
