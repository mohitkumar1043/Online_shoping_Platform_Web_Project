// this servlet will be called after cliking by user on change password button

package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlineshopingplateformprojectusefullclasses.ChekPasswordStrongOrNot;
import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;
import java.sql.*;
import java.io.IOException;

@WebServlet("/changepasswordaction")
@SuppressWarnings("serial")
public class ChangePasswordAction extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  HttpSession session=request.getSession();
	  String email=session.getAttribute("email").toString();
		String oldpassword=request.getParameter("oldpassword");
	String newpassword=request.getParameter("newpassword")	;
	String confirmnewpassword=request.getParameter("confirmnewpassword");
	// cheking password is strong or not
		// CPSON chek password strong or not object
		ChekPasswordStrongOrNot CPSON= new ChekPasswordStrongOrNot();
		boolean is_password_Strong =CPSON.strongPasswordChecker(newpassword);
	if(!newpassword.equals(confirmnewpassword)) {
		response.sendRedirect("changepassword.jsp?msg=notMatch");
	}
	
	 
	else if( is_password_Strong==false ) {
		response.sendRedirect("changepassword.jsp?msg=notstrong");	
	}
	
	else {
		MysqlDataAccess DAO=new MysqlDataAccess();
		int chek=0;
		try {
			DAO.getConnection();
			Connection con=DAO.getCon();
	Statement st=con.createStatement();
	String query="select * from uinfo where email='"+email+"' and password='"+oldpassword+"'";
		ResultSet rs=st.executeQuery(query)	;
		while(rs.next()) {
		  chek=1;
		 
		  
		}
		
		if(chek==0) {
			 response.sendRedirect("changepassword.jsp?msg=wrong");
		}
		else  {
			 st.executeUpdate("update uinfo set password='"+newpassword+"' where email='"+email+"'");
			response.sendRedirect("changepassword.jsp?msg=done");
		}
		st.close();
		con.close();
		
		}
		catch(Exception e) {
			
			System.out.println(e);
			 response.sendRedirect("changepassword.jsp?msg=invalid");
		}
	
		
	}
		
	}

}
