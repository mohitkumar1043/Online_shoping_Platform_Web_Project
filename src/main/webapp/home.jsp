
<!-- that jsp page show on front of user  after clicking by user login button if user find in database -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="header.jsp" %>
    <%@ include file="footer.jsp" %>
    <%@page import="java.sql.*" %>
    <%@page import="onlineshopingplateformprojectusefullclasses.MysqlDataAccess" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
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

 
%>


<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>

<%
String msg=request.getParameter("msg");
if("added".equals(msg)){
	%>
	<h3 class="alert">Product Added Successfully!</h3>
<% 
}
%>
<%
if("exist".equals(msg)){
	%>
<h3 class="alert">product already exist in your cart! Quantity increased</h3>
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

<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class="fa fa-cart-plus" aria-hidden="true"></i></th>
          </tr>
        </thead>
        <tbody>
 <!-- showing  active products  front on user  in table formet -->  
          <%
          // DAO=data access object
          MysqlDataAccess DAO= new MysqlDataAccess();
          try{
        	 DAO.getConnection();
        	 Connection con=DAO.getCon();
        	 
        	 String query="select * from product where active='yes'";
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery(query);
             while(rs.next()){
          %>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
            <td><a href="addtocartaction?id=<%=rs.getString(1) %>">Add to cart <i class="fa fa-cart-plus" aria-hidden="true"></i></a></td>
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