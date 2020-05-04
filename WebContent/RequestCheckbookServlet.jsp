<%
Cookie ck=new Cookie("mail","Checkbook");
ck.setMaxAge(30);
response.addCookie(ck);
response.sendRedirect("MailServlet");
%>