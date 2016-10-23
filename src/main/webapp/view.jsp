<%-- 
    Document   : view
    Created on : 19-Oct-2016, 18:35:22
    Author     : Daniel
--%>

<%@page import="java.util.Iterator"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.Cmts"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.LoggedIn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <%}
            
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
        <div display="inline" float="left">
            <a href="/Instagrim/Image/${location}"><img src="/Instagrim/Image/${location}" height="500px" width="auto"></a>
        </div>
        <br>
        <br>
        <div display="inline" float="right">
            <h2>COMMENTS</h2>
            <table border="1">

                <%
                    java.util.LinkedList<Cmts> lsCmts = (java.util.LinkedList<Cmts>) request.getAttribute("Comments");
                    if (lsCmts == null) {

                %>
                <p>No Comments found</p>
                <%            } else {
                    Iterator<Cmts> iterator;
                    iterator = lsCmts.iterator();
                    while (iterator.hasNext()) {
                        Cmts c = (Cmts) iterator.next();
                %>  
                <tr>
                    <td><a href="/Instagrim/Images/<%=c.getLogin()%>"><%=c.getLogin()%></a></td>
                    <td><%=c.getCommentText()%></td>
                </tr>
                <%
                        }
                    }%>
            </table>
            <%
                if (lg != null) {
                if (lg.getlogedin()) {
            %>
            <form method="POST"  action="Comment">
                <input type="text" name="cText" placeholder="Comment" display="inline">
                </br>                    
                <input type="submit" value="Comment"> 
                <br>                    
            </form>
            <%}
            } else {
            %>
            <p>Please login to add comments</p>

            <%
                    }
            %>

        </div>
    </body>
</html>
