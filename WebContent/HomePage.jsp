<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@page import="java.sql.*" %>
<%
String un=(String)session.getAttribute("username");
if(un==null||un.equals(""))
{
	
	RequestDispatcher rd=request.getRequestDispatcher("Index.jsp");
	rd.forward(request,response);
	
}
%>
<title>Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body{
background : #FFFFFF;
}
*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
.header-options{
position : absolute;
top : 3%;
left : 65%;
}
.header-options>div{
    display: inline;
}
.header div>a{
position : relative;
color : #3a4a54;
left : 20px;
margin-left : 20px;
padding : 5px 0px;
text-decoration : none;
text-transform : uppercase;
font-size : 15px;
font-weight : bold;
font-family : Arial;
letter-spacing: 0.12em;
}
.header div>a:after{
position : absolute;
bottom : 0;
left : 50%;
width : 0;
content : "";
height : 3.5px;
background : #e8a348;
transition : width 0.3s,left 0.3s;
}
.header div>a:hover:after{
width : 100%;
left : 0;
}
.hover_nav_content{
    position: absolute;
    left:125px;
    display: none;
    border: 1px solid black;
}
.hover_nav_content li{
    height: 100%;
    width: 100%;
    list-style: none;
    padding: 10px 30px 10px 0px;
    border-bottom: 1px solid black;
}
.hover_nav_content a{
    font-family : Arial;
    font-size: 15px;
    text-decoration: none;
    color: #3a4a54;
    margin-left: 15px;
}
.hover_nav_content li:hover{
    background-color: #DADADA;
}
#hover_nav:hover .hover_nav_content{
    display: block;
}
.frame1{
position : absolute;
top : 0;
left : 0px;
height : 100%;
width : 100%;
background : #FFFFFF;
}
.frame-left{
position : fixed;
left : 0;
top : 0px;
width : 35%;
height : 100%;
background : #3B314E;
}
.frame-left ul{
position : relative;
top : 100px;
list-style : none;
}
.frame-left li{
position : relative;
font-family : Arial;
font-weight : bold;
text-align : right;	
top : 60px;
right : 15%;
margin-bottom : 40px;
letter-spacing : 0.15em;
line-height : 4em;
opacity : 0.2;
}
.frame-left a{
text-decoration : none;
position : relative;
font-size : 15px;
color : #FFFFFF;
text-transform : uppercase;
}
.frame-left li:after{
position : absolute;
content : "";
bottom : 10px;	
right : 0;
width : 80%;
height : 2px;
background : #FFFFFF;
}
#active{
opacity:0.9;
}
#active:after{
opacity : 0.6;
}
#notactive:after{
opacity : 0.3;
}
#notactive:hover{
opacity : 0.4;
}
.whole{
position : absolute;
text-align : center;
top : 45%;
left: 43%;
width : 50em;
}
.whole div,.last_text {
  color : #3B314E;
  display : inline-block;
  font-family : Arial;
  letter-spacing : 0.10em;
  font-size : 50px;
  overflow:hidden;
}
.first_text{ 							
  animation: showup 5s 1;
  animation-fill-mode : forwards;
}
.middle_text {
  animation: reveal 5s 1;
  animation-fill-mode : forwards;
}
.middle_text span {
  animation: slidein 5s 1;
  animation-fill-mode : forwards;
}
.last_text{
display : inline-block;
position : absolute;
top : 45%;
left : 800px;
opacity : 0;
animation: showup2 5s 1;
animation-delay : 5s;
animation-fill-mode : forwards;
}
@keyframes showup {
    0% {opacity:0;}
    20% {opacity:1;}
    80% {opacity:1;}
    100% {opacity:0;}
}
@keyframes showup2 {
    0% {opacity:0;}
    20% {opacity:1;}
    100% {opacity:1;}
}
@keyframes slidein {
    0% {margin-left:-800px;}
    20% { margin-left:-800px;}
    35% { margin-left:-100px;}
    100% { margin-left:-100px;}
}

@keyframes reveal {
    0% {opacity:0;width:0px;}
    20% {opacity:1;width:0px;}
    30% {width:355px;}
    80% {opacity:1;}
    100% {opacity:0;width:355px;}
}
</style>
<script>
function name(){
	var x=new XMLHttpRequest();
	x.open("POST","BalanceServlet.jsp?name=true","True");
	x.onload = function(){
		if(x.status==200 && x.readyState==4)
			document.getElementById("name").innerHTML="Hi, "+this.responseText;
	};
	x.send();
}</script>
</head>
<body onload="return name()">
<div class="frame1">
<div class="frame-left">
<ul>
<li id="active"><a href="HomePage.jsp">Welcome</a></li>
<li id="notactive"><a href="TransferFunds.jsp">Transfer Funds</a></li>
<li id="notactive"><a href="Withdraw.jsp">Withdraw</a></li>
<li id="notactive"><a href="Deposit.jsp">Deposit</a></li>
<li id="notactive"><a href="TransactionHistory.jsp">Transaction History</a></li>
</ul>
</div>
<div class="frame-right">
<div class="whole">
<div class="first_text" style="color:#e8a348;">The World</div>
<div class="middle_text"><span> is Open.</span></div>
</div>
<div class="last_text">
<span id="name"></span>
</div>
</div>
</div>
<div class="header">
<div class="header-options">
<div>
    <a href="About.jsp" target="_blank">About</a>
</div>
<div id="hover_nav">
    <a href="">Our Services <i class="fa fa-caret-down"></i></a>
    <ul class="hover_nav_content">
        <li><a href="LoanApplication.jsp">Loan Application</a></li>
        <li><a href="Credit.jsp">Credit</a></li>
        <li><a href="CheckBook.jsp">Check Book</a></li>
    </ul>
</div>
<div>
    <a href="ContactUs.jsp" target="_blank">Contact Us</a>
</div>
<div>
    <a href="LogoutServlet.jsp">LogOut</a>
</div>
</div>
</div>
</body>
</html>