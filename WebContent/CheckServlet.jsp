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
String anum=(String)session.getAttribute("accid");
String accnum=request.getParameter("accnum");
String amt=request.getParameter("amt");
Connection con=null;
PreparedStatement ps=null;
Statement st=null;
String s="";
int bal=0;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
	ps=con.prepareStatement("select * from bank_op where accnum= ? ");
	ps.setString(1,accnum);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{ 
		
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz"; 
		StringBuilder sb = new StringBuilder(6);   
		for (int i = 0; i < 6; i++) {   
			int index = (int)(AlphaNumericString.length()* Math.random()); 
			sb.append(AlphaNumericString.charAt(index)); 
			}
		
		s="select balance from bal_table where accnum='"+anum+"'";
		st=con.createStatement();
		ResultSet q=st.executeQuery(s);
		if(q.next())
			bal=Integer.parseInt(q.getString("balance"));
		
		if(bal>Integer.parseInt(amt)){
		
		Cookie ck=new Cookie("temp",accnum);
		Cookie ck1=new Cookie("amt",amt);
		Cookie ck2=new Cookie("auth",sb.toString());
		Cookie ck3=new Cookie("mail","otp");
		ck.setMaxAge(110);
		ck1.setMaxAge(110);
		ck2.setMaxAge(50);
		ck3.setMaxAge(20);
		response.addCookie(ck);
		response.addCookie(ck1);
		response.addCookie(ck2);
		response.addCookie(ck3);
		response.sendRedirect("MailServlet");
		}
		else{
			out.println("<script language='javascript'>alert('Insufficient Funds!');</script>");
			RequestDispatcher rd=request.getRequestDispatcher("TransferFunds.jsp");
			rd.include(request, response);
		}
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