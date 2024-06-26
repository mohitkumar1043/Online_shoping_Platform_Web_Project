
<!-- that jsp page show on front of admin after clicking by admin on allproduct & editproduct -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="onlineshopingplateformprojectusefullclasses.MysqlDataAccess" %>
    <%@ include file="adminheader.jsp" %>
    <%@ include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Product & Edit Product</title>
<style>
h3
{
	color: yellow;
	text-align: center;
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
	<h3 class="alert">Product Successfully Updated!</h3>
<% 
}
%>
<%
if("invalid".equals(msg)){
	%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<% 
}
%>


<div style="color: black; text-align: center; font-size: 30px;">All Products & Edit Products <i class="fa fa-bars" aria-hidden="true"></i></div>



<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th>Status</th>
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
        
      <!-- showing products  front on admin  in table formet -->  
          <%
          // DAO=data access object
          MysqlDataAccess DAO= new MysqlDataAccess();
          try{
        	 DAO.getConnection();
        	 Connection con=DAO.getCon();
        	 
        	 String query="select * from product";
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery(query);
             while(rs.next()){
          %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
          <!-- if admin click on edit product button sended admin with product id on editproduct.jsp page  -->
            <td><a href="editproduct.jsp?id=<%=rs.getString(1) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%
         
             }
             st.close();
             con.close();
          }
          catch(Exception e){
          System.out.println(e);
          }
         %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>