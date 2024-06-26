<!-- this jsp page called after cliking by user on change security question link -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="onlineshopingplateformprojectusefullclasses.MysqlDataAccess" %>
    <%@ include file="changedetailsheader.jsp" %>
    <%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="cssfiles/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
<style type="text/css">
h3{
color:black;
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
      String msg= request.getParameter("msg");
   %>
<%
  if("done".equals(msg)){
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%
  }
%>

<%
  if("wrong".equals(msg)){
%>
<h3 class="alert">Your Password is Wrong!</h3>
<%
  }
%>

<%
  if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%
  }
%>

<form action="changesecurityquestionaction" method="post">
<h3>Select Your New Securtiy Question</h3>
 <select class="input-style" name="securityquestion" required> 
         <option value="what is your first car?">what is your first car?</option>
         <option value="what is the name of the town where you were born?">what is the name of the town where you were born? </option>
         <option value="what is the name of your first pet?">what is the name of your first pet? </option>
       </select>
  
 <hr>
 <h3>Enter Your New Answer</h3>
  <input class="input-style" type="text" name="sqanswer" placeholder="Enter Answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password" placeholder="Enter Password" required>
<hr>
<button class="button" type="submit">Change Security Question <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
</form>
</body>
<br><br><br>
</html>