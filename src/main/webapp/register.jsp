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
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/resources/main.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <header>
            <a href="/Instagrim/index" ><img src="/Instagrim/resources/logo.jpg" height="70px" display="inline-block" float="left"></a>

            <div class="titlehead">    
                <h1 display="inline">InstaGrim! </h1>
                <h2 display="inline"><i>Your world in Black and White</i></h2>
            </div>
            <%
                LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                if (lg != null) {
                    String UserName = lg.getUsername();
                    if (lg.getlogedin()) {
            %>
            <div class="loginbox">
                <a href="/Instagrim/upload">Upload</a>
                <a>|</a>
                <a href="/Instagrim/Images/<%=lg.getUsername()%>">Your Images</a>
                <a>|</a>
                <a href="/Instagrim/index">Home</a>
                <a>|</a>
                <a href="/Instagrim/login">Profile</a>
                <a>|</a>
                <a href="/Instagrim/logout.jsp">Logout</a>
            </div>
            <% }
                }
            %>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
        </header>       

        <article>
            <h3>Register as user</h3>
            <form method="POST"  action="Register">
                <input type="text" name="nUsername" placeholder="Username"><br>
                <input type="password" name="nPassword" placeholder="Password"><br>
                <input type="text" name="nEmail" placeholder="Email"><br>
                <input type="text" name="nFirst" placeholder="First Name"><br>
                <input type="text" name="nLast" placeholder="Last Name">    
                <br/>
                <input type="submit" value="Register"> 
            </form>
            <%
                if (session.getAttribute("validUser") != null) {
                    if (session.getAttribute("validUser").toString() == "false") {
            %>
            <p>The username has already been taken</p>
            <%
                    }
                }
            %>

        </article>
        <footer>

        </footer>
    </body>
</html>
