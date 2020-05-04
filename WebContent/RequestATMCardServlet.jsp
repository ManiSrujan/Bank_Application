<%
Cookie ck=new Cookie("mail","Card");
ck.setMaxAge(30);
response.addCookie(ck);
response.sendRedirect("MailServlet");
%>