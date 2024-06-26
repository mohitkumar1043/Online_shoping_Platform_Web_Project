<!--this page called after cliking by user on add or change address link -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="onlineshopingplateformprojectusefullclasses.MysqlDataAccess" %>
    <%@ include file="changedetailsheader.jsp" %>
    <%@ include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="cssfiles/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Address</title>
<style type="text/css">
h3{
color:black;
}
.alert{
color:red;
}
</style>
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
   <%
      String msg= request.getParameter("msg");
   %>
<%
  if("done".equals(msg)){
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%
  }
%>

<%
  if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%
  }
%>

    <%
    String email=session.getAttribute("email").toString();
     MysqlDataAccess DAO=new MysqlDataAccess();
     try{
       DAO.getConnection();
       Connection con=DAO.getCon();
       Statement st= con.createStatement();
       String query="select * from uinfo where email='"+email+"'";
        ResultSet rs=st.executeQuery(query);
        while(rs.next()){
        	
        
    %>

<form action="addandchangeaddressaction" method="post">
<h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" value="<%=rs.getString(7) %>"placeholder="Enter Your Address" required>
 <hr>
 <h3>Enter city(pincode)</h3>
  <input class="input-style" type="text" name="city" value="<%=rs.getString(8) %>"placeholder="Enter Your City(Pincode) Name" required>
<hr>
<h3>Enter State</h3>
 <input class="input-style" type="text" name="state" value="<%=rs.getString(9) %>"placeholder="Enter Your State Name" required>
<hr>
<h3>Enter country</h3>
 <input class="input-style" type="text" name="country" value="<%=rs.getString(10) %>"placeholder="Enter Your Country Name" required>
<hr>
<button class="button" type="submit">Add or Change Address <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></button>
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
</html>