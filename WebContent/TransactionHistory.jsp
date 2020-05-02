<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Transaction History</title>
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
	top : 15%;
	left : 40%;
    height: 70%;
    width: 60%;
}
.frame-right .dates{
	display : flex;
    width: 60%;
    justify-content: flex-start;
}
.frame-right span{
    border: 1px solid black;
    padding: 5px 0 5px 10px;
    margin-right : 50px;
    width: 40%;
}
.frame-right input[type="date"]{
    border : 0px;
    outline: none;
    text-align: end;
}
.frame-right p{
    display: inline;
    font-weight : bold;
    margin-right: 10px;
}
.frame-right .transaction_table{
    margin-top: 40px;
    width: 90%;
    height: 100%;
}
.frame-right .transaction_table table{
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    border-collapse: collapse;
    width : 100%;
    overflow-y : auto;
    margin-bottom : 100px;
}
.frame-right .transaction_table table,th{
    padding: 10px;
    border: 1px solid black;
}
.frame-right .transaction_table th{
    width: 10px;
    letter-spacing: 1px;
    font-weight : normal;
    background-color: #DADADA;
}
.frame-right .transaction_table td{
    padding: 10px;
    text-align: center;
    width: 10px;
}
</style>
<script>
function ex()
{
	var x=new XMLHttpRequest();
	x.open("POST","BalanceServlet.jsp","True");
	x.onreadystatechange= function(){
		if(this.readyState==4 && this.status==200)
			document.getElementById("bal").innerHTML=this.responseText;
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
<li id="notactive"><a href="TransferFunds.jsp">Transfer Funds</a></li>
<li id="notactive"><a href="Withdraw.jsp">Withdraw</a></li>
<li id="notactive"><a href="Deposit.jsp">Deposit</a></li>
<li id="active"><a href="">Transaction History</a></li>
</ul>
</div>
<div class="frame-right">
<div class="dates">
	<span>
		<p>From : </p>
		<input type="date" name="from">
	</span>
	<span>
		<p>To : </p>
		<input type="date" name="to">
	</span>
</div>

<!-- Table for transaction history goes here-->
<div class="transaction_table">
    <table>
        <tr>
            <th>Date</th>
            <th>Account-ID</th>
            <th>Method</th>
            <th>Amount</th>
            <th>Status</th>
        </tr>
        <!-- sample data starts-->
        <tr>
            <td>23-03-2020</td>
            <td>1236547891</td>
            <td>Deposit</td>
            <td>₹ 2000</td>
            <td>Successful</td>
        </tr>
        <tr>
            <td>23-03-2020</td>
            <td>1236547891</td>
            <td>Withdraw</td>
            <td>₹ 2000</td>
            <td>Successful</td>
        </tr>
        <!-- sample data ends-->
    </table>
</div>

</div>
</div>
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
        <li><a href="CheckBook.jsp">Check Book</a></li>
    </ul>
</div>
<div>
    <a href="">Contact Us</a>
</div>
<div>
    <a href="">LogOut</a>
</div>

</div>
</div>
</body>
</html>