<%@page import="java.sql.* "%>
<%@ include file ="connection.jsp" %>

<%
String username = request.getParameter("username");
String password=request.getParameter("password");

ps= con.prepareStatement("select * from doctor where username=? and password=?");
ps.setString(1, username);
ps.setString(2, password);
ResultSet rs = ps.executeQuery();
if(rs.next()){
	session.setAttribute("doctor", username);
	session.setAttribute("specialisation", rs.getString("specialisation"));
	response.sendRedirect("./Doctor_home.html");
}else{
	response.sendRedirect("./Doctor_login.html");
}
%>