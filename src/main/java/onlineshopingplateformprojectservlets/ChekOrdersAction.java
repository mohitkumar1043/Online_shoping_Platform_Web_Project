// this page will be called after cliked by user on bill page chek order button

package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;

import java.io.IOException;

import java.sql.*;
@SuppressWarnings("serial")
@WebServlet("/chekorderaction")
public class ChekOrdersAction extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 HttpSession session =request.getSession();
	 String email=session.getAttribute("email").toString();
	 String status="processing";
	 MysqlDataAccess DAO=new MysqlDataAccess();
	 try {
		 DAO.getConnection();
		 Connection con=DAO.getCon();
		 
		 String query="update cart set status=? where email=? and status='bill'";
		 PreparedStatement pst=con.prepareStatement(query);
		 pst.setString(1,status);
		 pst.setString(2, email);
		 
		 pst.executeUpdate();
		 pst.close();
		 con.close();
		 response.sendRedirect("myorders.jsp");
	 }
	 catch(Exception e) {
		 System.out.println(e);
	 }
	}

}
