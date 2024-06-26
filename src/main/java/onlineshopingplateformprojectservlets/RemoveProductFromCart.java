package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;


@SuppressWarnings("serial")
@WebServlet("/removeproductfromcart")
public class RemoveProductFromCart extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		String email=session.getAttribute("email").toString();
		String id= request.getParameter("id");
		
		// DAO=data access object
				MysqlDataAccess DAO=new MysqlDataAccess();
				try {
					DAO.getConnection();
					Connection con=DAO.getCon();
					Statement st=con.createStatement();
					String query="delete from cart where email='"+email+"' and productid='"+id+"' and address is NULL";
					st.executeUpdate(query);
					response.sendRedirect("mycart.jsp?msg=removed");
					st.close();
					con.close();
				}
				catch(Exception e) {
					System.out.println(e);
				}
	}

}
