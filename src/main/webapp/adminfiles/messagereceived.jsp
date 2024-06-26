
<!-- this jsp page calling after cliking by admin on message received link   -->
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
<title>Message Received</title>
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
<div style="color: black; text-align: center; font-size: 30px;">Messages Received <i class="fa fa-comment" aria-hidden="true"></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
       <%
       String email=session.getAttribute("email").toString();
       MysqlDataAccess DAO=new MysqlDataAccess();
       try{
    	   DAO.getConnection();
    	   Connection con =DAO.getCon();
    	   Statement st=con.createStatement();
    	   String query="select * from messages order by id desc";
    	   ResultSet rs=st.executeQuery(query);
    	   while(rs.next()){
       
       
       %>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
          </tr>
         <%
    	   }
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