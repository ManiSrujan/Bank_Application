<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Cookie ck[]=request.getCookies();
String op="";
for(int i=0;i<ck.length;i++)
{
	if(ck[i].getName().equals("auth"))
		{
		op=ck[i].getValue();
		ck[i].setMaxAge(0);
		response.addCookie(ck[i]);
		}
	
}
String ue=String.valueOf(request.getParameter("otp"));
if(ue.equals(op))
{
	for(int i=0;i<ck.length;i++)
	{
		if(ck[i].getName().equals("valid"))
		{
		ck[i].setValue("Successful");
		ck[i].setMaxAge(40);
		response.addCookie(ck[i]);
		}
	}
	response.sendRedirect("TransferServlet.jsp");
}
else
{
	for(int i=0;i<ck.length;i++)
	{
		if(ck[i].getName().equals("valid"))
		{
		ck[i].setValue("Unsuccessful");
		ck[i].setMaxAge(40);
		response.addCookie(ck[i]);
		}
	}
	response.sendRedirect("TransferServlet.jsp");
	System.out.println(ue+" "+op);
}
%>