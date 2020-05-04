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
String un=(String)session.getAttribute("username");
int amt=Integer.parseInt(request.getParameter("amt"));
Cookie ck=new Cookie("amt",String.valueOf(amt));
Connection con=null;
Statement st=null;
ResultSet rs=null;
String s="";
try
{
	int bal=0;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
	st=con.createStatement();
	s="select balance from bal_table where username='"+un+"'";
	rs=st.executeQuery(s);
	
	if(rs.next())
	{
		bal=Integer.valueOf(rs.getString("balance"));
	}
	if(bal<=amt)
	{
		out.println("<script language='javascript'>alert('Insufficient Funds');</script>");
		RequestDispatcher rd=request.getRequestDispatcher("withdraw.jsp");
		rd.include(request,response);
	}
	else
	{
		bal-=amt;
		s="update bal_table set balance='"+String.valueOf(bal)+"' where username='"+un+"'";
		st.executeUpdate(s);
		Cookie ck1=new Cookie("mail","withdraw");
		ck1.setMaxAge(30);
		ck.setMaxAge(30);
		response.addCookie(ck1);
		response.addCookie(ck);
		response.sendRedirect("TransUpdateServlet.jsp");
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