 

//  this class uses for creating User object
package onlineshopingplateformprojectusefullclasses;

public class User {
   private String name;
   private String email;
   private String mobilenumber;
   private String securityquestion;
   private String sqanswer;
   private String password;
   private String address;
   private String city;
   private String state;
   private String country;
    // this constructor will be called by signup servlet
public User(String name, String email, String mobilenumber, String securityquestion, String sqanswer, String password,
		String address, String city, String state, String country) {
	super();
	this.name = name;
	this.email = email;
	this.mobilenumber = mobilenumber;
	this.securityquestion = securityquestion;
	this.sqanswer = sqanswer;
	this.password = password;
	this.address = address;
	this.city = city;
	this.state = state;
	this.country = country;
}
//this constructor will be called by forgotpasswordaction servlet
public User(String email, String mobilenumber, String securityquestion, String sqanswer,String password) {
	super();
	this.email = email;
	this.mobilenumber = mobilenumber;
	this.securityquestion = securityquestion;
	this.sqanswer = sqanswer;
	this.password=password;
}

public String getName() {
	return name;
}

public String getEmail() {
	return email;
}

public String getMobilenumber() {
	return mobilenumber;
}

public String getSecurityquestion() {
	return securityquestion;
}

public String getSqanswer() {
	return sqanswer;
}

public String getPassword() {
	return password;
}

public String getAddress() {
	return address;
}

public String getCity() {
	return city;
}

public String getState() {
	return state;
}

public String getCountry() {
	return country;
}
   
   
}
