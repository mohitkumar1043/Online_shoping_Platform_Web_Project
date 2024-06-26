// this servlet will be called after cliked on proceed to order button

package onlineshopingplateformprojectservlets;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlineshopingplateformprojectusefullclasses.MysqlDataAccess;
import java.sql.*;
import java.io.IOException;

@WebServlet("/proceedtoorderaction")
@SuppressWarnings("serial")
public class ProceedToOrderAction extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		String paymentmethod=request.getParameter("paymentmethod");
	    String transactionid=request.getParameter("transactionid");
		String mobilenumber=request.getParameter("mobilenumber");
		String status="bill";
		
		// DAO=data access object
		MysqlDataAccess DAO=new MysqlDataAccess();
		
		try {
		   	DAO.getConnection();
		   	Connection con=DAO.getCon();
		   	// if we got empty string on address when we will update user address and other empty info;
		   	String query1="select * from uinfo where email='"+email+"'";
		    Statement st=con.createStatement();
		    ResultSet rs=st.executeQuery(query1);
		     String chekaddress="";
		    while(rs.next()) {
		    	  chekaddress=rs.getString(7);
		    }
		    st.close();
			if(chekaddress.equals("")) {
				String query2="update uinfo set address=?,city=?,state=?,country=? where email=?";
			 PreparedStatement pst1=con.prepareStatement(query2);
				pst1.setString(1,address);
				pst1.setString(2,city);
				pst1.setString(3,state);
				pst1.setString(4,country);
				pst1.setString(5,email);
				pst1.executeUpdate();
			       pst1.close();
				
			}
			
			String query3="update cart set address=?,city=?,state=?,country=?,mobilenumber=?,orderdate=now(),deliverydate=DATE_ADD(orderdate,INTERVAL 7 DAY),paymentmethod=?,transactionid=?,status=? where email=? and address is NULL";
			PreparedStatement pst2=con.prepareStatement(query3);
			pst2.setString(1,address);
			pst2.setString(2,city);
			pst2.setString(3,state);
			pst2.setString(4,country);
			pst2.setString(5,mobilenumber);
			pst2.setString(6,paymentmethod);
			pst2.setString(7,transactionid);
			pst2.setString(8,status);
			pst2.setString(9,email);
			pst2.executeUpdate();
			pst2.close();
			con.close();
			response.sendRedirect("bill.jsp");
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
	}

}
