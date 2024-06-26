
// this page will be called after user want increment and decrement  product quantity on mycart.jsp page
package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;
import java.sql.*;
import java.io.IOException;

@WebServlet("/incdecquantityaction")
@SuppressWarnings("serial")
public class IncDecQunatityAction extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		String email=session.getAttribute("email").toString();
		String id= request.getParameter("id");
		String opretation =request.getParameter("quantity");
		int price=0;
		int total=0;
		int quantity=0;
		
		// DAO=data access object
		MysqlDataAccess DAO=new MysqlDataAccess();
		try {
			DAO.getConnection();
			Connection con=DAO.getCon();
			Statement st=con.createStatement();
			String query1="select * from cart where email='"+email+"' and productid='"+id+"' and address is NULL";
			ResultSet rs=st.executeQuery(query1);
			while(rs.next()) {
				price = rs.getInt(4);
				total= rs.getInt(5);
				quantity =rs.getInt(3);
			}
			
			if(quantity==1&& opretation.equals("dec")) {
				response.sendRedirect("mycart.jsp?msg=notpossible");
			}
			else if(quantity!=1&& opretation.equals("dec")) {
				total=total-price;
				quantity=quantity-1;
				String query2="update cart set total='"+total+"', quantity='"+quantity+"' where email='"+email+"' and productid='"+id+"' and address is NULL";
				st.executeUpdate(query2);
				response.sendRedirect("mycart.jsp?msg=dec");
			}
			else {
				total=total+price;
				quantity=quantity+1;
				String query2="update cart set total='"+total+"', quantity='"+quantity+"' where email='"+email+"' and productid='"+id+"' and address is NULL";
				st.executeUpdate(query2);
				response.sendRedirect("mycart.jsp?msg=inc");
			}
			
			st.close();
			con.close();
			
		}
		catch(Exception e ) {
			System.out.println(e);
			
		}
		
	}

}
