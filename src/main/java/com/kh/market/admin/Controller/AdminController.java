package com.kh.market.admin.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("adminmain")
	public String admin_mainView() {
		return "admin/adminmain";
	}
	
	
	 @RequestMapping("admincategory") 
	 public String admin_categoryView() {
		 return "admin/admincategory"; 
		 }
	  
	
	  @RequestMapping("adminrecipe_user") 
	  public String admin_modify_userView() { 
		  return "admin/adminrecipe_USER"; }
	 
	  @RequestMapping("adminrecipe_tv") 
	  public String admin_modify_tvView() { 
		  return "admin/adminrecipe_TV"; 
		  }
	 
	  @RequestMapping("adminServiceCenter") 
	  public String admin_SerivceCenterView() { 
		  return "admin/adminnotice"; 
		  }
	  
	  @RequestMapping("adminmodify_user") 
	  public String adminmodify_userView() { 
		  return "admin/adminmodify_user"; 
		  }
	  
	  @RequestMapping("adminproduct_Insert")
	  public String adminprodutct_InsertView() { 
		  return "admin/adminproduct_Insert"; 
		  }
	  
	  @RequestMapping("adminproduct_list")
	  public String adminprodutct_ListView() { 
		  return "admin/adminproduct_list"; 
		  }
	  @RequestMapping("categorysee")
	  public String admincategory_seeView() {
		  return "admin/categorysee";
	  }
	  
	 
}
