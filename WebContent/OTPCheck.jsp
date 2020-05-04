<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Cookie ck[]=request.getCookies();
String otp="";
for(int i=0;i<ck.length;i++)
{
	if(ck[i].getName().equals("auth"))
		otp=ck[i].getValue();
	if(ck[i].getName().equals("valid"))
		ck[i].setMaxAge(0);
}
String ue=request.getParameter("otp");
if(ue.equals(otp))
{
	Cookie ck1=new Cookie("valid","Successful");
	ck1.setMaxAge(13);
	response.addCookie(ck1);
	response.sendRedirect("TransferServlet.jsp");
}
else
{
	Cookie ck1=new Cookie("valid","Unsuccessful");
	ck1.setMaxAge(13);
	response.addCookie(ck1);
	response.sendRedirect("TransferServlet.jsp");
}
%>