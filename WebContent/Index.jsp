<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KL Bank</title>
    <link rel="stylesheet" href="main.css">
</head>
<% 
String un=(String)session.getAttribute("username");
if(un==null||un.equals(""))
{
	un="";
}
%>
<body>
        <header>
            <img class="desktop" src="image.png" alt="Image Load Error" title="Logo">
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Our Services</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="Registration.jsp">Sign Up</a></li>
            </ul>
        </header>
        <div class="statement">
            <img class="phone" src="short_logo.png" alt="Image Load Error" title="Logo">
            <p>We Strive For Excellence</p>
        </div>
        <div class="login">
            <form class="login-form" name="login" action="LoginServlet.jsp" autocomplete="off">
                <span>
                    <p>Username</p>
                    <input type="text" name="uname" id="uname" value=<%=un %>>
                </span>
                <span>
                    <p>Password</p>
                    <input type="password" name="password" id="pass">
                </span>
                <button>Login</button>
            </form>
        </div>
        <footer>
            <div>
                <p>We Trust.</p>
                <p>We Trust in our team to present you with better experience.</p>
            </div>
            <div>
                <p>We Provide.</p>
                <p>We provide for you the best contemporarily available services.</p>
            </div>
            <div>
                <p>We Protect.</p>
                <p>We protect our customers with reliable security to prosper.</p>
            </div>
        </footer>
</body>
</html>