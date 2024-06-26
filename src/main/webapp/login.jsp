

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="cssfiles/signup-style.css">
<title>Login</title>
</head>
<body>
<%
//that is user for prevent(rokana) back botton after logout
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
%>

<div id='container'>
  <div class='signup'>
       <form action="loginaction" method="post">
       <input type="email" name="email" placeholder="Enter Email Address" required>
       <input type="password" name="password" placeholder="Enter Your Password" required>
       
       <input type="submit" value="login">
       </form>
      <h2><a href="singup.jsp">SignUp</a></h2>
       <h2><a href="forgotpassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
String msg=request.getParameter("msg");
  if("invalid".equals(msg)){
		%>
<h1>Some thing Went Wrong! Try Again !</h1>
<% 
}
%>
    <h2>Online Shopping</h2>
    <p> that is allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>