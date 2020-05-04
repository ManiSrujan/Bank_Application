<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EP Bank</title>
<%
Cookie ck=new Cookie("valid","Cancelled");
ck.setMaxAge(12);
response.addCookie(ck);
%>
<script>
var s=60;
document.addEventListener('contextmenu', event => event.preventDefault());

function ex()
{
s=s-1
if(s>-1)
document.getElementById("sec").innerHTML=s;
else
window.location.assign("TransferServlet.jsp");
}

setInterval(function(){ex();},1000)
</script>
</head>
<body>
<p align="center">Your Transaction is being processed.</p>
<div style="position:absolute;top:27%;left:30%;font-size:25px;height:30%;width:40%" align="center">
<p>Please enter the OTP sent to your registered email to complete your transaction.</p>
<form action="OTPCheck.jsp" method="post">
<input type="password" name="otp" id="otp" style="width:40%;height:20%;font-size:15px;"><br><br>
<input type="submit" value="Submit OTP" style="width:30%;height:25%;font-size:25px">
</form>
<button style="position:relative;width:30%;height:25%;font-size:20px" onclick="location.href='TransferServlet.jsp'">Cancel Transaction</button>
<p>This page will expire in <u><span id="sec"></span></u> seconds.</p>
</div>
</body>
</html>