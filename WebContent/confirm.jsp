
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EP Bank</title>
<script>
var s=7;
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
<div style="position:absolute;top:35%;left:27%;font-size:25px;height:30%" align="center">
<p>This page will be redirected in <span id="sec"></span> seconds.</p>
<p>You can click the below button to CANCEL the transaction.</p>
<button style="width:30%;height:25%;font-size:25px" onclick="location.href='transfer.jsp'">Cancel</button>
</div>
</body>
</html>