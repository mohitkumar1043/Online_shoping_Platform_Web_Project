package onlineshopingplateformprojectusefullclasses;

public class ChekPasswordStrongOrNot {
	 public boolean strongPasswordChecker(String password) {
	     int plength=password.length();
	     if(plength<8) {
	        return false;
	     }
	    boolean is_lowercase=false;
	    boolean is_uppercase=false;
	    boolean is_digit=false;
	    boolean is_special_char=false;
	    
	    for(int i=0;i<plength;i++){
	         
	            if('a' <= password.charAt(i) && password.charAt(i) <= 'z') is_lowercase = true;
	            else if('A' <= password.charAt(i) && password.charAt(i) <= 'Z') is_uppercase=true;
	            else if('0' <= password.charAt(i) && password.charAt(i) <= '9') is_digit = true;
	            else is_special_char=true;
	            if(i>0){
	                if(password.charAt(i)==password.charAt(i-1)) return false; 
	            }
	        }
	    

	    return is_lowercase&&is_uppercase&&is_digit&&is_special_char;

}
	 }
