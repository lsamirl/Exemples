package com.appointment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class PatientHome extends HttpServlet {
	
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
	public void doPost(HttpServletRequest request , HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password=request.getParameter("password");
		try {
			preStat=connection.prepareStatement("select*from patientDB where username=? and password=?");
			preStat.setString(1, username);
			preStat.setString(2, password);
			ResultSet rs = preStat.executeQuery();
			HttpSession hs=request.getSession();
			
			if(rs.next()) {
				hs.setAttribute("ID", rs.getInt(1));
				hs.setAttribute("username", username);
				response.sendRedirect("Patient_home.html");
			}else {
				response.sendRedirect("Patient_login.html");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
