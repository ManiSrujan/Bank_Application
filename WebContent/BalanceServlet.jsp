
<%@page import="java.sql.*" %>
<%
String un=(String)session.getAttribute("username");
String pd=(String)session.getAttribute("password");
String balance="something";
String name="";
name=request.getParameter("name");

try{
	String q="";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
if(name!=null)
{
	q="select fullname from bank_op where username='"+un+"'";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(q);
	if(rs.next())
	name=rs.getString("fullname");
	out.write(name);
}
else{
	PreparedStatement ps=con.prepareStatement("select * from bal_table where username=?");
	ps.setString(1,un);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	balance=rs.getString("balance");
	out.write("Rs. "+balance);
	}
con.close();
}
catch(Exception e)
{
System.out.println(e);
}
%>
