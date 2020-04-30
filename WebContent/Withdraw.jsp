<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Withdraw</title>
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
.frame-right .Withdraw{
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
/* overriding input styles for withdraw */
.frame-right .Withdraw span:nth-child(1){
	margin-bottom : 53px;
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
<li id="active"><a href="Withdraw.jsp">Withdraw</a></li>
<li id="notactive"><a href="Deposit.jsp">Deposit</a></li>
<li id="notactive"><a href="">Transaction History</a></li>
</ul>
</div>
<div class="frame-right">
<div class="Withdraw">
    <!-- Place Withdraw form action -->
    <form action="CheckBalServlet.jsp" id="f1" method="post">
        <span>
            <h2>Withdraw</h2>
        </span>
        <span>
            <input type="text" placeholder="Amount" name="amt">
        </span>
        <button onclick="document.getElementById('f1').submit();dis();" id="submitbutton">Withdraw</button>
        <span id="wait"></span>
     </form>
</div>
<div></div>
<div class="balance">
     <!-- Place balance form action -->
     <form action="">
        <span>
            <h2>Check Balance</h2>
        </span>
        <span>
            <img src="money-bag.png" alt="">
        </span>
        <span>
            <input type="text" placeholder="Amount" id="bal">
        </span>
        <button onclick="return ex()">Check</button>
    </form>
</div>
</div>
<div class="animate"><img src="short_logo.png" alt="image not loading"></div>
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