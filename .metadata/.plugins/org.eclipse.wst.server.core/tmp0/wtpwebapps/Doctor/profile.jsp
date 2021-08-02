<html>
<body bgcolor="MediumSeaGreen ">
<br><br>
<h1 align="center" style="color:white;">Appointment Application</h1>

<h1 align="center">
<a href="Patient_home.html">Patient Home</a> |
<a href="profile.jsp">Profile</a> |
<a href="#">Appointment</a> |
<a href="#">Status</a> |
<a href="index.html">Logout</a>
</h1>
<br><br><br>

<%@page import="java.sql.*" %>
<%@include file= "connection.jsp" %>

<table border="3" width ="300" height="200" cellpadding="20" align ="center">
<tr><td>Patient ID</td><td> username</td><td>Email</td><td>Phone</td><td>Address</td></tr>

<%
int id=(Integer)session.getAttribute("ID");
ps = con.prepareStatement("select*from patientdb where id=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td>
<td><%=rs.getString("email") %></td><td><%=rs.getString("mobile") %>
</td><td><%=rs.getString("address") %></td></tr>
	<%
}
%>
</table>
</body>
</html>