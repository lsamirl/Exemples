<%@ include file="connection.jsp"%>

<% 

int aid= Integer.parseInt(request.getParameter("id"));
String doctor=(String)session.getAttribute("doctor");
ps=con.prepareStatement("update appointment set status ='Accepted', doctor=? where aid=?");
ps.setString(1,doctor);
ps.setInt(2,aid);
int x = ps.executeUpdate();
if (x!=0)
	response.sendRedirect("./appointment.jsp?msg=Accepted");



%>