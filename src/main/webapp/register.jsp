<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
    Author     : Administrator
--%>

<%@page import="uk.ac.dundee.computing.aec.instagrim.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="main.css" />
    </head>
    <body>
        <header>
            <a href="/Instagrim/index" ><img src="logo.jpg" height="70px" display="inline-block" float="left"></a>
            <div class="titlehead">
                <h1>InstaGrim! </h1>
                <h2 display="inline"><i>Your world in Black and White</i></h2>
            </div>
            <%
                LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                if (lg != null) {
                    String UserName = lg.getUsername();
                    if (lg.getlogedin()) {
            %>
            <div class="loginbox">
                <a href="upload">Upload</a>
                <a>|</a>
                <a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a>
            </div>
            <%}
            } else {
            %>
            <div class="loginbox">
                <form method="POST"  action="Login">
                    <input type="text" name="username" placeholder="Username" display="inline">
                    </br>
                    <input type="password" name="password" placeholder="Password" display="inline">
                    <input type="submit" value="Login"> 
                    <br>
                    <a class="registerc" href="register" >Register</a></li>
                </form>
            </div>           
            <%
                }%>
            <br>
            <br>
            <br>
            <br>
            <br>
        </header>       

        <article>
            <h3>Register as user</h3>
            <form method="POST"  action="Register">
                <ul>
                    <%
                        User us = new User();
                    %>
                    <li>User Name <input type="text" name="username"></li>
                    <li>Password <input type="password" name="password"></li>
                    <li>Email <input type="text" name="email"></li>
                    <li>First Name <input type="text" name="first"></li>
                    <li>Last Name <input type="text" name="last"></li>     
                    <li>${validUser}</li>
                </ul>
                <br/>
                <input type="submit" value="Register"> 
            </form>

        </article>
        <footer>

        </footer>
    </body>
</html>
