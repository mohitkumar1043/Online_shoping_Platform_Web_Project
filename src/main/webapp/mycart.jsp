<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
    <%@ include file="footer.jsp" %>
    <%@ page import="onlineshopingplateformprojectusefullclasses.MysqlDataAccess" %>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
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
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class="fa fa-cart-arrow-down" ></i></div>
 <%
 String msg=request.getParameter("msg");
 if("notpossible".equals(msg))
 {
 %>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%
}
 %>
 <%
 if("inc".equals(msg))
 {
 %>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%
}
 %>
 
 <%
 if("dec".equals(msg))
 {
 %>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%
 }
%>
<%
 if("removed".equals(msg))
 {
 %>
<h3 class="alert">Product Successfully Removed!</h3>
<%
 }
%>
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
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
           <%if(total>0){ %> <th scope="col"><a href="Proceedtoorder.jsp">Proceed to order</a></th><%}; %>
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
            <th scope="col">Remove <i class="fa fa-trash" ></i></th>
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
            <td><a href="incdecquantityaction?id=<%=rs2.getString(1)%>&quantity=inc"><i class="fa fa-plus-circle" ></i></a> <%=rs2.getString(8) %> <a href="incdecquantityaction?id=<%=rs2.getString(1)%>&quantity=dec"><i class="fa fa-minus-circle" ></i></a></td>
            <td><i class="fa fa-inr"></i> <%=rs2.getString(10) %></td>
            <td><a href="removeproductfromcart?id=<%=rs2.getString(1)%>">Remove <i class="fa fa-trash" ></i></a></td>
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