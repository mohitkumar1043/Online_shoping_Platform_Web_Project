<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="footer.jsp" %>
    <%@page import="java.sql.*" %>
    <%@ page errorPage="error.jsp" %>
    <%@page import="onlineshopingplateformprojectusefullclasses.MysqlDataAccess" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="cssfiles/bill.css">
<title>Bill</title>
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
//that is user for user dont got page using back botton after logout
 response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
 // if any user without using login id and password  and  withe help of copy url  came on this page that is  sended user on login page
 //  if(session.getAttribute("email")==null){
//	   response.sendRedirect("login.jsp");
  // }
%>

<%
 String email=session.getAttribute("email").toString();
// DAO=data access object
MysqlDataAccess DAO=new MysqlDataAccess();
try{
	int total=0;
	int sno=0;
	String name="";
	DAO.getConnection();
	Connection con =DAO.getCon();
	Statement st=con.createStatement();
	String query1="select sum(total)from cart where email='"+email+"' and status='bill'";
	ResultSet rs1= st.executeQuery(query1);
	while(rs1.next()){
		total=rs1.getInt(1);
	}
	
	String query2="select * from uinfo  where email='"+email+"'";
	ResultSet rs2=st.executeQuery(query2);
	while(rs2.next()){
		name=rs2.getString(1);
	}
	String query3="select * from cart where email='"+email+"' and status='bill'";
	ResultSet rs3=st.executeQuery(query3);
	while(rs3.next()){

%>
<h3>K4kurtis</h3>
<hr>
<div class="left-div"><h3>Name:<%out.println(name); %>  </h3></div>
<div class="right-div-right"><h3>Email: <%out.println(email);%> </h3></div>
<div class="right-div"><h3>Mobile Number:<%=rs3.getString(10) %>  </h3></div>  

<div class="left-div"><h3>Order Date:<%=rs3.getString(11) %>  </h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rs3.getString(13) %> </h3></div>
<div class="right-div"><h3>Expected Delivery:<%=rs3.getString(12) %>  </h3></div> 

<div class="left-div"><h3>Transaction Id:<%=rs3.getString(14) %>  </h3></div>
<div class="right-div-right"><h3>City:<%=rs3.getString(7) %>  </h3></div> 
<div class="right-div"><h3>Address:<%=rs3.getString(6) %>  </h3></div> 

<div class="left-div"><h3>State: <%=rs3.getString(8) %> </h3></div>
<div class="right-div-right"><h3>Country: <%=rs3.getString(9) %> </h3></div>  

<hr>

<% break;
	}
%>
	
	<br>
	
<table id="customers">
 <h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
       //The inner join  keyword selects records that have matching values in both tables.
       String query4="select * from product inner join cart on product.id=cart.productid and cart.email='"+email+"' and cart.status='bill'";
          ResultSet rs4=st.executeQuery(query4);
    		   while(rs4.next()){
             
          %>
  <tr>
  <%sno=sno+1; %>
     <td><%out.println(sno); %></td>
            <td><%=rs4.getString(2) %></td>
            <td><%=rs4.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs4.getString(4) %></td>
    <td><%=rs4.getString(8) %></td>
     <td><i class="fa fa-inr"></i> <%=rs4.getString(10) %></td>
    
  </tr>
  <tr>
<%} %>
</table>

<h3>Total:<%out.println(total); %> </h3>
<a href="chekorderaction"><button class="button left-button">Chek Orders</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
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