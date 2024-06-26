<!--that is adminheader page -->
 <!-- whenever any error came error.jsp page will be called -->
<%@ page errorPage="../error.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../cssfiles/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
   
            <center><h1>K4kurtis</h1></center>
            <a href="addnewproduct.jsp">Add New Product <i class="fa fa-plus-square" aria-hidden="true"></i></a>
            <a href="allproducteditproduct.jsp">All Products & Edit Products<i class="fa fa-bars" aria-hidden="true"></i> </a>
            <a href="messagereceived.jsp">Messages Received<i class="fa fa-comment" aria-hidden="true"></i></a>
            <a href="ordersreceived.jsp">Orders Received <i class="fa fa-archive" aria-hidden="true"></i></a>
            <a href="cancelorders.jsp">Cancel Orders <i class="fa fa-window-close" aria-hidden="true"></i></a>
            <a href="ordersdelivered.jsp">Delivered Orders<i class="fa fa-truck" aria-hidden="true"></i></a>
            <a href="../logoutaction">Logout <i class="fa fa-sign-out" aria-hidden="true"></i></a>
          </div>
           <br>
           <!--table-->
    