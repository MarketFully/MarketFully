package com.kh.market.product.Controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.market.admin.model.Service.CategoryService;
import com.kh.market.product.model.service.ProductService;
import com.kh.market.product.model.vo.Product;

@Controller
public class ProductController {

	
	@Autowired
	private ProductService pService;
	
		@RequestMapping(value = "Productinsert.do",method=RequestMethod.POST)
		public String ProductInsert(Product p ,
				@RequestParam(name="uploadimg",required=false) MultipartFile file,
				HttpServletRequest request) {

			
			if(!file.getOriginalFilename().equals("")) {
				// 서버에 업로드
				// saveFile메소드 : 내가 저장하고자하는 file과 request를 전달하여 서버에 업로드 시키고 그 저장된 파일명을 반환해주는 메소드
				
				String renameFileName = saveFile(file,request);
				
				if(renameFileName != null) {
					p.setOriginalFileName(file.getOriginalFilename());// DB에는 파일명 저장
					p.setRenameFileName(renameFileName);
				}
			}
			
			System.out.println(p);
			int result = pService.productinsert(p);
		
			if(result > 0) {
			return "product/product";
			}else {
				return "";
			}
		}
		
		public String saveFile(MultipartFile file, HttpServletRequest request) {//파일 업로드 메소드
			// 저장할 경로 설정
			// 웹 서버 contextPath를 불러와서 폴더의 경로 찾음(webapp 하위의 resources)
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\buploadFiles";
			
			File folder = new File(savePath);
			
			if(!folder.exists()) {
				folder.mkdir(); // 폴더가 없다면 생성해주세요
			}
			
			String originFileName = file.getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
							+ originFileName.substring(originFileName.lastIndexOf(".")+1);
			
			System.out.println("renameFileName : " + renameFileName);
			
			String renamePath = folder + "\\"+ renameFileName;
			
			try {
				file.transferTo(new File(renamePath)); // 이때 전달받은 file이 rename명으로 저장이된다.
			}catch (Exception e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
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
