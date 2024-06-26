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
<%
  // that is user for prevent(rokana) back botton after logout
   response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

 // if any user without using login id and password  and  withe help of copy url  came on this page that is  sended user on login page
   if(session.getAttribute("email")==null){
	   response.sendRedirect("login.jsp");
   }
%>
<div style="color: white; text-align: center; font-size: 30px;">My Orders<i class="fa fa-list" aria-hidden="true"> </div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>
     <%
     int sno=0;
     String email= session.getAttribute("email").toString();
     MysqlDataAccess DAO=new MysqlDataAccess();
     try{
    	 DAO.getConnection();
    	 Connection con=DAO.getCon();
    	 Statement st=con.createStatement();
    	  
    	 String query="select * from product inner join cart on product.id=cart.productid and cart.email='"+email+"' and cart.address is not NULL order by orderdate desc";
    	 ResultSet rs=st.executeQuery(query);
    	 
     while(rs.next()){
       sno=sno+1;
     
     %>
        
          <tr>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
             <td><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
            <td><%=rs.getString(8) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(10) %> </td>
             <td><%=rs.getString(16) %></td>
              <td><%=rs.getString(17) %></td>
               <td><%=rs.getString(18) %></td>
               <td><%=rs.getString(20) %></td>
            </tr>
         <%
     }
         %>
        </tbody>
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