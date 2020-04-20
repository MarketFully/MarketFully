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

import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.admin.model.vo.AdminProductPagnation;
import com.kh.market.product.model.service.ProductService;
import com.kh.market.product.model.vo.Product;

@Controller
public class ProductController {

	
	@Autowired
	private ProductService pService;
	
	@RequestMapping(value ="AdminProductupdate.do",method=RequestMethod.POST)
	public ModelAndView Admin_Productupdate(Product p,
			ModelAndView mv ,
			@RequestParam(name="uploadimg",required=false , defaultValue = "") MultipartFile file,
			HttpServletRequest request) {
		 
			Product beforep = pService.getProductOne(p);//이전 상품정보 찾기
			
		
			
		
		if(!file.getOriginalFilename().equals("")) {//전 페이지에서 가져온 파일이 있을경우
			if(!beforep.getRenameFileName().equals(file.getOriginalFilename())) {//파일 변경이 있을 경우
			
			String renameFileName = saveFile(file,request);
			
			if(renameFileName != null) {
				p.setOriginalFileName(file.getOriginalFilename());
				p.setRenameFileName(renameFileName);
			}
		}
		}else {//전 페이지에서 가져온 파일이 없을경우
			p.setOriginalFileName(beforep.getOriginalFileName());
			p.setRenameFileName(beforep.getRenameFileName());
		}
		System.out.println(p);
		
		int result = pService.ProductUpdate(p);
		int listCount=pService.getListCount();
		if(result>0) {
			System.out.println("성공");
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
		public String ProductMainView() { 

			return "product/product";
		}

		@RequestMapping("Productdetail")
		public String ProductdetailView() {

			return "product/productdetail";
		}
		@RequestMapping("Productfish")
		public String ProductfishView() { 

			return "product/fish";
		}
		@RequestMapping("Productfruit")
		public String ProductfruitView() { 

			return "product/fruit";
		}
		@RequestMapping("Productmeet")
		public String ProductmeetView() { 

			return "product/meet";
		}
		@RequestMapping("Productmilk")
		public String ProductmilkView() { 

			return "product/milk";
		}
		@RequestMapping("Productsource")
		public String ProductsourceView() {

			return "product/source";
		}
		
		@RequestMapping("Productvegetable")
		public String ProductvegetableView() {
			
			return "product/vegetable";
		}
		
	

}
