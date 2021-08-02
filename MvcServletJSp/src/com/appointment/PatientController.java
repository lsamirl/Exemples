package com.appointment;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class PatientController extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password=request.getParameter("password");
		
		LoginBean lb= new LoginBean();
		lb.setUsername(username);
		lb.setPassword(password);
		HttpSession hs = request.getSession();
		hs.setAttribute("bean", lb);
		try {
			boolean x = lb.validate(username, password);
			if(x)
				response.sendRedirect("./Patient_home.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	}
