<!-- this servlet will be called after cliking by user on change moblie number link -->

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
<title>Change Mobile Number</title>

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
<h3 class="alert">Your Mobile Number successfully changed!</h3>

<%
  }
%>

<%
  if("wrong".equals(msg)){
%>
<h3 class="alert">Your Password is wrong!</h3>
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



  <form action="changemobilenumberaction" method="post">

 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style" type="number" name="mobilenumber" placeholder="Enter New Mobile Number" required>
 <hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" placeholder="Enter Password" required>
<hr>
 <button class="button" type="submit">Change Mobile Number <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
</form>
</body>
<br><br><br>
</html>