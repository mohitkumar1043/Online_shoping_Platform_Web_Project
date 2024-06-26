// this servlet will calling after cliking by admin on order deleivered button 

package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

@WebServlet("/deliveredorderaction")
@SuppressWarnings("serial")
public class DeliveredOrdersAction extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pid=request.getParameter("id");
		
		String status="delivered";
	MysqlDataAccess DAO=new MysqlDataAccess();
		try {
			DAO.getConnection();
			Connection con=DAO.getCon();
			String query="update cart set status='"+status+"' where productid='"+pid+"' and email='"+email+"'and address is not NULL";
		Statement st=con.createStatement();
		st.executeUpdate(query);
		response.sendRedirect("adminfiles/ordersreceived.jsp?msg=delivered");
		st.close();
		con.close();
		}
		catch(Exception e) {
			System.out.println(e);
			response.sendRedirect("adminfiles/ordersreceived.jsp?msg=invalid");
		}
		
		
		
	}

}
