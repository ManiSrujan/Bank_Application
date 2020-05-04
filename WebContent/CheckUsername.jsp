<%@page import="java.sql.*" %>
<%
String u=request.getParameter("username");
Connection con=null;
PreparedStatement ps=null;
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
ps=con.prepareStatement("select * from bal_table where username=?");
ps.setString(1,u);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	out.print("true");
}
con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>