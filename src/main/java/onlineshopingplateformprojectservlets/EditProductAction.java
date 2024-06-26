package onlineshopingplateformprojectservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;
import onlineshopingplateformprojectusefullclasses.Product;

import java.io.IOException;


@SuppressWarnings("serial")
@WebServlet("/editproductaction")
public class EditProductAction extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String pid=request.getParameter("pid");
		 String pname=request.getParameter("pname");
		 String pcategory=request.getParameter("pcategory");
		 String pprice=request.getParameter("pprice");
		 String active=request.getParameter("active");
		 Product p=new Product(pid,pname,pcategory,pprice,active);
		// DAO=data access object
		 MysqlDataAccess DAO=new MysqlDataAccess();
		 try {
				DAO.editProduct(p);
				response.sendRedirect(" adminfiles/allproducteditproduct.jsp?msg=valid");
			}
			catch(Exception e){
				System.out.println(e);
				response.sendRedirect("adminfiles/allproducteditproduct.jsp?msg=invalid");
			}
	}

}
