<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
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
                    <a class="registerc" href="/Instagrim/register" >Register</a></li>
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
            <br>
            <br>
        </header>

        <article>
            <h1><%String userName=(request.getAttribute("User")).toString();%><%=userName%>'s  Pics</h1>
            <%
                java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                if (lsPics == null) {
            %>
            <p>No Pictures found</p>
            <%
            } else {
                Iterator<Pic> iterator;
                iterator = lsPics.iterator();
                while (iterator.hasNext()) {
                    Pic p = (Pic) iterator.next();

            %>
            <a href="/Instagrim/View/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><br/><%

                    }
                }
                %>
        </article>
        <footer>

        </footer>
    </body>
</html>
