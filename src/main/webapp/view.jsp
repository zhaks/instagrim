<%-- 
    Document   : view
    Created on : 19-Oct-2016, 18:35:22
    Author     : Daniel
--%>

<%@page import="uk.ac.dundee.computing.aec.instagrim.lib.Convertors"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Intsagrim/main.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <a>|</a>
                <a href="index">Home</a>
                <a>|</a>
                <a href="login">Profile</a>
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
                }
            %>
            <br>
            <br>
            <br>
            <br>
            <br>
        </header>
        <a href="/Instagrim/Image/${location}"><img src="/Instagrim/Image/${location}" height="500px" width="auto"></a>
    </body>
</html>
