<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="stylesheet" href="reg_style.css">
</head>
<body>
    <div class="bg"></div>
    <div class="container">
        <div class="personal">
            <p>Personal Information</p>
            <span>Fullname</span>
            <input type="text" name="fn"/>
            <span>Email-ID</span>
            <input type="email" name="email"/>
            <span>Phone Number</span>
            <input type="text" name="phno"/>
            <span>Address</span> 
            <input type="text" name="addr"/> 
        </div>
        <div class="account">
            <form name="registration">
                <p>Account Information</p>
                <span>Username</span>
                <input type="text" name="un"/>
                <span>Password</span>
                <input type="password" name="pwd"/>
                <span>Confirm</span>
                <input type="password" name="re_pwd"/>
                <input type="radio" name="accept"/>
                <p>I accept the <a href="#" style="font-weight:bold;color:white;">Terms and Conditions</a> of your site.</p>
                <button>Register</button>
                <a href="Index.html">Already a member?Sign in!</a>
            </form>
        </div>
    </div>
</body>
</html>