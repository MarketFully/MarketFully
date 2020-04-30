package com.kh.market.recipe.Controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.market.admin.model.Service.CategoryService;
import com.kh.market.admin.model.vo.MainCategory;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.common.Pagination;
import com.kh.market.member.model.vo.Favorite;
import com.kh.market.mirotic.model.vo.SHIPPING;
import com.kh.market.product.model.vo.Product;
import com.kh.market.recipe.model.Service.BoardService;
import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.BoardExp;
import com.kh.market.recipe.model.vo.BoardProduct;
import com.kh.market.recipe.model.vo.BoardReply;
import com.kh.market.recipe.model.vo.Menu_Category;
import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.recipe.model.vo.SearchInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("clist")
public class RecipeController {
	
	@Autowired
	private BoardService bService;
	@Autowired
	private CategoryService cService;

	@RequestMapping("recipeinsertpage")
	public ModelAndView recipeinsertpage(Board b, Model model,HttpServletRequest request,ModelAndView mv) { //유저 레시피 작성 페이지로 이동
		
		//회원 아이디 등등 을 가지고 작성 페이지로 이동
		
		 ArrayList<MainCategory> mc = cService.selectMainCategoryList();
		 //ArrayList<SubCategory> sc = cService.selectSubCategoryList();
         if(mc!=null) {
            mv.addObject("maincate", mc) 
            //mv.addObject("subcate",sc)
            .setViewName("recipe/recipeinsert");
         }
         
       return mv; 
	}

