<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%
String accnum=request.getParameter("accnum");
String amt=request.getParameter("amt");
Connection con=null;
PreparedStatement ps=null;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
	ps=con.prepareStatement("select * from bank_op where accnum= ? ");
	ps.setString(1,accnum);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{ 
		String un=rs.getString("username");
		Cookie ck=new Cookie("temp",un);
		Cookie ck1=new Cookie("amt",amt);
		ck.setMaxAge(30);
		ck1.setMaxAge(30);
		response.addCookie(ck);
		response.addCookie(ck1);
		response.sendRedirect("confirm.jsp");
	}
	else
	{
		out.println("<script language='javascript'>alert('Recepient Account Not Found! Please Try Again!');</script>");
		RequestDispatcher rd=request.getRequestDispatcher("TransferFunds.jsp");
		rd.include(request, response);
	}
	con.close();
}
catch(Exception e)
{
	out.println(e);
}

%>
</body>
</html>