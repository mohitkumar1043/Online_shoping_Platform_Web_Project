<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="cssfiles/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>



    <!--Header-->
    <br>
    <div class="topnav sticky">
    <%
 
 // if any user without using login id and password  and  withe help of copy url  came on this page that is  sended user on login page
   if(session.getAttribute("email")==null){
	   response.sendRedirect("login.jsp");
   }
%>
    
            <center><h2> Welcome On K4kurtis</h2></center>
           
            <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
            <a href="mycart.jsp">My Cart<i class="fa fa-cart-arrow-down" aria-hidden="true"></i></a>
            <a href="myorders.jsp">My Orders<i class="fa fa-list" aria-hidden="true"></i></a>
            <a href="changedetails.jsp">Change Details <i class="fa fa-edit"></i></a>
            <a href="messageus.jsp">Message Us <i class="fa fa-commenting-o" aria-hidden="true"></i></a>
            <a href="aboutus.jsp">About Us <i class="fa fa-address-book"></i></a>
            <a href="logoutaction">Logout <i class="fa fa-sign-out" aria-hidden="true"></i></a>
            <div class="search-container">
             <form action="search.jsp" method="post">
             <input type="text" placeholder="search" name="search"required>
             <button type="submit"><i class="fa fa-search"></i></button>
             </form>
               
               
             
            </div>
          </div>
           <br>
           <!--table-->
    