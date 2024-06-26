
//this servlet will calling after  clicking by user on  add cart
package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;


import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;

@SuppressWarnings("serial")
@WebServlet("/addtocartaction")
public class AddToCartAction extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
	String email=session.getAttribute("email").toString();
	
	String product_id=request.getParameter("id");
	int quantity=1;
	int product_price=0;
	int total_price =0;
	
	int z=0;
	
	//DAO=data access object
	  MysqlDataAccess DAO  =new MysqlDataAccess();
	  try {
		
		  DAO.getConnection();
     	 Connection con=DAO.getCon();
     	 
     	 String query1="select * from product where id='"+product_id+"'";
          Statement st=con.createStatement();
          ResultSet rs1=st.executeQuery(query1);
          
          while(rs1.next()) {
        	  product_price=rs1.getInt(4);
        	 
        	  
          }
          
       //now we have two cases are avilable 
          // 2 product not present in cart with same email id and id
          // case1 product is already present in cart with same email id and id  when address is null 
          String query2="select * from cart where productid='"+product_id+"' and email='"+email+"' and address is NULL";
          ResultSet rs2=st.executeQuery(query2); 
          while(rs2.next()) {
        	 total_price=rs2.getInt(5);
        	 total_price+=product_price;
        	 quantity =rs2.getInt(3);
        	 quantity+=1;
        	 z=1;
          }
          
          if(z==1) {
        	  String query3="update cart set total='"+total_price+"',quantity='"+quantity+"' where productid='"+product_id+"' and email='"+email+"' and address is NULL";
        	  st.executeUpdate(query3);
        	  st.close();
              con.close();
        	  response.sendRedirect("home.jsp?msg=exist");
          }
          // case 2 product not present in cart with same email id and id
          if(z==0) {
        	  total_price=product_price;
        	  String query4="insert into cart(email,productid,quantity,price,total) values(?,?,?,?,?)";
              // calling connection stabilize  function 
                
              PreparedStatement pst=con.prepareStatement(query4);
              pst.setString(1,email);  
              pst.setString(2,product_id);
              pst.setInt(3,quantity );
              pst.setInt(4, product_price);
              pst.setInt(5, total_price);
             
              pst.executeUpdate();
              st.close();
             
              pst.close();
              con.close();
              response.sendRedirect("home.jsp?msg=added");
              
          }
          
         
          
          
	  }
	  catch(Exception e) {
		  System.out.println(e);
		  response.sendRedirect("home.jsp?msg=invalid");
	  }
	
	}

}
