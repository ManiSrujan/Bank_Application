<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String p=request.getParameter("p");
String t=request.getParameter("t");
String r=request.getParameter("r");
float amount=Float.valueOf(p);
float interest=Float.valueOf(r)/100/12;
float time=Float.valueOf(t)*12;
float x = (float)Math.pow(1 + interest, time);
float monthly = Math.round(((amount*x*interest)/(x-1))*100.0f)/100.0f;
float total=Math.round((monthly * time)*100.0f)/100.0f;
float totalinterest=Math.round(((monthly*time)-amount)*100.0f)/100.0f;
String m=String.valueOf(monthly);
String tot=String.valueOf(total);
String toti=String.valueOf(totalinterest);
Cookie ck=new Cookie("mail","Loan");
Cookie ck1=new Cookie("principal",p);
Cookie ck2=new Cookie("time",t);
Cookie ck3=new Cookie("rate",r);
Cookie ck4=new Cookie("monthly",m);
Cookie ck5=new Cookie("total",tot);
Cookie ck6=new Cookie("totalint",toti);
ck.setMaxAge(30);
ck1.setMaxAge(30);
ck2.setMaxAge(30);
ck3.setMaxAge(30);
ck4.setMaxAge(30);
ck5.setMaxAge(30);
ck6.setMaxAge(30);
response.addCookie(ck);
response.addCookie(ck1);
response.addCookie(ck2);
response.addCookie(ck3);
response.addCookie(ck4);
response.addCookie(ck5);
response.addCookie(ck6);
response.sendRedirect("MailServlet");

%>
</body>
</html>