<%@page import="java.sql.* "%>
<%
Connection con  = null;
PreparedStatement ps = null;

Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/myfirstsqleexemple";
String user = "root";
String pass = "Root";
con  = DriverManager.getConnection(url, user, pass);
%>