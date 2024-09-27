<!--  this page called after cliking by user on changepassword link  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="changedetailsheader.jsp" %>
    <%@ include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="cssfiles/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Password</title>
<style type="text/css">
h3{
color: black;

}
.alert{
color:red;
}

</style>

</head>
<body>
<%
  // that is user for prevent(rokana) back botton after logout
   response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

 // if any user without using login id and password  and  withe help of copy url  came on this page that is  sended user on login page
   if(session.getAttribute("email")==null){
	   response.sendRedirect("login.jsp");
   }
%>

<%
String msg=request.getParameter("msg");
if("notMatch".equals(msg)){

%>
<h3 class="alert">New password and Confirm password does not match!</h3>

<%
}
%>
<% 
if("notstrong".equals(msg)){
	%>
 <h3 class="alert">Enter Strong Password!</h3>
<% 
}
%>
<% 
if("wrong".equals(msg)){
%>
<h3 class="alert" >Your old Password is wrong!</h3>
<%
}
%>
<% 
if("done".equals(msg)){
%>
<h3 class="alert" >Password change successfully!</h3>
<%
}
%>

<% 
if("invalid".equals(msg)){
%>
<h3 class="alert" >Some thing went wrong! Try again!</h3>
<%
}
%>


  <form action="changepasswordaction" method="post">


<h3>Enter Old Password</h3>
 <input class="input-style" type="password" name="oldpassword" placeholder="Enter Your Old Password" required>
  <hr>
 <h3>Enter New Password</h3>
 <input class="input-style" type="password" name="newpassword" placeholder="Enter New Password" required>
 <hr>
<h3>Enter Confirm Password</h3>
<input class="input-style" type="password" name="confirmnewpassword" placeholder="Enter New Password Again " required>
<hr>
<button class="button" type="submit">Change Password <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
  </form>
</body>
<br><br><br>
</html>