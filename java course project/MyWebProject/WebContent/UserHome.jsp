<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>homepage</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="shortcut icon" href="icon.jpg" />
    <%@ page import="java.util.*"%> 
	<%@ page import="java.text.*"%> 
    
  </head>
  
<body background="bg.jpg">
<%  
response.setHeader("Cache-Control","no-store"); //HTTP 1.1  
response.setHeader("Pragma","no-cache"); //HTTP 1.0  
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%> 
  
<div align="right" style="width:100%; height:5%; font-size: 20px;">
<!-- <%=session.getAttribute("username")%> -->

<a href="http://localhost:8080/MyWebProject/Signout.jsp" >Log out</a><br>
</div>

<center>
<h1><font color="#556B2F">Welcome to your homepage</font></h1>

<!-- <%=session.getAttribute("gender")%> -->
<div align="center" style="font-size: 20px">
<h3><font color="#556B2F">Name: <%=session.getAttribute("firstname")%></font><br>
<font color="#556B2F">Birthday: <%=session.getAttribute("bday")%>-<%=session.getAttribute("bmonth")%>-<%=session.getAttribute("byear")%></font><br></h3>
<tr>
<td><font size=20px><a href='startchat.jsp'>Enter the chat room</a></font></td>
<!-- <td><input type="button" value="Start" class="circle" onclick="startchating();"></td> -->
 </tr>
</div>
</center>

</body>
</html>
