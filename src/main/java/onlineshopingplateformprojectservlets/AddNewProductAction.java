// that servlet will be calling after clicking by admin addnewproduct button

package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;
import onlineshopingplateformprojectusefullclasses.Product;

@SuppressWarnings("serial")
@WebServlet("/addnewproductaction")
public class AddNewProductAction extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productid=request.getParameter("productid"); 
		String productname=request.getParameter("productname");  
		String productcategory=request.getParameter("productcategory");  
		String productprice=request.getParameter("productprice");  
		String active=request.getParameter("active");  
	// creating product class object;
		Product p=new Product( productid,productname,productcategory,productprice,active);
		// DAO=data access object
				MysqlDataAccess DAO=new MysqlDataAccess();
				
				try {
					DAO.addProduct(p);
					response.sendRedirect(" adminfiles/addnewproduct.jsp?msg=valid");
				}
				catch(Exception e){
					System.out.println(e);
					response.sendRedirect("adminfiles/addnewproduct.jsp?msg=invalid");
				}
				
		
	}

}
