<html>
<body bgcolor="MediumSeaGreen ">
<br><br>
<h1 align="center" style="color:white;">Appointment Application</h1>

<h1 align="center">
<a href="Patient_home.html">Patient Home</a> |
<a href="profile.jsp">Profile</a> |
<a href="apply.jsp">Appointment</a> |
<a href="status.jsp">Status</a> |
<a href="index.html">Logout</a>
</h1>
<br><br><br>

<%@page import="java.sql.*" %>
<%@include file= "connection.jsp" %>

<table border="3" width ="1200" height="200" cellpadding="40" align ="center">
<tr><td> ID</td><td> Patient </td><td>Date</td><td>Time</td><td>Specialisation</td><td>Status</td><td>Doctor</td></tr>

<%
int id=(Integer)session.getAttribute("ID");
ps = con.prepareStatement("select*from appointment where aid=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td>
<td><%=rs.getString("doa") %></td><td><%=rs.getString("toa") %>
</td><td><%=rs.getString("specialisation") %></td><td><%=rs.getString("Status") %></td>
<td><%=rs.getString("Doctor") %></td></tr>


	<%
}
%>
</table>
</body>
</html>