<html>
<body bgcolor="MediumSeaGreen ">
<br><br>
<h1 align="center" style="color:white;">Appointment Application</h1>

<h1 align="center">
<a href="Patient_home.jsp">Patient Home</a> |
<a href="profile.jsp">Profile</a> |
<a href="apply.jsp">Apply Appointment</a> |
<a href="status.jsp">Status</a> |
<a href="index.html">Logout</a>
<br><br><br>
<%@page import="com.appointment.LoginBean" %>
<%
LoginBean lb =(LoginBean)session.getAttribute("bean");
%>
<%= lb.getUsername() %>
</h1>
</body>
</html>