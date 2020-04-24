package com.kh.market.admin.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.market.admin.model.Service.CategoryService;
import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.admin.model.vo.AdminProductPagnation;
import com.kh.market.admin.model.vo.MainCategory;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.product.model.service.ProductService;
import com.kh.market.product.model.vo.Product;
@Controller
public class AdminController {
 
	
	@Autowired
	private CategoryService cService;
	
	@Autowired
	private ProductService pService;
	
	@RequestMapping(value="cateupload.do",method=RequestMethod.GET)
	public String admin_cateupload(Model mv,
			@RequestParam(value="maincateY-index") String maincateY_index,
			@RequestParam(value="subcateY-index") String subcateY_index,
			@RequestParam(value="maincatecode") String catecode,
			@RequestParam(value="maincatename") String catename,
			@RequestParam(value="subcatecode") String subcatecode,
			@RequestParam(value="subcatename") String subcatename,
			@RequestParam(value="parentmaincode") String parentmaincode) {
		
		int delete = cService.deleteCategory();
	
		
		String[] maincodearr = catecode.split(",");
		String[] mainnamearr = catename.split(",");
		String[] maincateY_indexarr = maincateY_index.split(",");
		
		for(int i=0;i<maincodearr.length;i++) {
			MainCategory c = new MainCategory(maincodearr[i],mainnamearr[i],maincateY_indexarr[i]);
			
			System.out.println("catecode : " + maincodearr[i] + ", catename :  " + mainnamearr[i]);
			int mainupdate = cService.updateCategory(c);
			
			
		}
		
		/////////////////////////////////////////////
		String[] subcatecodearr = subcatecode.split(",");
		String[] subcatenamearr = subcatename.split(",");
		String[] parentmaincodearr = parentmaincode.split(",");
		String[] subcateY_indexarr = subcateY_index.split(",");
		
		System.out.println(subcatecodearr);
		System.out.println(subcatenamearr);
		System.out.println(parentmaincodearr);
		
		int delsubcate = cService.deleteSubCategory();
		
		for(int i= 0 ;i<subcatecodearr.length; i++) {
			SubCategory sc = new SubCategory(parentmaincodearr[i],subcatecodearr[i],subcatenamearr[i],subcateY_indexarr[i]);
			int updatesub = cService.updatesubCategory(sc);
		}
		return "admin/adminmain"; 
		
	}
	
	
	@RequestMapping("AdminProductDetail")
	public ModelAndView Admin_ProductDetail(@RequestParam("pr_code") int PR_CODE,
			ModelAndView mv) {
		Product p = new Product();
		p.setPr_code(PR_CODE);
		
		p = pService.getProductOne(p);
		
		mv.addObject("p",p).setViewName("admin/adminproductdetail");
		
		return mv;
	}
	

	
	@RequestMapping("AdminProductmodify")
	public ModelAndView Admin_Productmodify(@RequestParam("pr_code") int PR_CODE,
			ModelAndView mv) {
		Product p = new Product();
		p.setPr_code(PR_CODE);
		
		p = pService.getProductOne(p);
		
		mv.addObject("p",p).setViewName("admin/adminproduct_modify");
		
		return mv;
	}
	
	@RequestMapping("adminmain")
	public String admin_mainView() {
		return "admin/adminmain";
	}
	
	
	 @RequestMapping("admincategory") 
	 public ModelAndView admin_categoryView(ModelAndView mv) {
		 
		 ArrayList<MainCategory> mc = cService.selectMainCategoryList();
			if(mc!=null) {
				mv.addObject("maincate", mc) //
				.setViewName("admin/admincategory");
				
			}
			
		 return mv; 
		 }
	  
	 
	 @RequestMapping("admincategory2")
		public void admin_categoryView(HttpServletResponse response) throws JsonIOException, IOException {
			
			ArrayList<SubCategory> sc = cService.selectSubCategoryList();
			
			response.setContentType("application/json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().create();
			
			gson.toJson(sc,response.getWriter());
			
		}
	 @RequestMapping("adminsubgory") //json 이용한 서브 카테고리 가져오기
		public void admin_subcategoryView(HttpServletResponse response) throws JsonIOException, IOException {
			
			ArrayList<SubCategory> sc = cService.selectSubCategoryList();
			response.setContentType("application/json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().create();
			
			gson.toJson(sc,response.getWriter());
			
		}
	 

	 
	 @RequestMapping("adminmaincategory") //json으로 서브 카테고리 가져오기
		public void admin_maincategoryView(HttpServletResponse response) throws JsonIOException, IOException {
			
			ArrayList<MainCategory> mc = cService.selectMainCategoryList();
			response.setContentType("application/json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().create();
			
			gson.toJson(mc,response.getWriter());
			
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
	  public ModelAndView adminprodutct_ListView(ModelAndView mv,
			  @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) { 
		  
		  System.out.println(currentPage);
		  
		  int listCount=pService.getListCount();
		  
		  System.out.println("listCount = " + listCount);
		  
		  AdminProductPageInfo pi = AdminProductPagnation.getPageInfo(currentPage, listCount);
		  
		  ArrayList<Product> list = pService.getProductList(pi);
		  
		  System.out.println(list);
		  
		  if(list!=null) {
			  mv.addObject("list",list)
			  .addObject("pi",pi)
			  .setViewName("admin/adminproduct_list");
		  }
		  return mv; 
		  
		  }
	  @RequestMapping("categorysee")
	  public String admincategory_seeView() {
		  return "admin/categorysee";
	  }
	  
	  
	  
	 
}
