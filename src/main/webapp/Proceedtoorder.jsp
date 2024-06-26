<!-- this page will be called  by user  after cliked on proceed to order button on mycart.jsp page-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="footer.jsp" %>
          <%@ page errorPage="error.jsp" %>
    <%@page import="java.sql.*" %>
    <%@page import="onlineshopingplateformprojectusefullclasses.MysqlDataAccess" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="cssfiles/proceedtoorder-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>

<!-- code for dont got agin page after genreting bill -->
<script src="Scripts/jquery-1.7.1.js"></script>
<script type="text/javascript">
function preventBack(){window.history.forward();}
setTimeout("preventBack()",0);
window.onunload=function(){null};

</script>

</head>
<body>
 <%

 // if any user without using login id and password  and  withe help of copy url  came on this page that is  sended user on login page
   if(session.getAttribute("email")==null){
	   response.sendRedirect("login.jsp");
   }
%>
<br>
<table>
<thead>

      <%
         String email=session.getAttribute("email").toString();
      int total=0;
      int sno=0;
      // data access object
      MysqlDataAccess DAO=new MysqlDataAccess();
      try{
      	 DAO.getConnection();
      	 Connection con=DAO.getCon();
      String query1="select sum(total) from cart where email='"+email+"' and address is NULL";
      Statement st=con.createStatement();
      ResultSet rs1=st.executeQuery(query1);
      while(rs1.next()){
      	total=rs1.getInt(1);
      	
      }
     
      
      
      %>


          <tr>
          <th scope="col"><a href="mycart.jsp"><i class="fa fa-arrow-circle-left">back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"><%out.println(total); %> </i> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
         <%
       //The inner join  keyword selects records that have matching values in both tables.
       String query2="select * from product inner join cart on product.id=cart.productid and cart.email='"+email+"' and cart.address is NULL";
          ResultSet rs2=st.executeQuery(query2);
    		   while(rs2.next()){
             
          %>
          <tr>
          <%sno=sno+1; %>
            <td><%out.println(sno); %></td>
            <td><%=rs2.getString(2) %></td>
            <td><%=rs2.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs2.getString(4) %></td>
            <td> <%=rs2.getString(8) %> </td>
            <td><i class="fa fa-inr"></i><%=rs2.getString(10) %> </td>
            </tr>
          <%
          }
    		   String query3="select * from  uinfo where email='"+email+"'";
    		   ResultSet rs3=st.executeQuery(query3);
    		   while(rs3.next())
    		   {
    			   
    		   %>
        </tbody>
       
      </table>
      
<hr style="width: 100%">
 <form action="proceedtoorderaction" method="post">
 
 <div class="left-div">
 <h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" value="<%=rs3.getString(7)%>" placeholder="Enter Your Address"required>
 </div>

<div class="right-div">
<h3>Enter city(pincode)</h3>
 <input class="input-style" type="text" name="city" value="<%=rs3.getString(8)%>" placeholder="Enter Your City(Pincode) Name"required>
</div> 

<div class="left-div">
<h3>Enter State</h3>
 <input class="input-style" type="text" name="state" value="<%=rs3.getString(9)%>" placeholder="Enter Your state Name"required>
</div>

<div class="right-div">
<h3>Enter country</h3>
 <input class="input-style" type="text" name="country" value="<%=rs3.getString(10)%>" placeholder="Enter Your Country Name"required>
</div>

<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
  <select  class="input-style"  name="paymentmethod" required> 
         <option value="Cash On Delivery(COD)">Cash On Delivery(COD)</option>
          <option value="Online Payment">Online Payment</option>
         
</select>
</div>

<div class="right-div">
<h3>Pay online on this 7014996869@ybl</h3>
<input class="input-style" type="text" name="transactionid"  placeholder="Enter Your Transaction ID">
<h3 style="color: black">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobilenumber" value="<%=rs3.getString(3)%>" placeholder="Enter Your Mobile Number"required>
<h3 style="color: black">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: black">*If you enter wrong transaction id then your order will we can cancel!</h3>
  <button class="button" type="submit">Proceed To Order  <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
<h3 style="color: black">*Fill form correctly</h3>
</div>
</form>

<%
      }
      }
      catch(Exception e){
    	 System.out.println(e); 
      }
%>

      <br>
      <br>
      <br>

</body>
</html>