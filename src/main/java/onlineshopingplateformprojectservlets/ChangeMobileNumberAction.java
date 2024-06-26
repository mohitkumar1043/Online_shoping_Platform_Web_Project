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
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/changemobilenumberaction")
@SuppressWarnings("serial")
public class ChangeMobileNumberAction extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		 String email=session.getAttribute("email").toString();
		 String mobilenumber=request.getParameter("mobilenumber");
		 String password=request.getParameter("password");
		
		 MysqlDataAccess DAO=new MysqlDataAccess();
			try {
				int chek=0;
				DAO.getConnection();
				Connection con=DAO.getCon();
				Statement st=con.createStatement();
				String query1="select * from uinfo where email='"+email+"' and password='"+password+"'";
				ResultSet rs1= st.executeQuery(query1);
				while(rs1.next()) {
					chek=1;
					
				}
				
			if(chek==0){
				
				response.sendRedirect("changemobilenumber.jsp?msg=wrong");
			}
			else { 
				st.executeUpdate("update uinfo set mobilenumber='"+mobilenumber+"' where email='"+email+"'");
			response.sendRedirect("changemobilenumber.jsp?msg=done");  
			}
			
			st.close();
			con.close();
				
			}
			catch(Exception e) {
				
				System.out.println(e);
				response.sendRedirect("changemobilenumber.jsp?msg=invalid");
			}
			 
				
		
	}

}