	 @RequestMapping("maincate_subcatesearch") //json으로 서브 카테고리 가져오기
		public void admin_maincategoryView(HttpServletResponse response,
											String selectValue ,String longi) throws JsonIOException, IOException {
			
			//ArrayList<SubCategory> sc = cService.selectSubCategoryList();
			ArrayList<SubCategory> subcatelist = cService.lowerSublist(selectValue); 
			response.setContentType("application/json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().create();
			
			gson.toJson(subcatelist,response.getWriter());
		}
	 
	 @RequestMapping("maincate_subcatesearch_product")
		public void admin_maincategoryView2(HttpServletResponse response, Model m,
											Product pp,String longi) throws JsonIOException, IOException {
			
			//ArrayList<SubCategory> sc = cService.selectSubCategoryList();
//			ArrayList<SubCategory> subcatelist = cService.lowerSublist(selectValue);
			ArrayList<Product> subcatelist_product = cService.lowerSublist_product(pp); 
			response.setContentType("application/json; charset=UTF-8");
			
			m.addAttribute("subcatelist_product",subcatelist_product);
			
			Gson gson = new GsonBuilder().create();
			
			gson.toJson(subcatelist_product,response.getWriter());
		}
	 
		@RequestMapping("recipeinsert")//BoardProduct bp
		public String recipeinsert(Board b,
				BoardExp be,BoardProduct bp,
				@RequestParam("pcode") String pcode,
				@RequestParam("peach") String peach,
				Model model,HttpServletRequest request,
				@RequestParam(name="mainImg",required=false) MultipartFile file,
				@RequestBody ArrayList<MultipartFile> subImg){ //유저 레시피 작성 (DB)
			
			
			ArrayList<BoardProduct> bplist = new ArrayList<BoardProduct>();
			
			
			if(!file.getOriginalFilename().equals("")) {
				// 서버에 업로드
				// saveFile메소드 : 내가 저장하고자하는 file과 request를 전달하여 서버에 업로드 시키고 그 저장된 파일명을 반환해주는 메소드
				
				String renameFileName = saveFile(file,request, 0);
				
				if(renameFileName != null) {
					b.setMb_origin(file.getOriginalFilename());// DB에는 파일명 저장
					b.setMb_rename(renameFileName);
				}
			}
			int result = bService.insertRecipe(b);
			//------------------------------------------------------
			String[] pcodelist = pcode.split(",");
			String[] peachlist = peach.split(",");
			for(int i = 0 ; i< pcodelist.length;i++) {
				int pcodeint = Integer.parseInt(pcodelist[i]);
				int peachint = Integer.parseInt(peachlist[i]);
				bplist.add(new BoardProduct(0,pcodeint,peachint));
				
				
				int result2 = bService.insertProductRecipe(bplist.get(i));
			}
			
			
			//------------------------------------------------------
			String[] beContent = be.getContent().split(",&&,");
			int i = 1;
			for(MultipartFile filea : subImg) {
				if(!filea.getOriginalFilename().equals("")) {
					
					String renameFileName = saveFile(filea,request, i);
					
					if(renameFileName != null) {
						if(subImg.size() == i) {
							be.setContent(beContent[i-1].substring(0,(beContent[i-1].length()-3)));
						}else {
							be.setContent(beContent[i-1]);
						}
						be.setOrigin(filea.getOriginalFilename());// DB에는 파일명 저장
						be.setRename(renameFileName);
						be.setSeq(i);
						int result3 = bService.insertExpRecipe(be);
						i++;
					}
					
				}
			}
			if(result > 0) {
				return "redirect:RecipeUser";
			}else {
				return "common/errorPage";
			}
		}
		
		public String saveFile(MultipartFile file, HttpServletRequest request, int i) {
			// 저장할 경로 설정
			// 웹 서버 contextPath를 불러와서 폴더의 경로 찾음(webapp 하위의 resources)
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\/img/userRecipe";
			
			File folder = new File(savePath);
			
			if(!folder.exists()) {
				folder.mkdir(); // 폴더가 없다면 생성해주세요
			}
			
			String originFileName = file.getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "SEQ"+i +"."
							+ originFileName.substring(originFileName.lastIndexOf(".")+1);
			
			
			String renamePath = folder + "\\"+ renameFileName;
			
			try {
				file.transferTo(new File(renamePath)); // 이때 전달받은 file이 rename명으로 저장이된다.
			}catch (Exception e) {
			} 
			
			return renameFileName;
		}

	@RequestMapping("RecipeJap")
	public String recipeJapView() { //일식 레시피 이동하는 메소드

		return "recipe/foodkindJapan";
	}

	@RequestMapping("RecipeChi")
	public String recipeChiView() { //중식 레시피 이동하는 메소드

		return "recipe/foodkindchina";
	}

	@RequestMapping("RecipeGui")
	public String recipeGuiView() { //기타 레시피 이동하는 메소드

		return "recipe/foodkindGui";
	}
	
	@RequestMapping("TvRecipetopten")
	public ModelAndView TvrecipeToptenView(ModelAndView mv) { // TvTop10 레시피 이동하는 메소드

		ArrayList<Board> list = bService.TvTop10selectList();
		
		mv.addObject("list", list);
		mv.addObject("TvOrUser", "tv");
		mv.setViewName("recipe/topten");
		
		return mv;
	}
	@RequestMapping("UserRecipetopten")
	public ModelAndView UserrecipeToptenView(ModelAndView mv) { //UserTop10 레시피 이동하는 메소드
		
		ArrayList<Board> list = bService.UserTop10selectList();
		
		mv.addObject("list", list);
		mv.addObject("TvOrUser", "user");
		mv.setViewName("recipe/topten");
		
		return mv;
	}
	
	
	
	  @RequestMapping("tvCateList") 
	public ModelAndView tvCateList(ModelAndView mv, @RequestParam(defaultValue="0")int mc_cate_num) { //TV속 레시피 카테고리 리스트
	  
		  
	  ArrayList<Menu_Category> clist = bService.TvCateList();
	  mv.addObject("clist", clist);
	  
	  
		int listCount = bService.getTvListCount(mc_cate_num);
		
		int currentPage = 1;
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
	  
	  ArrayList<Board> blist = bService.TvBoardList(pi, mc_cate_num);
	  
	  
	  mv.addObject("blist", blist);
	  
	  mv.addObject("mc_cate_num", mc_cate_num);
		mv.addObject("pi",pi);
		mv.addObject("pageValue", "tvBoardList");
		mv.addObject("TvOrUser", "tv");
		
	  mv.setViewName("recipe/tvRecipe");
	  
	  
	  return mv; 
	  }
	
	
	@RequestMapping("tvBoardList")
	public ModelAndView tvBoardList(ModelAndView mv
									, @RequestParam(defaultValue="-1")int mc_cate_num //// mc_cate_num 값이 -1이면 오류페이지로 가게 처리해야함
									, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			) { // 카테고리에 맞는 tv속 레시피 리스트 
			
		if(mc_cate_num == -1) {
			//오류 페이지로 

			mv.setViewName("index.jsp");			
			return mv;
			
		}else {
			//전체 페이지
			int listCount = bService.getTvListCount(mc_cate_num);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Board> blist = bService.TvBoardList(pi, mc_cate_num);
			
			mv.addObject("blist",blist);
			mv.addObject("mc_cate_num", mc_cate_num);
			mv.addObject("pi",pi);
			mv.addObject("pageValue", "tvBoardList");
			mv.addObject("TvOrUser", "tv");
			
			mv.setViewName("recipe/tvRecipe");
			
			return mv;
		}
	}
	
	
	@RequestMapping("tvSearchList")
	public ModelAndView tvRecipeSrc(ModelAndView mv
							, @RequestParam(defaultValue="-1")int mc_cate_num	//값이 -1이면 에러 
							, @RequestParam(defaultValue="-1") String src_cate	//값이 -1이면 에러
							, @RequestParam(defaultValue="") String src_input	// 값이 ""이면 그냥 리스트로 보낸다.
							, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
			
			) {	//tc 레시피 검색 결과 리스트
		
		//예외 처리 (오류페이지는 없으니까 처리 안함)
//		if(src_input.equals("")) {
//			//값이 ""없으면 그냥 전체 리스트를 띄운다.
//			int listCount = bService.getTvListCount(0);
//			
//			PageInfo pi = Pagination.getPageInfo(1, listCount);
//			
//			ArrayList<Board> blist = bService.TvBoardList(pi, 0);
//			
//			mv.addObject("blist",blist);
//			mv.addObject("mc_cate_num", 0);
//			mv.addObject("pi",pi);
//			mv.addObject("pageValue", "tvBoardList");
//			
//			mv.setViewName("recipe/tvRecipe");
//			
//			return mv;
//		}
		
		
		
		// 시작
		
		SearchInfo si = new SearchInfo();
		
		
		si.setMc_cate_num(mc_cate_num);
		si.setSrc_cate(src_cate);
		si.setSrc_input(src_input);
		
		
		int listCount = bService.getTvSearchListCount(si);
		
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> blist = bService.TvSearchList(pi, si);
		
		mv.addObject("blist",blist);
		mv.addObject("mc_cate_num", mc_cate_num);
		mv.addObject("pi",pi);
		mv.addObject("si",si);
		mv.addObject("pageValue", "tvSearchList");
		mv.addObject("TvOrUser", "tv");
		mv.setViewName("recipe/tvRecipe");
		
		return mv;
	}
	
	@RequestMapping("userSearchList")
	public ModelAndView userRecipeSrc(ModelAndView mv
							, @RequestParam(defaultValue="-1")int mc_cate_num	//값이 -1이면 에러 
							, @RequestParam(defaultValue="") String src_input	// 값이 ""이면 그냥 리스트로 보낸다.
							, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, String TvOrUser
			
			) {	
		// 시작
		
		SearchInfo si = new SearchInfo();
		
		
		si.setMc_cate_num(mc_cate_num);
		si.setSrc_input(src_input);
		
		
		int listCount = bService.getUserSearchListCount(si);
		
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = bService.UserSearchList(pi, si);
		
		mv.addObject("list",list);
		mv.addObject("mc_cate_num", mc_cate_num);
		mv.addObject("pi",pi);
		mv.addObject("si",si);
//		mv.addObject("pageValue", "tvSearchList");
		mv.addObject("TvOrUser", "user");
		mv.setViewName("recipe/userRecipe");
		
		return mv;
	}
	
	
/*	@RequestMapping("RecipeUser") // 사용자 레시피1
	public ModelAndView recipeUserView(ModelAndView mv, 
									@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) { // 사용자 레시피
		
		
		int listCount = bService.getListCount();
		
		
		PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
		
		ArrayList<Board> list = bService.UserselectList(pi);
			
		mv.addObject("list", list);
		mv.addObject("TvOrUser", "user");
		mv.addObject("pi",pi);
		mv.setViewName("recipe/temp_userRecipe");
		
		return mv;
	}*/
	
	@RequestMapping("RecipeUser") // 사용자 레시피 2
	public ModelAndView recipeUserView(ModelAndView mv) { 
		
		ArrayList<Board> kolist = bService.UserselectList_ko();
		ArrayList<Board> enlist = bService.UserselectList_en();
		ArrayList<Board> jplist = bService.UserselectList_jp();
		ArrayList<Board> chlist = bService.UserselectList_ch();
		ArrayList<Board> etclist = bService.UserselectList_etc();
		
		mv.addObject("kolist", kolist);
		mv.addObject("enlist", enlist);
		mv.addObject("jplist", jplist);
		mv.addObject("chlist", chlist);
		mv.addObject("etclist", etclist);
		
		mv.addObject("TvOrUser", "user");
		mv.setViewName("recipe/temp_userRecipe");
		
		return mv; 
	}
	
	@RequestMapping("RecipeList")
	public String recipeUserView() { //TV속 레시피 이동하는 메소드

		return "recipe/userRecipe";
	}
	
	@RequestMapping("RecipeDetail")
	public ModelAndView recipeDetailView(ModelAndView mv, int bId,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, String TvOrUser) { //레시피 자세히 보는 페이지로 이동하는 메소드
		
		
		if(TvOrUser.equals("user")) {
			Board b = bService.USERselectBoard(bId);
			if(b != null) {
				mv.addObject("b",b).addObject("me_num", 2)
				  .addObject("currentPage",currentPage)
				  .addObject("bId",bId)
				  .addObject("TvOrUser",TvOrUser)
				  .setViewName("recipe/recipedetail");
			}else {
				mv.addObject("msg","게시글 상세조회 실패")
				  .setViewName("common/errorPage");
			}
		}else {
			Board b = bService.TVselectBoard(bId);
			if(b != null) {
				mv.addObject("b",b).addObject("me_num", 1)
				  .addObject("currentPage",currentPage)
				  .addObject("bId",bId)
				  .addObject("TvOrUser",TvOrUser)
				  .setViewName("recipe/recipedetail");
			}else {
				mv.addObject("msg","게시글 상세조회 실패")
				  .setViewName("common/errorPage");
			}
		}
		
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("heartcheck")
	public String heartcheckcheck(Board b,HttpServletRequest request,int bId,String TvOrUser, 
			@RequestParam(value="mem_num", required=false,defaultValue="0") int mem_num) {
		
		if(mem_num == 0) {
			return "nologin";
		}
		
		int me_num; 
		if(TvOrUser.equals("user")) {
			me_num = 2;
		}else {
			me_num = 1;
		}
		Favorite f = new Favorite();
		f.setMem_num(mem_num);
		f.setMb_bo_num(bId);
		f.setMe_num(me_num);
		
		if(TvOrUser.equals("user")) {
			int result = bService.USERheartChek(f);
			if(result > 0) {
				
				return "ok";
			}else {
				return "fail";
			}
		}else {
			int result = bService.TVheartCheck(f);
			if(result > 0) {
				return "ok";
			}else {
				return "fail";
			}
		}
	}
	
	@ResponseBody
	@RequestMapping("heartplus")
	public String heartcheck(Board b,HttpServletRequest request,int bId,String TvOrUser, int mem_num) { 
		
		
		int me_num; 
		if(TvOrUser.equals("user")) {
			me_num = 2;
		}else {
			me_num = 1;
		}
	
		Favorite f = new Favorite();
		f.setMem_num(mem_num);
		f.setMb_bo_num(bId);
		f.setMe_num(me_num);
		
		if(TvOrUser.equals("user")) {
			
			int result = bService.USERheartPlus(f);
			int result2 = bService.USERheratCount(f);
			if(result > 0) {
				
				return "ok";
			}else {
				return result2+"";
			}
		}else {
			int result = bService.TVheartPlus(f);
			int result2 = bService.TVheratCount(f);
			if(result > 0) {
				return "ok";
			}else {
				return result2+"";
			}
		}
	}
	@ResponseBody
	@RequestMapping("heartminus")
	public String heartcheck2(Board b,HttpServletRequest request,int bId,String TvOrUser,int mem_num) { 
		
		
		int me_num; 
		if(TvOrUser.equals("user")) {
			me_num = 2;
		}else {
			me_num = 1;
		}
		
		Favorite f = new Favorite();
		f.setMem_num(mem_num);
		f.setMb_bo_num(bId);
		f.setMe_num(me_num);
		
		if(TvOrUser.equals("user")) {
			
			int result = bService.USERheartMinus(f);
			int result2 = bService.USERheratCount(f);
			if(result > 0) {
				return "ok";
			}else {
				return result2+"";
			}
		}else {
			int result = bService.TVheartMinus(f);
			int result2 = bService.TVheratCount(f);
			if(result > 0) {
				return "ok";
			}else {
				return result2+"";
			}
		}
	}
	
	// 레시피 등록
	@RequestMapping("insertReply")
	@ResponseBody
	public String insertReply(BoardReply r,String TvOrUser) {
		
		if(TvOrUser.equals("user")) {
			int result = bService.userInsertReply(r);
	
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}else {
			int result = bService.tvInsertReply(r);
	
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
	}
	
	// 레시피 댓글 삭제
	@RequestMapping("deleteReply")
	public String deleteReply(Model model,int rId,int bId,String TvOrUser, HttpServletRequest request) {

		if(TvOrUser.equals("user")) {
			int result = bService.userDeleteReply(rId);
			
			if(result > 0) {
				return "redirect:RecipeDetail?bId="+bId+"&TvOrUser="+TvOrUser;
			}else {
				model.addAttribute("msg","삭제 시 실패");
				return "common/errorPage";
			}
		}else {
			int result = bService.tvDeleteReply(rId);
			
			if(result > 0) {
				return "redirect:RecipeDetail?bId="+bId+"&TvOrUser="+TvOrUser;
			}else {
				model.addAttribute("msg","삭제 시 실패");
				return "common/errorPage";
			}
		}
		
	}
	
	@RequestMapping("shippingtrace")
	public ModelAndView shiptrace(ModelAndView mv) {
		ArrayList<SHIPPING> splist = bService.shippinglist();
		System.out.println("쉬핑 리스트 : " + splist);
		mv.addObject("splist", splist);
		mv.setViewName("admin/trace2");
		
		return mv;
	}

}
