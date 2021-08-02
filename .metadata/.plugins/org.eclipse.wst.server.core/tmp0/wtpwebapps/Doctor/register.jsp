<%@page import="java.sql.* "%>
<%@ include file ="connection.jsp" %>

<%

String username = request.getParameter("username");
String password=request.getParameter("password");
String phone=request.getParameter("mobile");
long mobile=Long.parseLong(phone);
String email = request.getParameter("email");
String specialisation = request.getParameter("specialisation");


ps= con.prepareStatement("insert into doctor(username, password, mobile, email, specialisation) values(?,?,?,?,?)");
ps.setString(1, username);
ps.setString(2, password);
ps.setLong(3, mobile);
ps.setString(4, email);
ps.setString(5, specialisation);
int Value = ps.executeUpdate();

if(Value !=0) {
	response.sendRedirect("./Doctor_login.html");
	return;}
%>
