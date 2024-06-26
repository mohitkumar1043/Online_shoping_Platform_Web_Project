
<!-- that jsp page show on front of user  after clicking by user login button but user dont found in database -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="cssfiles/signup-style.css" />
<title>Signup</title>
</head>
<body class="body">

   <!-- signup form -->
<div id='container'>
  <div class='signup'>
       <form action="signupaction" method="post"> 
       <input type="text" name="name" placeholder="Enter Name" required>
       <input type="email" name="email" placeholder="Enter Email" required>
       <input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
       <select  name="securityquestion" required> 
         <option value="what is your first car?">what is your first car?</option>
         <option value="what is the name of the town where you were born?">what is the name of the town where you were born? </option>
         <option value="what is the name of your first pet?">what is the name of your first pet? </option>
       </select>
       <input type="text" name="sqanswer" placeholder="Enter Answer" required>
       <input type="password" name="password" placeholder="Enter Password" required>
       <input type="submit" value="signup">
       </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  <!-- receive message from signupAction servlet -->

<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
	%>
	<h1>Successfully Registered !</h1>
<% 
}
%>
<%
if("invalid".equals(msg)){
	%>
<h1>This email id is already use!</h1>
<% 
}
%>
    <h2>Online Shopping</h2>
    <p>it is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>