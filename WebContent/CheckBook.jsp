<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Apply Chequebook</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%String un=(String)session.getAttribute("username");
if(un==null||un.equals(""))
{
	
	RequestDispatcher rd=request.getRequestDispatcher("Index.jsp");
	rd.forward(request,response);
	
} %>
<style>
*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
.header-options{
position : absolute;
top : 3%;
left : 64%;
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
.frame-right{
    position : absolute;
    font-family: 'Poppins', sans-serif;
	top : 15%;
	left : 40%;
    height: 70%;
    width: 60%;
}
.apply{
    height: 40vh;
    width: 50vw;
}
.apply h2{
    font-size: 30px;
    font-weight: 600;
    letter-spacing: 2px;
    color: #E8A348;
}
.apply p{
    margin-top: 10px;
}
.apply button{
    margin-top: 60px;
    width: 180px;
    height: 50px;
    font-size: 20px;
    color: white;
    background-color: #F5821F;
    border: 0px;
    border-radius: 5px;
    cursor: pointer;
}
.apply button:hover{
	background-color : #e8a348;
}
.benefits::before{
    display: block;
    content: "";
    height: 2px;
    width: 55vw;
    background-color: #707070;
    opacity: 0.8;
    margin-left: -30px;
}
.benefits{
    height: 45vh;
    width: 50vw;
}
.benefits>h3{
    text-align: center;
    color: #E8A348;
    font-size: 25px;
    font-weight: normal;
    margin-top: 15px;
    margin-bottom: 20px;
    font-family: 'Poppins', sans-serif;;
}
.benefits ol{
    font-size: 15px;
    line-height: 50px;
    color: #3B314E;
}
</style>
<script>
function dis()
{
	document.getElementById("submitbutton").style.display="none";
	document.getElementById("wait").innerHTML="Please wait, your request is being processed.";
	}</script>
</head>
<body>
<div class="frame1">
<div class="frame-left">
<ul>
<li id="notactive"><a href="HomePage.jsp">Welcome</a></li>
<li id="notactive"><a href="TransferFunds.jsp">Transfer Funds</a></li>
<li id="notactive"><a href="Withdraw.jsp">Withdraw</a></li>
<li id="notactive"><a href="Deposit.jsp">Deposit</a></li>
<li id="notactive"><a href="TransactionHistory.jsp">Transaction History</a></li>
</ul>
</div>
<div class="frame-right">
    <div class="apply">
        <h2>Cheque Book</h2>
        <p>Once you apply for a chequebook, you will receive it in <u>10-15</u> business days. Upon receiving the chequebook, it is your responsibility to read and understand all the terms and rules to be followed while using it. </p>
        <button id="submitbutton" onclick="location.href='RequestCheckbookServlet.jsp';dis();">Apply Now</button><br><span id="wait"></span>
    </div>
    <div class="benefits">
        <h3>Rules</h3>
        <div class="inner">
           <ol>
               <li>The IFSC and MICR codes, predictably are a must on every cheque leaflet.</li>
               <li>All cheques shall carry a standardised watermark, with the words "CTS-INDIA" which can be seen when held against any light source. This would make it difficult for any fraudster to photocopy or print an instrument.</li>
               <li>No changes / corrections should be carried out on the cheques (other than for date validation purposes, if required). For any change in the payee's name, amount in figures or amount in words, etc., fresh cheque forms should be used by customers.</li>
               <li>Payable at par at all branches of the KL Bank.</li>
           </ol>
        </div>
    </div>
</div>

<!-- Header options -->
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
        <li><a href="CheckBook.jsp">Cheque Book</a></li>
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
