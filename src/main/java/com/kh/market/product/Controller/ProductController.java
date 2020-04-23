package com.kh.market.product.Controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.admin.model.Service.CategoryService;
import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.admin.model.vo.AdminProductPagnation;
import com.kh.market.admin.model.vo.MainCategory;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.product.model.service.ProductService;
import com.kh.market.product.model.vo.Product;

@Controller
public class ProductController {

	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private CategoryService cService;
	
	
	@RequestMapping(value ="AdminProductupdate.do",method=RequestMethod.POST)
	public ModelAndView Admin_Productupdate(Product p,
			ModelAndView mv ,
			@RequestParam(name="uploadimg",required=false , defaultValue = "") MultipartFile file,
			HttpServletRequest request) {
		 
			Product beforep = pService.getProductOne(p);//�씠�쟾 �긽�뭹�젙蹂� 李얘린
			
		
			
		
		if(!file.getOriginalFilename().equals("")) {//�쟾 �럹�씠吏��뿉�꽌 媛��졇�삩 �뙆�씪�씠 �엳�쓣寃쎌슦
			if(!beforep.getRenameFileName().equals(file.getOriginalFilename())) {//�뙆�씪 蹂�寃쎌씠 �엳�쓣 寃쎌슦
			
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) {
				p.setOriginalFileName(file.getOriginalFilename());
				p.setRenameFileName(renameFileName);
			}
		}
		}else {//�쟾 �럹�씠吏��뿉�꽌 媛��졇�삩 �뙆�씪�씠 �뾾�쓣寃쎌슦
			p.setOriginalFileName(beforep.getOriginalFileName());
			p.setRenameFileName(beforep.getRenameFileName());
		}
		System.out.println(p);
		
		int result = pService.ProductUpdate(p);
		int listCount=pService.getListCount();
		if(result>0) {
			System.out.println("�꽦怨�");
		}
		AdminProductPageInfo pi = AdminProductPagnation.getPageInfo(1, listCount);
		  
		  ArrayList<Product> list = pService.getProductList(pi);
		  
		mv.addObject("list",list)
		  .addObject("pi",pi).setViewName
		("admin/adminproduct_list");
		
		return mv;
	}
	
		@RequestMapping(value = "Productinsert.do",method=RequestMethod.POST	)
		public String ProductInsert(Product p ,
				@RequestParam(name="uploadimg",required=false) MultipartFile file,
				HttpServletRequest request) {

			
			if(!file.getOriginalFilename().equals("")) {
				
				String renameFileName = saveFile(file,request);
				
				if(renameFileName != null) {
					p.setOriginalFileName(file.getOriginalFilename());
					p.setRenameFileName(renameFileName);
				}
			}
			
			System.out.println(p);
			int result = pService.productinsert(p);
		
			if(result > 0) {
			return "admin/adminproduct_list";
			}else {
				return "";
			}
		}
		
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\img\\Productuploadimg";
			
			File folder = new File(savePath);
			
			if(!folder.exists()) {
				folder.mkdir(); // 
			}
			
			String originFileName = file.getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
							+ originFileName.substring(originFileName.lastIndexOf(".")+1);
			
			System.out.println("renameFileName : " + renameFileName);
			
			String renamePath = folder + "\\"+ renameFileName;
			
			try {
				file.transferTo(new File(renamePath)); 
			}catch (Exception e) {
				System.out.println(e.getMessage());
			} 
			
			return renameFileName;
		}

		@RequestMapping("ProductMain")
		public ModelAndView ProductMainView(ModelAndView mv) { 

			
			ArrayList<MainCategory> maincatelist = cService.selectMainCategoryList();
			
			ArrayList<Product> fourProduct = new ArrayList<Product>();
			for(int i = 0 ; i < maincatelist.size();i++) {
				
				fourProduct.addAll(pService.getfourProductList(maincatelist.get(i).getCatecode1()));
			}
			
			System.out.println(fourProduct);
			
			
			
			
			mv.addObject("fourproductlist",fourProduct)
			  .addObject("mclist",maincatelist)
			  .setViewName("product/product");
			return mv;
		}

		@RequestMapping("ProductDetail")
		public ModelAndView ProductdetailView(ModelAndView mv,@RequestParam("pr_code") int pr_code) {

		Product p = new Product();
		p.setPr_code(pr_code);
		p = pService.getProductOne(p);

		mv.addObject("p",p).setViewName("product/productdetail");
			return mv;
		}
		
		
     	
		@RequestMapping("productsubselect")
		public ModelAndView Productsubcateselect(ModelAndView mv, 
				@RequestParam("maincate") String maincate,
				@RequestParam("subcate") String subcate,
				@RequestParam("maincatename") String maincatename,
				@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
			
			SubCategory subcatevo = new SubCategory();
			subcatevo.setUpcate(maincate);
			subcatevo.setCatecode2(subcate);
			
			int listCount = pService.lowerproductlistcount(subcatevo); // 카테고리에 맞는 갯수가져오기
			
			AdminProductPageInfo pi = AdminProductPagnation.getPageInfo(currentPage, listCount);
			ArrayList<Product> subcateproductlist = pService.selectlowerproduct(subcatevo,pi);//페이징처리
			ArrayList<SubCategory> subcatelist = cService.lowerSublist(maincate); //하위 카테고리 리스트 
			
			mv.addObject("pr", subcateproductlist)
			.addObject("currentPage",currentPage)
			.addObject("sc",subcatelist)
			.addObject("maincatename",maincatename)
			.addObject("maincate",maincate)
			.addObject("pi",pi)
			.setViewName("product/productchoosesubcate");
			
			return mv;
		}
		
		@RequestMapping("Productchoosecate")
		public ModelAndView Productchoosecate(ModelAndView mv,
				@RequestParam("catenum") String maincatenum,
				@RequestParam("maincatename") String maincatename,
				@RequestParam(value = "currentPage" ,defaultValue = "1") int currentPage) {
			
			
			
			ArrayList<Product> subproductlist = pService.choosecateList(maincatenum); //그냥 전체 리스트
			int listCount = subproductlist.size();
			AdminProductPageInfo pi = AdminProductPagnation.getPageInfo(currentPage, listCount);
			subproductlist = pService.pagingchoosecateList(maincatenum,pi);//페이징 처리된 전체 리스트
			System.out.println(subproductlist.size());
			ArrayList<SubCategory> subcatelist = cService.lowerSublist(maincatenum); //하위 카테고리 리스트 
			
			mv.addObject("pr",subproductlist)
			.addObject("sc",subcatelist)
			.addObject("pi",pi)
			.addObject("maincatename",maincatename)
			.setViewName("product/productchoosecate");
			
			return mv;
		}
	

}
