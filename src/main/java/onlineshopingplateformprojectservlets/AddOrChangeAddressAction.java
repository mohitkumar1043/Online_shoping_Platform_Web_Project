// this servlet will called after cliking by user on  add or change address button

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
@WebServlet("/addandchangeaddressaction")
@SuppressWarnings("serial")
public class AddOrChangeAddressAction extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		  String email=session.getAttribute("email").toString();
		  String address=request.getParameter("address");
			String city=request.getParameter("city")	;
			String state=request.getParameter("state");	
			String country=request.getParameter("country");
		MysqlDataAccess DAO=new MysqlDataAccess()  ;
		try {
			DAO.getConnection();
			Connection con=DAO.getCon();
			String query="update uinfo set address=?,city=?,state=?,country=? where email=?";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, address);
			pst.setString(2, city);
			pst.setString(3, state);
			pst.setString(4, country);
			pst.setString(5, email);
			pst.executeUpdate();
			pst.close();
			con.close();
			response.sendRedirect("addandchangeaddress.jsp?msg=done");
			
		}
		catch(Exception e) {
			response.sendRedirect("addandchangeaddress.jsp?msg=invalid");
			System.out.println(e);
		}
	
			
	}

}
