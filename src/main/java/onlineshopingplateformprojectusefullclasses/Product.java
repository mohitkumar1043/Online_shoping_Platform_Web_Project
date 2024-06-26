
//  this class uses for creating product object
package onlineshopingplateformprojectusefullclasses;

public class Product {
	private String productid;
	   private String productname;
	   private String productcategory;
	   private String productprice;
	     private String active;
	     
	     // constructor
	public Product(String productid, String productname, String productcategory, String productprice, String active) {
		super();
		this.productid = productid;
		this.productname = productname;
		this.productcategory = productcategory;
		this.productprice = productprice;
		this.active = active;
	}
	public String getProductId() {
		return productid;
	}
	
	public String getProductName() {
		return productname;
	}
	
	public String getProductCategory() {
		return productcategory;
	}
	
	public String getProductPrice() {
		return productprice;
	}
	
	public String getActive() {
		return active;
	}
	
	   
	   
	
	
	
	
}
