<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="stylesheet" href="reg_style.css">
<script language="Javascript">
function ex()
{
if(document.getElementById("rep").value!=document.getElementById("pw").value){
window.alert("Password doesn't match!");
document.getElementById("rep").value="";
document.getElementById("rep").focus();
}
}

function ex1()
{
	var z=" ";
    var s=document.getElementById("un").value;
	if(s.length<5)
		{window.alert("Username must be be longer that 5 characters!");
		document.getElementById("un").value="";
		document.getElementById("un").focus();
		}
	var x=new XMLHttpRequest();
	x.open("POST","CheckUsername.jsp?username="+s,"True");
	x.onload= function(){
		if(x.readyState==4 && x.status==200)
			z=x.responseText.split("");
		if(z[2]=='t')
		{
			window.alert("Username already taken");
			document.getElementById("un").value="";
			document.getElementById("un").focus();
		}
	}
	x.send();
}

function ex2()
{
var s=document.getElementById("ph").value;
	if(s.length<10||s.length>10)
		{window.alert("Phone Number must contain exactly 10 digits");
		document.getElementById("ph").focus();
		document.getElementById("ph").value="";
		}
}
</script>
</head>
<body>
    <div class="bg"></div>
    <div class="container">
        <div class="personal">
            <p>Personal Information</p>
            <span>Full Name</span>
            <input type="text" name="fname" form="reg" required/>
            <span>Email-ID</span>
            <input type="email" name="email" form="reg" required/>
            <span>Phone Number</span>
            <input type="text" name="phnumber" form="reg" id="ph" onchange="return ex2()" required/>
            <span>Address</span> 
            <input type="text" name="address" form="reg" required/>
        </div>
        <div class="account">
            <form name="registration" id="reg" action="Index.jsp" method="post" autocomplete="off">
                <p>Account Information</p>
                <span>Username</span>
                <input type="text" name="uname" id="un" onchange="return ex1()" required/>
                <span>Password</span>
                <input type="password" name="password" id="pw"  required/>
                <span>Confirm</span>
                <input type="password" name="rep" id="rep" onchange="return ex()" required/>
                <input type="radio" name="accept" required/>
                <p>I accept the <a href="#" style="font-weight:bold;color:white;">Terms and Conditions</a> of your site.</p>
                <button>Register</button>
                <p id="login_link">Already a member?<a href="Index.jsp">Sign in!</a></p>
            </form>
        </div>
    </div>
</body>
</html>