<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>KL Bank</title>
<%-- 
String un=(String)session.getAttribute("username");
if(un==null||un.equals(""))
{
	un="";
}
--%>
<style>
body{
background-color : #FFFFFF;
}
.header img{
position : relative;
top : -70px;
left : 2%;
width : 230px;
height : 230px;
}
.header{
position : absolute;
top : 0%;
left : -1px;
height : 90px;
width : 100%;
box-shadow : 2px 2px 20px black;
}
.header-options{
position : absolute;
bottom : 20%;
left : 57%;
}
.header a{
position : relative;
color : #3a4a54;
left : 20px;
margin-left : 20px;
padding : 5px 0px;
text-decoration : none;
text-transform : uppercase;
font-size : 17px;
font-weight : 700;
letter-spacing: 0.10em;
}
.header a:after{
position : absolute;
bottom : 0;
left : 50%;
width : 0;
content : "";
height : 3.5px;
background : #e8a348;
transition : width 0.3s,left 0.3s;
}
.header a:hover:after{
width : 100%;
left : 0;
}
.frame1 p{
position : absolute;
top : 30%;
left : 8%;
font-size : 40px;
color : #e8a348;
letter-spacing: 0.10em;
text-transform : uppercase;
text-decoration : underline #3a4a54;
text-underline-position: under;
}
.frame1-login{
position : absolute;
height : 350px;
width : 400px;
top : 20%;
right : 8%;
}
.frame1-login span{
position : relative;
display : block;
left : 0;
font-size : 25px;
color : #3a4a54;
margin-left : 5px;
}
.frame1-login input{
position : relative;
width : 300px;
display : block;
font-size : 20px;
font-family : Times New Roman;
left : 0;
border-radius : 7px;
border : 1px solid #3a4a54;
padding : 10px 20px;
margin-top : 10px;
margin-bottom : 20px;	
margin-left : 5px;
outline : none;
opacity : 0.8;
}
.frame1-login input:focus{
border-left : 1.5px solid #3a4a54;
border-right : 1.5px solid #3a4a54;
}
.frame1-login button{
position : relative;
top : 10%;
left : 18%;
height : 50px;
width : 200px;
padding : 10px 10px;
margin-top : 10px;
background : none;
font-size : 25px;
font-family : Times New Roman;
letter-spacing : 0.10em;
border : 2px solid #e8a348;
color : #3a4a54;
transition : background 0.3s,color 0.3s;
border-radius : 5px;
}
.frame1-login button:hover{
background : #e8a348;
color : white;
cursor : pointer;
}
.frame2{
position : absolute;
height : 33%;
width : 100%;
background : #F2F3F4;
top : 67%;
left : 0;
}
.frame2 span{
display : inline-block;
position : relative;
left : 1%;
height : 230px;
width : 360px;
margin-right : 10px;
padding : 0px 50px;
}
.frame2 span h3{
display : inline;
position : absolute;
top : -10px;
left : 35%;
color : #17202A;
font-size : 40px;
text-decoration : underline #e8a348;
text-underline-position: under;
}
.frame2 span p{
position : absolute;
font-family : Open Sans;
top : 40%;
left : 15%;
text-align : center;
font-size : 23px;
}
</style>
</head>
<body>
<div class="header">
<img src="image.png" alt="Image Load Error" title="Logo">
<div class="header-options">
<a href="">Home</a>
<a href="">About</a>
<a href="">Our Services</a>
<a href="">Contact Us</a>
<a href="">Sign up</a>
</div>
</div>
<div class="frame1">
<p>We Strive For Excellence</p>
<div class="frame1-login">
<form name="login" action="">
<span>Username</span>
<input type="text" name="uname" id="uname" value=<%--<%=un %>--%>>
<span>Password</span>
<input type="password" name="pass" id="pass">
<button>Login</button>
</form>
</div>
</div>
<div class="frame2">
<span>
<h3>We Trust.</h3>
<p>Trust builds Confidence.We Trust in our team to present you with better experience.</p>
</span>
<span>
<h3>We Provide.</h3>
<p>We provide you with our best and contemporarily needed services.</p>
</span>
<span>
<h3>We Protect.</h3>
<p>We protect our customers with reliable security to prosper.</p>
</span>
</div>
</body>
</html>