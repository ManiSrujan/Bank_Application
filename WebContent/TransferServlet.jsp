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
if(un==null||un.equals(""))
{
	
	RequestDispatcher rd=request.getRequestDispatcher("Index.jsp");
	rd.forward(request,response);
	
}
Connection con=null;
Statement st=null;
String s="";
ResultSet rs=null;
try
{
	String user=(String)session.getAttribute("username");
	String rec="";
	int amt=0;
	Cookie ck[]=request.getCookies();
	for(int i=0;i<ck.length;i++)
	{
		if(ck[i].getName().equals("temp"))
			rec=ck[i].getValue();
		if(ck[i].getName().equals("amt"))
			amt=Integer.parseInt(ck[i].getValue());
	}

	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
	st=con.createStatement();
	s="select balance from bal_table where username='"+rec+"'";
	int bal=0;
	rs=st.executeQuery(s);
	if(rs.next())
		bal=Integer.parseInt(rs.getString("balance"));
	bal=bal+amt;
	s="update bal_table set balance='"+String.valueOf(bal)+"' where username='"+rec+"'";
	st.executeUpdate(s);
	
	s="select balance from bal_table where username='"+user+"'";
	rs=st.executeQuery(s);
	if(rs.next())
		bal=Integer.parseInt(rs.getString("balance"));
	bal=bal-amt;
	s="update bal_table set balance='"+String.valueOf(bal)+"' where username='"+user+"'";
	st.executeUpdate(s);
	
	con.close();
	
	Cookie ck1=new Cookie("mail","transfer");
	ck1.setMaxAge(15);
	response.addCookie(ck1);
	response.sendRedirect("TransUpdateServlet.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}

%>
</body>
</html>