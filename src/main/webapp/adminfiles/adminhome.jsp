
<!-- that jsp page show on front of user  after clicking by user login button if user data match with admin -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ include file="adminheader.jsp" %>
    <%@ include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>welcome</title>
<style>
h1
{
color:black;
text-align: center;
font-size: 100px;
}</style>
</head>
<body>

<%
  // that is user for prevent(rokana) back botton after logout
   response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

 // if any user without using login id and password  and  withe help of copy url  came on this page that is  sended user on login page
   if(session.getAttribute("email")==null){
	   response.sendRedirect("../login.jsp");
   }
%>
<h1>welcome admin!</h1>
</body>
</html>