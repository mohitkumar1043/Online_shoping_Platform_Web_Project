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
@WebServlet("/messageusaction")
@SuppressWarnings("serial")
public class MessageUsAction extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session=request.getSession();
	String email=session.getAttribute("email").toString();
	String subject=request.getParameter("subject");
	String body=request.getParameter("body");
		MysqlDataAccess DAO=new MysqlDataAccess();
	try {
		DAO.getConnection();
		Connection con =DAO.getCon();
	String query="insert into messages(email,subject,body) values(?,?,?)";
	PreparedStatement pst=con.prepareStatement(query);
	pst.setString(1, email);
	pst.setString(2, subject);
	pst.setString(3,body);
	pst.executeUpdate();
	response.sendRedirect("messageus.jsp?msg=done");	
	pst.close();
	con.close();
	}
	catch(Exception e) {
		System.out.println(e);
		response.sendRedirect("messageus.jsp?msg=invalid");
	}
		
		
		
	}

}
