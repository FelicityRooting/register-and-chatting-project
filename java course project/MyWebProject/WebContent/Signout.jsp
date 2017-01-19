<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>Sign out</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script type="text/javascript" src="script.js"></script>
    <link rel="shortcut icon" href="icon.jpg" />

  </head>
  
  <body background="bg.jpg">
<% session.invalidate();%>
<center>
<h1>You are currently Signed out<br>
<a href="http://localhost:8080/MyWebProject/index.jsp">Login</a> to continue..
</h1>
</center>
  </body>
</html>
