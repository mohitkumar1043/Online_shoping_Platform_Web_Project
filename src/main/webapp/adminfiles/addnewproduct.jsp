<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="onlineshopingplateformprojectusefullclasses.MysqlDataAccess"%>
    <%@ include file="adminheader.jsp" %>
    <%@ include file="../footer.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../cssfiles/addNewProduct-style.css">
<title>Add New Product</title>
<style type="text/css">
  h3{
  color: black;
  }
</style>
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

<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
	%>
	<h3 class="alert">Product Added Successfully!</h3>
<% 
}
%>
<%
if("invalid".equals(msg)){
	%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<% 
}
%>



<!-- thats code gives product id -->
  <% 
  int id=1;
  try{
	  // DAO=DATA ACCESS OBJECT
	 MysqlDataAccess DAO =new MysqlDataAccess();
	  id=DAO.getProductId();
  }
  catch(Exception e){
	  
  }
  
  
  %>
  
<form action="../addnewproductaction" method ="post">
<h3 style="color: yellow;">Product ID:<%out.println(id);%> </h3>
 <input type="hidden" name="productid" value="<%out.println(id);%>">

<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="productname" placeholder="Enter Product Name"required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="productcategory" placeholder="Enter Product Category"required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="productprice" placeholder="Enter Product Price"required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
   <select  class="input-style"  name="active" required> 
         <option value="yes" >YES</option>
         <option value="no">NO</option>
</select>
<hr>
</div>
<button class="button" >Add New Product <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>