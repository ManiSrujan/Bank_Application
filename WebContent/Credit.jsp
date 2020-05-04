<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Apply Credit</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet"> 
<style>
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
    width: 60vw;
}
.benefits>h3{
    text-align: center;
    color: #E8A348;
    font-size: 25px;
    font-weight: normal;
    margin: 10px 150px 20px 0px;
    font-family: 'Poppins', sans-serif;;
}
.benefits .inner{
    display: grid;
    height: 70%;
    width: 100%;
    grid-template-columns: 1.1fr 0.9fr;
}
.benefits .inner h4{
    color: #3B314E;
    font-size: 18px;
    font-weight: normal;
}
.benefits .inner img{
    float: left;
    margin-top: 20px;
    height: 40px;
    width: 40px;
}
.benefits .inner ul{
    font-size: 15px;
    margin-top: 15px;
    margin-left: 90px;
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
        <h2>Credit Card</h2>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam nulla dolores eos magni nam praesentium incidunt eaque! Eos perspiciatis, dolores, delectus nisi doloribus voluptate</p>
        <button id="submitbutton" onclick="location.href='RequestATMCardServlet.jsp';dis();">Apply Now</button><br><span id="wait"></span>
    </div>
    <div class="benefits">
        <h3>Benefits</h3>
        <div class="inner">
            <div>
                <h4>Life Style Benefits</h4>
                <img src="lifestyle-benefits.png" alt="">
                <ul>
                    <li>Lorem ipsum dolor sit amet</li>
                    <li>Lorem ipsum dolor sit amet</li>
                </ul>
            </div>
            <div>
                <h4>Travel Benefits</h4>
                <img src="travel-benefits.png" alt="">
                <ul>
                    <li>Lorem ipsum dolor sit amet</li>
                    <li>Lorem ipsum dolor sit amet</li>
                </ul>
            </div>
            <div>
                <h4>Rewards & Service</h4>
                <img src="rewards-and-service.png" alt="">
                <ul>
                    <li>Lorem ipsum dolor sit amet</li>
                    <li>Lorem ipsum dolor sit amet</li>
                </ul>
            </div>
            <div>
                <h4>Safe & Secure</h4>
                <img src="safe-and-secure.png" alt="">
                <ul>
                    <li>Lorem ipsum dolor sit amet</li>
                    <li>Lorem ipsum dolor sit amet</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- Header options -->
<div class="header">
<div class="header-options">
<div>
    <a href="">About</a>
</div>
<div id="hover_nav">
    <a href="">Our Services</a>
    <ul class="hover_nav_content">
        <li><a href="LoanApplication.jsp">Loan Application</a></li>
        <li><a href="Credit.jsp">Credit</a></li>
        <li><a href="CheckBook.jsp">Cheque Book</a></li>
    </ul>
</div>
<div>
    <a href="">Contact Us</a>
</div>
<div>
    <a href="LogoutServlet.jsp">LogOut</a>
</div>

</div>
</div>
</body>
</html>