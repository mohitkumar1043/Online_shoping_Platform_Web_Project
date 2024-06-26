 
// this class object  use for  connect database and performing mysql querys
package onlineshopingplateformprojectusefullclasses;
import java.sql.*;
public class MysqlDataAccess {
 	Connection con=null;
 	
 	public Connection getCon() {
 		return con;
 	}
    
    // connection stabilize  function 
    public void  getConnection() {
    	
    	try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/ospd";
        String user="root";
        String password="";
        con=DriverManager.getConnection(url, user, password);
    	}
    	catch(Exception e) {
    		System.out.println(e);
    	}
    	
    } 
    
 // function for add userinfo in database
    public void addUser(User u)throws Exception{
    	 
       String query="insert into uinfo values(?,?,?,?,?,?,?,?,?,?)";
       // calling connection stabilize  function 
          getConnection();
       PreparedStatement pst=con.prepareStatement(query);
       pst.setString(1,u.getName());  
       pst.setString(2,u.getEmail());
       pst.setString(3, u.getMobilenumber());
       pst.setString(4, u.getSecurityquestion());
       pst.setString(5, u.getSqanswer());
       pst.setString(6, u.getPassword());
       pst.setString(7, u.getAddress());
       pst.setString(8, u.getCity());
       pst.setString(9, u.getState());
       pst.setString(10, u.getCountry());
       pst.executeUpdate();
       pst.close();
         con.close();
       
    }
    
       // function for cheking user  email and password exist or not in database 
    public boolean chekUser (String email,String password) throws Exception {
       
    	int x=0;
        
          getConnection();
        String query="select * from uinfo  where email='"+email+"'and password='"+password+"'";
          Statement st=con.createStatement();
          ResultSet rs=st.executeQuery(query);
          while(rs.next()) {
        	  x++;  
          }
        st.close();
         con.close();
        
        if(x==1) {
        	return true;
        }
        else {
      return false; 
      
        }
    }
    
    // function for forgot password in database
    public boolean changePassword (User u) throws Exception {
       
    	
        int x=0;
          getConnection();
        String query="select * from uinfo  where email='"+u.getEmail()+"'and mobilenumber='"+u.getMobilenumber()+"'and securityquestion='"+u.getSecurityquestion()+ "'and answer='"+u.getSqanswer()+"'";
          Statement st=con.createStatement();
          ResultSet rs=st.executeQuery(query);
          while(rs.next()) {
        	  
        	  x++;
        	  
          }
          
          
       if(x==1)  {
    	   st.executeUpdate("update uinfo set password='"+u.getPassword()+"'where email='"+u.getEmail()+"'");
    	   st.close();
           con.close();
    	   return true;
       }
       else {
    	   st.close();
           con.close();
    	   return false;
       }
        
     
        
    }
    
    // function for getting  product id thats  function will be called when addnewproduct page calling by admin
    
    public int getProductId() throws Exception {
    	int id=0;
    	getConnection();
        String query="select max(id) from product";
          Statement st=con.createStatement();
          ResultSet rs=st.executeQuery(query);
          while(rs.next()) {
        	id=rs.getInt(1)+1;
        	
          }
          st.close();
          con.close();
          return id;
          
    }
 // function for add product in database
    public void addProduct(Product p)throws Exception{
    	 
       String query="insert into product values(?,?,?,?,?)";
       // calling connection stabilize  function 
          getConnection();
       PreparedStatement pst=con.prepareStatement(query);
       pst.setString(1,p.getProductId());  
       pst.setString(2,p.getProductName());
       pst.setString(3,p.getProductCategory());
       pst.setString(4,p.getProductPrice());
       pst.setString(5,p.getActive());
       
       pst.executeUpdate();
       pst.close();
         con.close();
       
    }
    
  // function for edit product in database   
    
    public void editProduct(Product p)throws Exception{
   	 
        String query="update product set name='"+p.getProductName()+"',category='"+p.getProductCategory()+"',price='"+p.getProductPrice()+"', active='"+p.getActive()+"'where id='"+p.getProductId()+"'";
        // calling connection stabilize  function 
           getConnection();
           Statement st=con.createStatement();
        st.executeUpdate(query);
        if(p.getActive().equals("no")) {
        	String q="delete from cart where productid='"+p.getProductId()+"' and address is NULL";
        	st.executeUpdate(q);
        }
        st.close();
          con.close();
        
     }
 
    
    
    
    
}
