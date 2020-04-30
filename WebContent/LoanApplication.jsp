<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Application</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<%
/*String un=(String)session.getAttribute("username");
if(un==null||un.equals(""))
{
	
	RequestDispatcher rd=request.getRequestDispatcher("Index.jsp");
	rd.forward(request,response);
	
}*/
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
.header a{
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
.frame-right form{
    display: flex;
    height: 100%;
    flex-direction: column;
    align-items: center;
    justify-content: space-around;
}
.frame-right h2{
    position: relative;
    top : 0px;
    font-size: 30px;
    color: #3a4a54;
    text-decoration: underline;
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
	display: flex;
    height: 100%;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
.frame-right .balance p{
    margin-top: 10px;
}
.frame-right .balance span{
    margin-bottom: 0px;
}
.frame-right .balance span:nth-of-type(1){
    margin-left: 50px;
}
.frame-right img{
    width: 60px;
    height: 60px;
    margin-top: -37px;
    margin-bottom: 30px;
}
.frame-right button{
    height : 60px;
    width : 190px;
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
function dis()
{
	document.getElementById("submitbutton").style.display="none";
	document.getElementById("wait").innerHTML="Please wait, your transaction is being processed.";
	}
function calculate() 
{
	  var amount = document.getElementById("amount");
	  var apr = document.getElementById("apr");
	  var years = document.getElementById("years");
	  var payment = document.getElementById("payment");
	  var total = document.getElementById("total");
	  var totalinterest = document.getElementById("totalinterest");
	 
	var principal = parseFloat(amount.value);
	var interest = parseFloat(apr.value) / 100 / 12;
	var payments = parseFloat(years.value) * 12;
	  
	var x = Math.pow(1 + interest, payments); //Math.pow computes powers
	var monthly = (principal*x*interest)/(x-1);


	if (isFinite(monthly)){
	  payment.value = monthly.toFixed(2);
	  total.value = (monthly * payments).toFixed(2);
	  totalinterest.value = ((monthly*payments)-principal).toFixed(2);
	}
	
}
</script>
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
<div class="transfer">
    <!-- Place Loan form action -->
    <form action="LoanApplicationServlet.jsp" id="f1" autocomplete="off" method="post">
        <span>
            <h2>Loan EMI Calculator</h2>
        </span>
        <span>
            <input type="text" placeholder="Amount(Rs.)" name="p" id="amount" onchange=" return calculate();" nmouseout=" return calculate()" required >
        </span>
        <span>
            <input type="text" placeholder="Annual Interest(%)" name="r" id="apr" onchange="return calculate();" nmouseout=" return calculate()" required >
        </span>
		<span>
            <input type="text" placeholder="Repayment Period(Yrs)" name="t" id="years" onchange=" return calculate();" onmouseout=" return calculate()" required >
        </span>
     </form>
</div>
<div></div>
<div class="balance" >
		<span>
            <h2>Approximate Payment</h2>
        </span>
        <span>
            <p>Monthly of:</p>
            <input readonly type="text" id="payment" name="pay" form="f1" >
        </span>
		<span>
            <p>Total amount:</p>
            <input readonly type="text" id="total" name="tamt" form="f1" >
        </span>
		<span>
            <p>Total Interest:</p>
            <input readonly type="text" id="totalinterest" name="tint" form="f1">
        </span>
        <button onclick="document.getElementById('f1').submit();dis();" id="submitbutton">Confirm</button>
</div>
</div>
<div class="header">
<div class="header-options">
<a href="">About</a>
<a href="">Our Services</a>
<a href="">Contact Us</a>
<a href="">LogOut</a>
</div>
</div>
</body>
</html>