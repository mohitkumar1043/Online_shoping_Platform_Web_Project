<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="changedetailsheader.jsp" %>
    <%@ include file="footer.jsp" %>
     <%@page import="java.sql.*" %>
    <%@page import="onlineshopingplateformprojectusefullclasses.MysqlDataAccess" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="cssfiles/changeDetails.css">
<title>Change Details</title>
<style>
h3{
color: black;

}
hr
{width:70%;}</style>
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
    String email=session.getAttribute("email").toString();
    MysqlDataAccess DAO=new MysqlDataAccess();
    try{
    	DAO.getConnection();
    	Connection con =DAO.getCon();
    	Statement st=con.createStatement();
    	String query="select * from uinfo where email='"+email+"'";
    	ResultSet rs=st.executeQuery(query);
    	while(rs.next()){
    		
    	
    

%>
<h3 >Name: <%=rs.getString(1) %> </h3>
<hr>
 <h3>Email: <%=rs.getString(2) %> </h3>
 <hr>
 <h3>Mobile Number: <%=rs.getString(3) %> </h3>
 <hr>
<h3>Security Question: <%=rs.getString(4) %> </h3>
<hr>
<%
    	}
%>
      <br>
      <br>
      <br>
  <%
    }
    catch(Exception e){
    	System.out.println(e);
    	
    }
  %>
</body>
</html>