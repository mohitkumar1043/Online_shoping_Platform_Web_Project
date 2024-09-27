// this servlet will be calling after clicking by user signup button
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
@WebServlet("/signupaction")
public class SignupAction extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name"); 
		String email=request.getParameter("email");  
		String mobilenumber=request.getParameter("mobilenumber");  
		String securityquestion=request.getParameter("securityquestion");  
		String sqanswer=request.getParameter("sqanswer");  
		String password=request.getParameter("password");
		 // cheking password is strong or not
		// CPSON chek password strong or not object
		ChekPasswordStrongOrNot CPSON= new ChekPasswordStrongOrNot();
		boolean is_password_Strong =CPSON.strongPasswordChecker(password);
		if( is_password_Strong==false ) {
			response.sendRedirect("singup.jsp?msg=notstrong");	
		}
		else {
		String address="";
		String city="";
		String state="";
		String country="";
		
		User u= new User(name,email,mobilenumber,securityquestion,sqanswer,password,address,city,state,country);
		// DAO=data access object
		MysqlDataAccess DAO=new MysqlDataAccess();
		
		try {
			DAO.addUser(u);
			response.sendRedirect("singup.jsp?msg=valid");
		}
		catch(Exception e){
			System.out.println(e);
			response.sendRedirect("singup.jsp?msg=invalid");
		}
		
		
	}

}
}