
<!-- this jsp page calling after cliking by admin on orders received link -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    
      <%@page import="java.sql.*" %>
    <%@page import="onlineshopingplateformprojectusefullclasses.MysqlDataAccess" %>
    <%@ include file="adminheader.jsp" %>
    <%@ include file="../footer.jsp" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../cssfiles/ordersReceived-style.css">
<title>Orders Received</title>
<style>
.alert{
  color:red;
}
.th-style
{ width: 25%;}
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
<div style="color: black; text-align: center; font-size: 30px;">Orders Received<i class="fa fa-archive" aria-hidden="true"></i></div>
<%
String msg=request.getParameter("msg");
%>

<%
   if("cancel".equals(msg)){
%>
<h3 class="alert">Order Cancel Successfully!</h3>
<%
   }
%>
<%
   if("delivered".equals(msg)){
%>
<h3 class="alert">Successfully Delivered!</h3>
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




<table id="customers">
          <tr>
          <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
              <th scope="col">Cancel order <i class="fa fa-window-close" aria-hidden="true"></i></th>
              <th scope="col">Order Delivered <i class="fa fa-truck" aria-hidden="true"></i></th>
          </tr>
        <%
      
     String email= session.getAttribute("email").toString();
     MysqlDataAccess DAO=new MysqlDataAccess();
     try{
    	 DAO.getConnection();
    	 Connection con=DAO.getCon();
    	 Statement st=con.createStatement();
    	  
    	 String query="select * from product inner join cart on product.id=cart.productid and cart.status='processing' order by orderdate";
    	 ResultSet rs=st.executeQuery(query);
    	 
     while(rs.next()){
       
     
     %>
       
          <tr>
          <td><%=rs.getString(15)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(8)%></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(10)%> </td>
                <td><%=rs.getString(11)%></td>
               <td><%=rs.getString(12)%></td>
                <td><%=rs.getString(13)%></td>
                 <td><%=rs.getString(14)%></td>
             <td><%=rs.getString(16)%></td>
              <td><%=rs.getString(17)%></td>
               <td><%=rs.getString(18)%></td>
               <td><%=rs.getString(19)%></td>
               <td><%=rs.getString(20)%></td>
               <td><a href="../cancelorderaction?id=<%=rs.getString(7)%>&email=<%=rs.getString(6)%>">Cancel<i class="fa fa-window-close" aria-hidden="true"></i></a></td>
                <td><a href="../deliveredorderaction?id=<%=rs.getString(7)%>&email=<%=rs.getString(6)%>">Delivered <i class="fa fa-truck" aria-hidden="true"></i></a></td>
            </tr>
              </tr>
         <%
     }
         %>
        </table>
      <br>
      <br>
      <br>
       <%
     
    st.close();
     con.close();
     }
     catch(Exception e){
    	 System.out.println(e);
     }
     %>

</body>
</html>