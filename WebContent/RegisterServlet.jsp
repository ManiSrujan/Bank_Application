<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*,java.util.Random" %>
<%
String fullname=request.getParameter("fname");
String email=request.getParameter("email");
String username=request.getParameter("uname");
String password=request.getParameter("password");
String phnum=request.getParameter("phnumber");
String address=request.getParameter("address");
String accnum="";

Random r=new Random();
long x=r.nextLong();
String z=String.valueOf(x);
if(z.length()>10)
{       
	if(z.charAt(0)!='-')
        accnum=z.substring(0,12);
    else
        accnum=z.substring(1,13);
}
else{
	 x=r.nextLong();
	 z=String.valueOf(x);
		if(z.charAt(0)!='-')
	        accnum=z.substring(0,12);
	    else
	        accnum=z.substring(1,13);
}
Connection con=null;
PreparedStatement ps=null;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
	ps=con.prepareStatement("insert into bank_op values(?,?,?,?,?,?,?)");
	ps.setString(1,fullname);
	ps.setString(2,email);
	ps.setString(3,username);
	ps.setString(4,password);
	ps.setString(5,phnum);
	ps.setString(6,address);
	ps.setString(7,accnum);
	int i=ps.executeUpdate();
	if(i>0)
	{
		session.setAttribute("username",username);
		response.sendRedirect("login.jsp");
	}
	ps=con.prepareStatement("insert into bal_table values(?,?,'0')");
	ps.setString(1,username);
	ps.setString(2,accnum);
	ps.executeUpdate();
	con.close();
	
	
}
catch(Exception e)
{
	out.println(e);
	response.sendRedirect("register.jsp");
}
%>
</body>
</html>