<%@ page import="java.sql.*"%>
<%@ include file ="connection.jsp" %>
<%
String patient=request.getParameter("patient");
String doa=request.getParameter("doa");
String toa=request.getParameter("toa");
String specialisation=request.getParameter("specialisation");
int id=(Integer)session.getAttribute("ID"); 

ps = con.prepareStatement("insert into appointment(patient, doa, toa, specialisation, id, status, doctor) values(?,?,?,?,?,?,?)");
ps.setString(1, patient);
ps.setString(2, doa);
ps.setString(3, toa);
ps.setString(4, specialisation);
ps.setInt(5, id);
ps.setString(6, "Pending");
ps.setString(7, "Pending");
int x = ps.executeUpdate();
if(x!=0)
	response.sendRedirect("./Patient_home.html");

%>

