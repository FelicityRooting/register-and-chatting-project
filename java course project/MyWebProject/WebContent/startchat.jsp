 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <%String username=(String)session.getAttribute("username"); %>
    <%String firstname=(String)session.getAttribute("firstname"); %>

    <head>
        <link rel="stylesheet" type="text/css" href="style2.css">
        <script type="text/javascript" src="check.js"></script>
        <title>The Chat Room</title>
    <link rel="shortcut icon" href="icon.jpg" />
    <script>
     setInterval(reloaddata, 3000);
    </script>        
    </head>

    <body background="bg.jpg">
        <p id="result"></p>
        <font color="#556B2F" size=30px>Welcome, <%=username%></font>
        <div class="logout-div" align="right"><a href="Signout.jsp" class="logout-chat">Logout</a></div>
        <div id="list">
            <div id="content">
            </div>
            <input style="display: none" type="text" id="u" value="<%=username%>">						
            <textarea id='h' style="width: 100%; height: 10%;"></textarea>
            <input type="button" value="send" onclick="addText()" />
        </div>
    </body>


</html>