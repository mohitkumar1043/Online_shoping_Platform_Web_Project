<!--  this jsp page calling after cliking by user on messageus link -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
    <%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="cssfiles/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>

<%
  // that is user for prevent(rokana) back botton after logout
   response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
%>
<div style="color:black; text-align: center; font-size: 30px;">Message Us <i class="fa fa-commenting-o" aria-hidden="true"></i></div>
<%

String msg=request.getParameter("msg") ;


%>
<%
  if("done".equals(msg)){
	  
  
%>
 
<h3 style="text-align:center; color:red;">Message successfully sent. Our team will contact you soon!</h3>

<%
  }
%>
<%
  if("invalid".equals(msg)){
	  
%>
<h3 style="text-align:center; color:red;">Some thing Went Wrong! Try Again!</h3>
<%
  }
%>
<form action="messageusaction" method="post">
 <input class="input-style" name="subject" type="text" placeholder="Subject" required>
<hr>
<textarea class="input-style" name="body" placeholder="Enter Your Message" required>
</textarea>
<hr>
 <button class="button" type="submit">Send Message<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
</form>  
   
   
   
   
<br><br><br>
</body>
</html>