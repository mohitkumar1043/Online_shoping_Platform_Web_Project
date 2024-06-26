
// this servlet will be called after cliking by user logout button
package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@SuppressWarnings("serial")
@WebServlet("/logoutaction")
public class Logout extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session=request.getSession();
		 session.removeAttribute("email");
		 
		 // it is remove all the data
		 session.invalidate();
		 
		 response.sendRedirect("login.jsp");
		 
	}

}
