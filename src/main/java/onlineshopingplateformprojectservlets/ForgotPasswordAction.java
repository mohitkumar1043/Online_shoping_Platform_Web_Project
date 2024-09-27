
// that servlet will be  calling after clicking by user forgotpassword button
package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import onlineshopingplateformprojectusefullclasses.User;
import onlineshopingplateformprojectusefullclasses.ChekPasswordStrongOrNot;
import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;
@SuppressWarnings("serial")
@WebServlet("/forgotpasswordaction")
public class ForgotPasswordAction extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String mobilenumber=request.getParameter("number");
		String sqquestion=request.getParameter("securityquestion");
		String sqanswer=request.getParameter("sqanswer");
		String newpassword=request.getParameter("newpassword");
		 // cheking password is strong or not
		// CPSON chek password strong or not object
		ChekPasswordStrongOrNot CPSON= new ChekPasswordStrongOrNot();
		boolean is_password_Strong =CPSON.strongPasswordChecker(newpassword);
		if( is_password_Strong==false ) {
			response.sendRedirect("forgotpassword.jsp?msg=notstrong");	
		}
		else {
		
		
	  User u= new User(email,mobilenumber,sqquestion,sqanswer,newpassword);
	  
	// DAO=data access object
			MysqlDataAccess DAO=new MysqlDataAccess();
			
			
			try {	 
				 // cpi=change password info
			boolean cpi = DAO.changePassword(u);
			if(cpi) {
					 response.sendRedirect("forgotpassword.jsp?msg=done");
			}
			else {
				
				 response.sendRedirect("forgotpassword.jsp?msg=invalid");
			}
				
	}
	catch(Exception e) {
		System.out.println(e);
	}
		
		
		
	}
	}
}
