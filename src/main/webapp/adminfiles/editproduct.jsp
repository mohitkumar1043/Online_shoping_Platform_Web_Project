
<!-- this page is showing after clicking by admin edit button on allproducteditproduct.jsp page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="onlineshopingplateformprojectusefullclasses.MysqlDataAccess" %>
    <%@ include file="adminheader.jsp" %>
    <%@ include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../cssfiles/addNewProduct-style.css">
<title>Edit Product</title>
<style>
.back
{
  color: black;
  margin-left: 2.5%
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
 <h2><a class="back" href="allproducteditproduct.jsp"><i class="fa fa-arrow-circle-left"> Back</i></a></h2>

 <!-- showing products details for edit front on admin   -->  
          <%
          String id=request.getParameter("id");
          
          // DAO=data access object
          MysqlDataAccess DAO= new MysqlDataAccess();
          try{
        	 DAO.getConnection();
        	 Connection con=DAO.getCon();
        	 
        	 String query="select * from product where id='"+id+"'";
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery(query);
             while(rs.next()){
          %>
<!--creating form for edit product -->
<form action="../editproductaction" method="post">
<input type="hidden" name="pid" value="<%out.println(id);%>">

<div class="left-div">
 <h3 class="back">Enter Name</h3>
<input class="input-style"type="text"name="pname" value="<%=rs.getString(2)%>" required>
<hr>
</div>

<div class="right-div">
<h3 class="back">Enter Category</h3>
 <input class="input-style"type="text"name="pcategory" value="<%=rs.getString(3)%>" required>
<hr>
</div>

<div class="left-div">
<h3 class="back">Enter Price</h3>
 <input class="input-style"type="text"name="pprice" value="<%=rs.getString(4)%>" required>
<hr>
</div>

<div class="right-div">
<h3 class="back">Active</h3>
 <select  class="input-style"  name="active" required> 
         <option value="yes" >YES</option>
         <option value="no">NO</option>
</select>
 <hr>
</div>
    <button class="button">EDIT PRODUCT<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
 <%
             }
             
             st.close();
             con.close();
          }
          catch(Exception e){
          System.out.println(e);
          }
         %>

</body>
<br><br><br>
</body>
</html>