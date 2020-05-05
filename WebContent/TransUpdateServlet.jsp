<%@page import="java.sql.Date"%>
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
String un=(String)session.getAttribute("accid");
String pwd=(String)session.getAttribute("password");
PreparedStatement ps=null;
Connection con=null;
ResultSet rs=null;
Cookie ck[]=request.getCookies();
String z="",amt="Null",rec="Self",status="";
for(int i=0;i<ck.length;i++)
{
	if(ck[i].getName().equals("mail"))
		z=ck[i].getValue();
	if(ck[i].getName().equals("temp"))
		rec=ck[i].getValue();
	if(ck[i].getName().equals("amt"))
		amt=ck[i].getValue();
	if(ck[i].getName().equals("valid"))
		status=ck[i].getValue();
}
java.util.Date date=new java.util.Date();  
java.sql.Date sdate=new java.sql.Date(date.getTime());
if(z.equals("deposit")||z.equals("withdraw"))
	status="Successful";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
	ps=con.prepareStatement("insert into trans values(?,?,?,?,?,?,?)");
	ps.setString(1,un);
	ps.setString(2,rec);
	ps.setString(3,date.toString());
	ps.setString(4,z);
	ps.setString(5,amt);
	ps.setDate(6,sdate);
	ps.setString(7,status);
	ps.executeUpdate();
	response.sendRedirect("MailServlet");
	con.close();
}
catch(Exception e)
{
	out.println(e);
}

%>
</body>
</html>