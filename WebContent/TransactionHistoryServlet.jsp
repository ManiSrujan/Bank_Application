<%@page import="java.sql.*" %>
<%
String un=(String)session.getAttribute("accid");
String start=request.getParameter("start");
String stop=request.getParameter("stop");
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
	ps=con.prepareStatement("select distinct * from trans where dot >= to_date(?,'yyyy-mm-dd') and dot <= to_date(?,'yyyy-mm-dd') and from_user=? or to_user=? ORDER BY date_and_time DESC");
	ps.setString(1,start);
	ps.setString(2,stop);
	ps.setString(3,un);
	ps.setString(4,un);
	rs=ps.executeQuery();
	String s="";
	while(rs.next())
	{
		if(rs.getString("method").equals("transfer")){
		s+=rs.getString("to_user")+"@"+rs.getString("date_and_time")+"@"+rs.getString("method")+"@"+rs.getString("amount")+"@"+rs.getString("status")+"@";
		}
		else
		{
			s+=rs.getString("from_user")+"@"+rs.getString("date_and_time")+"@"+rs.getString("method")+"@"+rs.getString("amount")+"@"+rs.getString("status")+"@";
		}
	}
	out.write(s);
	con.close();
}
catch(Exception e)
{
	System.out.println(e);
}
%>
