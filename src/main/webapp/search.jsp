
<!-- this jsp page after clicking by user on search button and show products which user want -->
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
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
  // that is user for prevent(rokana) back botton after logout
   response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

 
%>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<!-- showing  active products  front on user  in table formet which is user want -->  
          <%
          int x=0;
		  String search=request.getParameter("search");
          // DAO=data access object
          MysqlDataAccess DAO= new MysqlDataAccess();
          try{
        	 DAO.getConnection();
        	 Connection con=DAO.getCon();
        	 
        	 String query="select * from product where (name like'%"+search+"%' or category like'%"+search+"%') and active='yes'";
             Statement st=con.createStatement();
             ResultSet rs=st.executeQuery(query);
             while(rs.next()){
            	 x=1;
          %>
           <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
            <td><a href="addtocartaction?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
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
      	  
      	<% 
      	// if dont avilable product user got this message
      	if(x==0){ %>
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
	<%} %>
      <br>
      <br>
      <br>
      <div class="footer">
          <p>All right reserved by BTech Days</p>
      </div>

</body>
</html>