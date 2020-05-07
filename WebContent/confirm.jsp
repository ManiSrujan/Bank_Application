<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EP Bank</title>
<%
Cookie ck=new Cookie("valid","Cancelled");
ck.setMaxAge(65);
response.addCookie(ck);
%>
<script>
var s=60;
var cancel=false;
document.addEventListener('contextmenu', event => event.preventDefault());

function ex()
{
s=s-1
if(s>-1)
document.getElementById("sec").innerHTML=s;
else
{if(cancel==false)	
document.getElementById("can").click();}
}

setInterval(function(){ex();},1000)

function dis(q)
{
	if(q.equals('sub')){
		document.getElementById("submitbutton").style.display="none";
	document.getElementById("wait").innerHTML="Please wait, your transaction is being processed.";
	}
	else
		{
		document.getElementById("can").style.display="none";
		document.getElementById("wait").innerHTML="Please wait, your transaction is being cancelled.";
		}
}
function vanquish()
{
	document.getElementById("otp").style.display="none";
	setTimeout(function(){document.getElementById("otp").style.display="block";},5000);
	}
</script>
</head>
<body onload="vanquish()">
<p align="center">Your Transaction is being processed.</p>
<div style="position:absolute;top:27%;left:30%;font-size:25px;height:30%;width:40%" align="center">
<p>Please enter the OTP sent to your registered email to complete your transaction.</p>
<form action="OTPCheck.jsp" method="post">
<input type="password" name="otp" id="otp" style="width:40%;height:20%;font-size:15px;"><br><br>
<input type="submit" value="Submit OTP" id="submitbutton" onclick="dis('sub')" style="width:30%;height:25%;font-size:25px">
<span id="wait"></span>
</form>
<button style="position:relative;width:30%;height:25%;font-size:20px" id="can" onclick="cancel=true;location.href='TransferServlet.jsp'">Cancel Transaction</button>
<p>This page will expire in <u><span id="sec"></span></u> seconds.</p>
</div>
</body>
</html>