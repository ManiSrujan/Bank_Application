<%@page import="java.sql.*" %>
<%
String un=(String)session.getAttribute("username");
String start=request.getParameter("start");
String stop=request.getParameter("stop");
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
	ps=con.prepareStatement("select * from trans where dot >= to_date(?,'yyyy-mm-dd') and dot <= to_date(?,'yyyy-mm-dd') and from_user=? ORDER BY dot");
	ps.setString(1,start);
	ps.setString(2,stop);
	ps.setString(3,un);
	rs=ps.executeQuery();
	String s="";
	while(rs.next())
	{
		s+=rs.getString("to_user")+"@"+rs.getString("date_and_time")+"@"+rs.getString("method")+"@"+rs.getString("amount")+"@"+rs.getString("status")+"@";
	}
	out.write(s);
	con.close();
}
catch(Exception e)
{
	System.out.println(e);
}
%>
