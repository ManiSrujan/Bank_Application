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
String un=(String)session.getAttribute("username");
String pwd=(String)session.getAttribute("password");
Statement st=null;
PreparedStatement ps=null;
Connection con=null;
String s="";
Cookie ck[]=request.getCookies();
String z="",amt="Null",rec="Self",status="Successful";
for(int i=0;i<ck.length;i++)
{
	if(ck[i].getName().equals("mail"))
		z=ck[i].getValue();
	if(ck[i].getName().equals("temp"))
		rec=ck[i].getValue();
	if(ck[i].getName().equals("amt"))
		amt=ck[i].getValue();
	if(ck[i].getName().equals("vaild"))
		status=ck[i].getValue();
}
java.util.Date date=new java.util.Date();  
java.sql.Date sdate=new java.sql.Date(date.getTime());


try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
	st=con.createStatement();
	if(rec.equals("Self"))
	{
	s="select accnum from bal_table where username='"+un+"'";
	ResultSet rs=st.executeQuery(s);
	rec=rs.getString("accnum");
	}
	else{
		ps=con.prepareStatement("insert into trans values(?,?,?,?,?,?)");
		ps.setString(1,rec);
		ps.setString(2,date.toString());
		ps.setString(3,z);
		ps.setString(4,amt);
		ps.setDate(5,sdate);
		ps.setString(6,status);
		ps.executeUpdate();
	}
	con.close();
	response.sendRedirect("MailServlet");
}
catch(Exception e)
{
	out.println(e);
}

%>
</body>
</html>