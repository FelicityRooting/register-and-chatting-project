<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>My Web Project</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css" />
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script type="text/javascript" src='script.js'></script>
	<link rel="shortcut icon" href="icon.jpg" />
</head>
<body background="bg.jpg">

<table width="100%" height="30%">
<tr>
<td><h2><font color=#556B2F>Welcome, friend</font></h2></td>
<td width="750px"></td>
<td>

<form method="post" action="http://localhost:8080/MyWebProject/login">
<font color=#556B2F>Username:</font><input type="text" name="username" class="textbox"><br><br>
<font color=#556B2F>Password:</font> <input type="password" name="password" class="textbox">
<input type="submit" value="Login" class="circle" onclick="return checkLogin(this.form);">
</form>
</td>
</tr>
</table>
<center><h3 id="error"></h3></center>

<%
 if(request.getParameter("result")!=null){%>
<center>
<div align="right" style="height:5px; width:1000px">
<b><font color=red>Wrong username or password</font></b>
</div>
</center>
<%} %>

<%
 if(request.getParameter("username")!=null){%>
<center>
<div align="right" style="height:5px; width:1000px">
<b><font color=#556B2F>Username Already Exists! Please try another</font></b>
</div>
</center>
<%} %>

<table width="100%">
<tr>
<!--<td width="800px" align="center"><h1>Welcome!</h1></td>-->
<td><center>
<form method="post" action="http://localhost:8080/MyWebProject/registration">

<h1><font color=#556B2F>Create an Account</font></h1>
<table>
<tr>
<td><font color=#556B2F>First Name</font></td>
<td><input type="text" name="firstname" class="textbox"></td>
</tr>
<tr height="20px">
<td></td>
<td id="firstname"></td>
</tr>
<tr>
<td><font color=#556B2F>Last Name</font></td>
<td><input type="text" name="lastname" class="textbox"></td>
</tr>
<tr height="20px">
<td></td>
<td id="lastname"></td>
</tr>

<tr>
<td><font color=#556B2F>User Name</font></td>
<td><input type="text" autocomplete="off" name="username" id="checkusername" class="textbox"
onkeyup="return checkUsername();"></td>
</tr>

<tr height="20px">
<td></td>
<td id="username"></td>
</tr>

<tr>
<td><font color=#556B2F>Date of Birth :</font></td>
<td>
<select name="bday" class="dob">
<option>Day</option>
<%for(int i=1;i<=31;i++){%>
<option>
<%=i%>
</option>
<%} %>
</select>

<select name="bmonth" class="dob">
<option>Month</option>
<option>Jan</option>
<option>Feb</option>
<option>March</option>
<option>April</option>
<option>May</option>
<option>June</option>
<option>July</option>
<option>Aug</option>
<option>Sept</option>
<option>Oct</option>
<option>Nov</option>
<option>Dec</option>

</select>

<select name="byear" class="dob">
<option>Year</option>
<%for (int i=2013;i>=1930;i--){%>
<option>
<%=i%>
</option>
<%} %>
</select>

</td>
</tr>

<tr height="20px">
<td></td>
<td id="dob"></td>
</tr>


<tr>
<td><font color=#556B2F>Gender</font></td>
<td><font color=#556B2F>Female</font><input type="radio" name="gender" value="Female">
<font color=#556B2F>Male</font><input type="radio" name="gender" value="Male">
<font color=#556B2F>Other</font><input type="radio" name="gender" value="other">
</td>
</tr>

<tr height="20px" >
<td></td>
<td id="gender"></td>
</tr>

<tr>
<td><font color=#556B2F>Password:</font></td>
<td><input type="password" name="password" class="textbox"></td>
</tr>

<tr height="20px">
<td></td>
<td id="password"></td>
</tr>

<tr>
<td><font color=#556B2F>Re-enter your Password:</font></td>
<td><input type="password" name="cpassword" class="textbox"></td>
</tr>

<tr height="20px">
<td></td>
<td id="cpassword"></td>
</tr>

<tr>
<td></td>
<td>
<input type="checkbox" name="terms"><a href="terms&condition.jsp" target="_blank">I agree terms and conditions</a>
 </td>
 </tr>
 
 <tr>
 <td><input type="submit" value="Create" class="circle" onclick="return checkRegistration(this.form);"></td>
 <td><input type="reset" value="Clear" class="circle"></td>
 </tr>

</table>
 </center>
</form>
</td>
</tr>

</table>

<hr>


</body>
</html>