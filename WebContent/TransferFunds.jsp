<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tranfer Funds</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%
String un=(String)session.getAttribute("username");
if(un==null||un.equals(""))
{
	
	RequestDispatcher rd=request.getRequestDispatcher("Index.jsp");
	rd.forward(request,response);
	
}
%>
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
    font-family: 'Poppins', sans-serif;
    display: flex;
    position: absolute;
    top : 50px;
    left: 35%;
    width: 65vw;
    height: 93vh;
}
.frame-right .transfer{
    position: relative;
    top: 100px;
    width: 50%;
    height: 400px;
}
.frame-right div:nth-child(2)::after{
    content: '';
    display: block;
    position: relative;
    top : 100px;
    width: 1px;
    height: 400px;
    background-color: black;
    opacity: 0.4;
}
.frame-right form, .balance>div{
    display: flex;
    height: 100%;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
.frame-right h2{
    position: relative;
    top : 0px;
    font-size: 30px;
    color: #3a4a54;
    text-decoration: underline;
    margin-left: -30px;
    margin-bottom: 45px;
    letter-spacing: 2px;
    opacity: 0.8;
}
.frame-right input{
    padding-left: 10px;
    margin-bottom: 30px;
    border: 0px;
    border-bottom: 1px solid #3a4a54;
    font-size: 25px;
    outline: none;
    width: 100%;
}
.frame-right .balance{
    position: relative;
    top: 100px;
    width: 50%;
    height: 400px;
}
.frame-right img{
    width: 60px;
    height: 60px;
    margin-top: -37px;
    margin-bottom: 30px;
}
.frame-right button{
    height : 70px;
    width : 200px;
    padding : 10px 10px;
    margin-top: 10px;
    background : none;
    font-size : 25px;
    letter-spacing : 0.10em;
    border : 2px solid #e8a348;
    color : #3a4a54;
    transition : background 0.3s,color 0.3s;
    border-radius : 5px;
}
.frame-right button:hover{
    border: 1px solid white;
    background : #e8a348;
    color : white;
    cursor : pointer;
}
</style>
<script>
function ex()
{
	var x=new XMLHttpRequest();
	x.open("POST","BalanceServlet.jsp","True");
	x.onreadystatechange= function(){
		if(this.readyState==4 && this.status==200)
			document.getElementById("bal").value=this.responseText;
	}
	x.send();
	
}
function dis()
{
	document.getElementById("submitbutton").style.display="none";
	document.getElementById("wait").innerHTML="Please wait, your transaction is being processed.";
	}
</script>
</head>
<body>
<div class="frame1">
<div class="frame-left">
<ul>
<li id="notactive"><a href="HomePage.jsp">Welcome</a></li>
<li id="active"><a href="TransferFunds.jsp">Transfer Funds</a></li>
<li id="notactive"><a href="Withdraw.jsp">Withdraw</a></li>
<li id="notactive"><a href="Deposit.jsp">Deposit</a></li>
<li id="notactive"><a href="TransactionHistory.jsp">Transaction History</a></li>
</ul>
</div>
<div class="frame-right">
<div class="transfer">
    <!-- Place transfer form action -->
    <form action="CheckServlet.jsp" id="f1">
        <span>
            <h2>Transfer Funds</h2>
        </span>
        <span>
            <input type="text" placeholder="Account Number" name="accnum">
        </span>
        <span>
            <input type="text" placeholder="Amount" name="amt">
        </span>
        <button onclick="document.getElementById('f1').submit();dis();" id="submitbutton">Transfer</button>
        <span id="wait"></span>
     </form>
</div>
<div></div>
<div class="balance">
     <!-- Place transfer form action -->
     <div>
        <span>
            <h2>Check Balance</h2>
        </span>
        <span>
            <img src="money-bag.png" alt="">
        </span>
        <span>
            <input type="text" id="bal" placeholder="Amount" >
        </span>
        <button onclick="return ex()">Check</button>
    </div>
</div>
</div>
</div>
<div class="header">
<div class="header-options">
<div>
    <a href="">About</a>
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