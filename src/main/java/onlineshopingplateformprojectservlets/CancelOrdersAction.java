
// this servlet will calling after cliking by admin on order cancel button  
package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;

import java.io.IOException;
import java.sql.*;
@WebServlet("/cancelorderaction")
@SuppressWarnings("serial")
public class CancelOrdersAction extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pid=request.getParameter("id");
		
		String status="cancel";
	MysqlDataAccess DAO=new MysqlDataAccess();
		try {
			DAO.getConnection();
			Connection con=DAO.getCon();
			String query="update cart set status='"+status+"' where productid='"+pid+"' and email='"+email+"'and address is not NULL";
		Statement st=con.createStatement();
		st.executeUpdate(query);
		response.sendRedirect("adminfiles/ordersreceived.jsp?msg=cancel");
		st.close();
		con.close();
		}
		catch(Exception e) {
			System.out.println(e);
			response.sendRedirect("adminfiles/ordersreceived.jsp?msg=invalid");
		}
	}

}
