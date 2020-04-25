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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.market.admin.model.Service.CategoryService;
import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.admin.model.vo.AdminProductPagnation;
import com.kh.market.admin.model.vo.MainCategory;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.common.Pagination;
import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Member;
import com.kh.market.product.model.service.ProductService;
import com.kh.market.product.model.vo.Product;
import com.kh.market.recipe.model.Service.BoardService;
import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.Menu_Category;
import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.recipe.model.vo.SearchInfo;
@Controller
@SessionAttributes("clist")
public class AdminController {
 
	
	@Autowired
	private CategoryService cService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private BoardService bService;
	
	@Autowired
	private MemberService mService;
	
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
	  public ModelAndView adminmodify_userView( ModelAndView mv ,
			  @RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage
			  ) { 
		  ArrayList<Member> memlist = mService.SelectMemberLIst();
		  int listCount = memlist.size();
		  int boardlimit = 10;
		  AdminProductPageInfo pi = AdminProductPagnation.getMemPageInfo(currentPage, listCount, boardlimit);
		  memlist = mService.SelectMemberLIst(pi);
		  
		  if(memlist!=null) {
			  mv.addObject("list",memlist)
			  .addObject("pi",pi)
			  .setViewName("admin/adminmodify_user");
		  }
		  return mv; 
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
	  
	  @RequestMapping("usermodifypop")
	  public ModelAndView usermodifypop(ModelAndView mv,
			  @RequestParam("mem_num") int mem_num) {
		  
		  Member m = mService.selectmember(mem_num);
		  mv.addObject("m",m)
		  .setViewName("admin/usermodifypop");
		  return mv;
	  }
	  
	  @RequestMapping("adminupdateuser")
	  public ModelAndView adminupdateuser(ModelAndView mv , Member m) {
		  System.out.println(m);
		  if(m.getMem_pwd().equals("")) {
			  m.setMem_pwd(
			  mService.selectmember(
			  m.getMem_num()).getMem_pwd()); //pwd를 비워놓을 경우 이전 패스워드를 가져와서 저장
		  }
		  int result = mService.updateMember(m);
		  
		  if(result>0) {
			  mv.setViewName("admin/close");
		  }
		return mv;
	  }
	  
	  @RequestMapping("memsearch")
	  public ModelAndView memsearch(ModelAndView mv , 
			  @RequestParam("msearchType") String msearch,
			  @RequestParam("mkeyword") String mkeyword,
			  @RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		  
		  	ArrayList mlist = new ArrayList();
		  	AdminProductPageInfo pi = null;
		  	
		  	System.out.println(mkeyword+"           "+msearch);
		  if(msearch.equals("mid")) {
			   mlist = mService.searchmemid(mkeyword);
			  int listCount = mlist.size();
			   pi = AdminProductPagnation.getMemPageInfo(currentPage, listCount,10);
			  mlist = mService.searchmemidpaging(mkeyword,pi);
		  }else if(msearch.equals("mname")){
			  mlist = mService.searchmemname(mkeyword);
			  int listCount = mlist.size();
			   pi = AdminProductPagnation.getMemPageInfo(currentPage, listCount,10);
			  mlist = mService.searchmemnamepaging(mkeyword,pi);
		  }
		  
		  System.out.println(mlist);
		  
		  mv.addObject("list",mlist)
		  .addObject("pi",pi)
		  .setViewName("admin/adminmodify_user");
		  
		  return mv;
	  }
	  
	  //tv레시피 처음화면(전체)
	  @RequestMapping("atvCateList") 
		public ModelAndView tvCateList(ModelAndView mv, @RequestParam(defaultValue="0")int mc_cate_num) { //TV속 레시피 카테고리 리스트
		  
			  
		  ArrayList<Menu_Category> clist = bService.TvCateList();
		  mv.addObject("clist", clist);
		  
		  
		  	System.out.println("tvCateList입니다.----------------");
			int listCount = bService.getTvListCount(mc_cate_num);
			System.out.println("listCount : "+ listCount);
			
			int currentPage = 1;
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		  
		  ArrayList<Board> blist = bService.TvBoardList(pi, mc_cate_num);
		  
		  System.out.println("blist : "+ blist);
		  
		  mv.addObject("blist", blist);
		  
		  mv.addObject("mc_cate_num", mc_cate_num);
			mv.addObject("pi",pi);
			mv.addObject("pageValue", "atvBoardList");
			mv.addObject("TvOrUser", "tv");
			
		  mv.setViewName("admin/adminrecipe_TV");
		  
		  
		  return mv; 
		  }
		
		//각 카테고리에 맞는 리스트를 불러옴
		@RequestMapping("atvBoardList")
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
				System.out.println("tvBoardList입니다.----------------");
				int listCount = bService.getTvListCount(mc_cate_num);
				System.out.println("listCount : "+ listCount);
				
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				
				ArrayList<Board> blist = bService.TvBoardList(pi, mc_cate_num);
				
				System.out.println("blist : "+ blist);
				System.out.println("mc_cate_num : "+ mc_cate_num);
				System.out.println("pi : "+pi);
				mv.addObject("blist",blist);
				mv.addObject("mc_cate_num", mc_cate_num);
				mv.addObject("pi",pi);
				mv.addObject("pageValue", "atvBoardList");
				mv.addObject("TvOrUser", "tv");
				
				mv.setViewName("admin/adminrecipe_TV");
				
				return mv;
			}
		}
		
		//검색결과 리스틀르 불러옴
		@RequestMapping("atvSearchList")
		public ModelAndView tvRecipeSrc(ModelAndView mv
								, @RequestParam(defaultValue="-1")int mc_cate_num	//값이 -1이면 에러 
								, @RequestParam(defaultValue="-1") String src_cate	//값이 -1이면 에러
								, @RequestParam(defaultValue="") String src_input	// 값이 ""이면 그냥 리스트로 보낸다.
								, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage
				
				) {	//tc 레시피 검색 결과 리스트

			SearchInfo si = new SearchInfo();
			
			System.out.println("mc_cate_num "+mc_cate_num);
			System.out.println("src_cate "+src_cate);
			System.out.println("src_input "+src_input);
			
			si.setMc_cate_num(mc_cate_num);
			si.setSrc_cate(src_cate);
			si.setSrc_input(src_input);
			
			
			int listCount = bService.getTvSearchListCount(si);
			
			System.out.println("listCount : "+ listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Board> blist = bService.TvSearchList(pi, si);
			
			mv.addObject("blist",blist);
			mv.addObject("mc_cate_num", mc_cate_num);
			mv.addObject("pi",pi);
			mv.addObject("si",si);
			mv.addObject("pageValue", "atvSearchList");
			mv.addObject("TvOrUser", "tv");
			mv.setViewName("admin/adminrecipe_TV");
			
			return mv;
		}
	  

		//디테일 페이지
		@RequestMapping("aRecipeDetail")
		public ModelAndView recipeDetailView(ModelAndView mv, int bId,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, String TvOrUser) { //레시피 자세히 보는 페이지로 이동하는 메소드
			
			System.out.println("TvOrUser : " + TvOrUser);
			
			if(TvOrUser.equals("user")) {
				Board b = bService.USERselectBoard(bId);
				System.out.println("@@@@ b : " + b);
				if(b != null) {
					mv.addObject("b",b).addObject("me_num", 2)
					  .addObject("currentPage",currentPage)
					  .addObject("bId",bId)
					  .addObject("TvOrUser",TvOrUser)
					  .setViewName("admin/adminrecipedetail");
				}else {
					mv.addObject("msg","게시글 상세조회 실패")
					  .setViewName("common/errorPage");
				}
			}else {
				Board b = bService.TVselectBoard(bId);
				System.out.println("@@@@ b : " + b);
				if(b != null) {
					mv.addObject("b",b).addObject("me_num", 1)
					  .addObject("currentPage",currentPage)
					  .addObject("bId",bId)
					  .addObject("TvOrUser",TvOrUser)
					  .setViewName("admin/adminrecipedetail");
				}else {
					mv.addObject("msg","게시글 상세조회 실패")
					  .setViewName("common/errorPage");
				}
			}
			
			
			return mv;
		}
		
		@RequestMapping("aUSERrecipe") // 사용자 레시피 2
		public ModelAndView recipeUserView(ModelAndView mv) { 
			System.out.println("contorler");
			
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
			mv.setViewName("admin/adminrecipe_USER_Temp");
			
			return mv; 
		}
		
		@RequestMapping("aUserSearchList")
		public ModelAndView userRecipeSrc(ModelAndView mv
								, @RequestParam(defaultValue="-1")int mc_cate_num	//값이 -1이면 에러 
								, @RequestParam(defaultValue="") String src_input	// 값이 ""이면 그냥 리스트로 보낸다.
								, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, String TvOrUser
				
				) {	
			// 시작
			System.out.println("userSearchList입니다.----------------");
			
			SearchInfo si = new SearchInfo();
			
			System.out.println("mc_cate_num "+mc_cate_num);
			System.out.println("src_input "+src_input);
			
			si.setMc_cate_num(mc_cate_num);
			si.setSrc_input(src_input);
			
			
			int listCount = bService.getUserSearchListCount(si);
			
			System.out.println("listCount : "+ listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			ArrayList<Board> list = bService.UserSearchList(pi, si);
			
			mv.addObject("list",list);
			mv.addObject("mc_cate_num", mc_cate_num);
			mv.addObject("pi",pi);
			mv.addObject("si",si);
//			mv.addObject("pageValue", "tvSearchList");
			mv.addObject("TvOrUser", "user");
			mv.setViewName("admin/adminrecipe_USER");
			
			return mv;
		}
	 
}
