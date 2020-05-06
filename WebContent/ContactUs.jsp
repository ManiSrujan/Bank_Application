<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="main.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        h1{
            position: relative;
            top: 100px;
            margin-left: 100px;
            color: #707070;
            letter-spacing: 2px;
            text-decoration: underline;
            text-underline-position: under;
        }
        table{
            color: #707070;
            position: relative;
            top : 150px;
            font-family: 'poppins',sans-serif;
            border-collapse: collapse;
            margin-left: 100px;
            height: 50vh;
            width: 55vw;
            text-align: center;
            border: 1px solid rgba(0,0,0,0.5);
            background-color: rgba(218,218,218,0.1);
        }
        th{
            letter-spacing: 1px;
            font-size: 20px;
        }
        th:nth-child(1){
            padding : auto 50px;
        }
        .contact{
            position: absolute;
            right: 180px;
            top: 320px;
            height: 270px;
            width: 270px;
        }
        .contact img{
            height: 30px;
            width: 30px;
        }
        .contact figure{
            position: absolute;
            cursor: pointer;
            height: 55px;
            width: 55px;
            border: 2px solid #e8a348;
            border-radius: 50%;
            padding: 11px;
        }
        figure:nth-of-type(1){
            top: 0;
            left: 50%;
            transform: translate(-25px,0px);
        }
        figure:nth-of-type(2){
            top: 50%;
            transform: translate(0px,-25px);
            left: 0;
        }
        figure:nth-of-type(3){
            left: 50%;
            transform: translate(-25px,0px);
            bottom: 0;
        }
        figure:nth-of-type(4){
            top: 50%;
            transform: translate(0px,-25px);
            right: 0;
        }
        figcaption{
        	display : none;
        	position : relative;
        	top : -28px;
        	left : 50px;
        	font-family : 'poppins',sans-serif;
        	font-size : 19px;
        	letter-spacing : 1px;
        }
        figure:hover{
        	background-color : #e8a348;
        }
        figure:hover img{
        	filter: invert(100%) sepia(0%) saturate(0%) hue-rotate(327deg) brightness(102%) contrast(105%);
        }
        figure:hover figcaption{
        	display : block;
        	animation-name : slideleft;
        	animation-duration : 0.3s;
        }
        @keyframes slideleft{
        	0% {left:30px;opacity:0;}
        	30% {left:40px;opacity:0;}
        	100% {left:50px;opacity:1;}
        }
    </style>
</head>
<body>
        <header>
            <img class="desktop" src="image.png" alt="Image Load Error" title="Logo">
            <ul>
                <li><a href="Index.jsp">Home</a></li>
                <li><a href="About.jsp">About</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Registration.jsp">Sign Up</a></li>
            </ul>
        </header>
        <main>
            <h1>Details :</h1>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Id.No</th>
                    <th>Email-Id</th>
                    <th>Github</th>
                </tr>
                <tr>
                    <td>Mani Srujan</td>
                    <td>180031211</td>
                    <td>bagganisrujan@gmail.com</td>
                    <td><a href="https://github.com/ManiSrujan" target="_blank">github.com/ManiSrujan</a></td>
                </tr>
                <tr>
                    <td>Rohan B</td>
                    <td>180031230</td>
                    <td>rohan.buggaveeti@gmail.com</td>
                    <td><a href="https://github.com/rohan-buggaveeti" target="_blank">github.com/rohan-buggaveeti</a></td>
                </tr>
                <tr>
                    <td>Thaneesh</td>
                    <td>180031179</td>
                    <td>Email-Id</td>
                    <td>Github</td>
                </tr>
                <tr>
                    <td>Yashwanth</td>
                    <td>180031200</td>
                    <td>Email-Id</td>
                    <td>Github</td>
                </tr>
            </table>
            <div class="contact">
                <figure>
                    <img src="Linkedin.png" alt="">
                    <figcaption>Share</figcaption>
                </figure>
                <figure>
                    <img src="Facebook.png" alt="">
                    <figcaption>Post</figcaption>
                </figure>
                <figure>
                    <img src="Google.png" alt="">
                    <figcaption>Share</figcaption>
                </figure>
                <figure>
                    <img src="Twitter.png" alt="">
                    <figcaption>Tweet</figcaption>
                </figure>
            </div>
        </main>
</body>
</html>