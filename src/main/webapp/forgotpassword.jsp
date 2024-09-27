
<!-- that jsp page calling after clicking by user forgot password button -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="cssfiles/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  
     <form action="forgotpasswordaction" method="post">
        <input type="email" name="email" placeholder="Enter Email Address" required>
       <input type="number" name="number" placeholder="Enter Your Mobile Number" required>
       <select  name="securityquestion"  required> 
           
         <option value="what is your first car?">what is your first car?</option>
         <option value="what is the name of the town where you were born?">what is the name of the town where you were born? </option>
         <option value="what is the name of your first pet?">what is the name of your first pet? </option>
       </select>
       <input type="text" name="sqanswer" placeholder="Enter Answer" required>
       <input type="password" name="newpassword" placeholder="Enter New Password" required>
       
       <input type="submit" value="Save">
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  
  <!-- receive messages from forgotpasswordaction servlet -->
  
  <%
String msg=request.getParameter("msg");
if("done".equals(msg)){
	%>
	<h1>Password Changed Successfully!</h1>
<% 
}
%>
<%
if("invalid".equals(msg)){
	%>
<h1>Some thing Went Wrong! Try Again !</h1>
<% 
}
%>
  
  <%
if("notstrong".equals(msg)){
	%>
<h1>Enter Strong Password!</h1>
<% 
}
%> 


    <h2>Online Shopping</h2>
    <p>that is allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>