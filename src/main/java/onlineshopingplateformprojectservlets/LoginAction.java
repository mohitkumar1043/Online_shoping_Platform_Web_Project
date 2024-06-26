
// this servlet will be calling after clicking by user login button
 
package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;

import java.io.IOException;


@SuppressWarnings("serial")
@WebServlet("/loginaction")
public class LoginAction extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String email=request.getParameter("email");
		  String password=request.getParameter("password");
		  
	if("admin12943@gmail.com".equals(email)&&"mohitkumar".equals(password))	 {
		// we set data in session object because  any user without using id and passowrd dont access  other pages with help of url
		
		HttpSession session=request.getSession();
		 session.setAttribute("email", email);
		 // send request adminhome.jsp page 
		 response.sendRedirect("adminfiles/adminhome.jsp");	
	}
	else {
    // calling DAO=data access object
	MysqlDataAccess DAO=new MysqlDataAccess();
	 try {
	boolean chekuser = DAO.chekUser(email, password);
	if(chekuser) {
		// we set data in session object because  any user without using id and passowrd dont access  other pages with help of url
		HttpSession session=request.getSession();
				 session.setAttribute("email", email);
				 // calling home.jsp page
				 response.sendRedirect("home.jsp");
	}
	else {
		// calling singup.jsp page
		 response.sendRedirect("singup.jsp");
	}
		
	}
	catch(Exception e) {
		System.out.println(e);
		response.sendRedirect("singup.jsp?msg=invalid");
	}
	   	  
	}
	}
}
