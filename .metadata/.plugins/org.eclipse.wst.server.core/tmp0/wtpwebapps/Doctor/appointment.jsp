<html>
<body bgcolor="MediumSeaGreen ">
<br><br>
<h1 align="center" style="color:white;">Appointment Application</h1>

<h1 align="center">
<a href="Doctor_home.html">Doctor Home</a> |
<a href="appointment.jsp">Appointment</a> |
<a href="#">Status</a> |
<a href="index.html">Logout</a>

</h1>
<br><br>
<%@page import="java.sql.*" %>
<%@include file= "connection.jsp" %>

<table border="3" width ="1200" height="200" cellpadding="40" align ="center">
<tr><td> ID</td><td> Patient </td><td>Date</td><td>Time</td><td>Specialisation</td><td>Status</td><td>Doctor</td><td>Action</td></tr>

<%
 ps = con.prepareStatement("select*from appointment");
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
<tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td>
<td><%=rs.getString("doa") %></td><td><%=rs.getString("toa") %>
</td><td><%=rs.getString("specialisation") %></td><td><%=rs.getString("Status") %></td>
<td><%=rs.getString("Doctor") %></td>
<td><a href="accept.jsp?id=<%=rs.getInt(1)%>">Accept</td></tr>
	<%
}
%>
</table>
</body>
</html>