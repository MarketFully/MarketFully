package com.kh.market.admin.Controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.market.admin.model.Service.CategoryService;
import com.kh.market.admin.model.Service.GraphService;
import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.admin.model.vo.AdminProductPagnation;
import com.kh.market.admin.model.vo.MainCategory;
import com.kh.market.admin.model.vo.SubCategory;
import com.kh.market.admin.model.vo.graphvo;
import com.kh.market.common.Pagination;
import com.kh.market.common.Pagination_Notice;
import com.kh.market.common.Pagination_Qna;
import com.kh.market.common.Pagination_RecipeSuggest;
import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Member;
import com.kh.market.mirotic.model.service.MiroticService;
import com.kh.market.mirotic.model.vo.SHIPPING;
import com.kh.market.product.model.service.ProductService;
import com.kh.market.product.model.vo.Product;
import com.kh.market.recipe.model.Service.BoardService;
import com.kh.market.recipe.model.vo.Board;
import com.kh.market.recipe.model.vo.BoardExp;
import com.kh.market.recipe.model.vo.BoardProduct;
import com.kh.market.recipe.model.vo.Menu_Category;
import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.recipe.model.vo.SearchInfo;
import com.kh.market.servicecenter.model.service.ServiceCenterService;
import com.kh.market.servicecenter.model.vo.ServiceCenterBoardLike;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaPageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaReply;
import com.kh.market.servicecenter.model.vo.ServiceCenterRecipeSuggestBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterRecipeSuggestPageInfo;
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

	@Autowired 
	private ServiceCenterService sService;
	
	@Autowired
	private GraphService gService;
	
	@Autowired
	private MiroticService mrtService;
	
	@RequestMapping(value="cateupload.do",method=RequestMethod.GET)
	public ModelAndView admin_cateupload(Model mv,ModelAndView mv2,
			@RequestParam(value="maincateY-index") String maincateY_index,
			@RequestParam(value="subcateY-index") String subcateY_index,
			@RequestParam(value="maincatecode") String catecode,
			@RequestParam(value="maincatename") String catename,
			@RequestParam(value="subcatecode") String subcatecode,
			@RequestParam(value="subcatename") String subcatename,
			@RequestParam(value="parentmaincode") String parentmaincode) {
		
		
		 ArrayList<MainCategory> tempmc = cService.selectMainCategoryList();
		
		int delete = cService.deleteCategory();
	
		
		String[] maincodearr = catecode.split(",");
		String[] mainnamearr = catename.split(",");
		String[] maincateY_indexarr = maincateY_index.split(",");
		
		for(int i=0;i<maincodearr.length;i++) {
			MainCategory c = new MainCategory();
			c = new MainCategory(maincodearr[i], mainnamearr[i], maincateY_indexarr[i], "");
			for(int j = 0 ; j < tempmc.size();j++) {				
				if (tempmc.get(j).getCatecode1().equals(maincodearr[i]) &&
						tempmc.get(j).getCatename1().equals(mainnamearr[i])) {
					c = new MainCategory(maincodearr[i], mainnamearr[i], maincateY_indexarr[i],
							tempmc.get(j).getRenamefilename()); break;
				} 
			}
			int mainupdate = cService.updateCategory(c);
			
			
		}
		
		/////////////////////////////////////////////
		String[] subcatecodearr = subcatecode.split(",");
		String[] subcatenamearr = subcatename.split(",");
		String[] parentmaincodearr = parentmaincode.split(",");
		String[] subcateY_indexarr = subcateY_index.split(",");
		
		
		int delsubcate = cService.deleteSubCategory();

for(int i= 0 ;i<subcatecodearr.length; i++) {
SubCategory sc2 = new SubCategory(parentmaincodearr[i],subcatecodearr[i],subcatenamearr[i],subcateY_indexarr[i]);
int updatesub = cService.updatesubCategory(sc2);
}

ArrayList<MainCategory> mc = cService.selectMainCategoryList();
	ArrayList<SubCategory> sc = cService.selectSubCategoryList();
				//maincatearr.add()
				if(mc!=null) {
					mv2.addObject("maincate", mc) //筌롫뗄�뵥燁삳똾�믤�⑥쥓�봺
					.setViewName("admin/admincategory");
				}
			 return mv2; 
		
	}
	
	@RequestMapping("TVrecipeinsertpage")
	public ModelAndView recipeinsertpage(Board b, Model model,HttpServletRequest request,ModelAndView mv) { //유저 레시피 작성 페이지로 이동
		
		//회원 아이디 등등 을 가지고 작성 페이지로 이동
		
		 ArrayList<MainCategory> mc = cService.selectMainCategoryList();
		 //ArrayList<SubCategory> sc = cService.selectSubCategoryList();
         if(mc!=null) {
            mv.addObject("maincate", mc) 
            //mv.addObject("subcate",sc)
            .setViewName("admin/tvrecipeinsert");
         }
         mv.addObject("maincate", mc) 
         //mv.addObject("subcate",sc)
         .setViewName("admin/tvrecipeinsert");
       return mv; 
	}
	
	@RequestMapping("TVrecipeinsert")//BoardProduct bp
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
			
			String renameFileName = saveFile2(file,request, 0);
			
			if(renameFileName != null) {
				b.setMb_origin(file.getOriginalFilename());// DB에는 파일명 저장
				b.setMb_rename(renameFileName);
			}
		}
		int result = bService.insertTVRecipe(b);
		//------------------------------------------------------
		String[] pcodelist = pcode.split(",");
		String[] peachlist = peach.split(",");
		for(int i = 0 ; i< pcodelist.length;i++) {
			int pcodeint = Integer.parseInt(pcodelist[i]);
			int peachint = Integer.parseInt(peachlist[i]);
			bplist.add(new BoardProduct(0,pcodeint,peachint));
			
			
			int result2 = bService.insertProductTVRecipe(bplist.get(i));
		}
		
		
		//------------------------------------------------------
		String[] beContent = be.getContent().split(",&&,");
		int i = 1;
		for(MultipartFile filea : subImg) {
			if(!filea.getOriginalFilename().equals("")) {
				
				String renameFileName = saveFile2(filea,request, i);
				
				if(renameFileName != null) {
					if(subImg.size() == i) {
						be.setContent(beContent[i-1].substring(0,(beContent[i-1].length()-3)));
					}else {
						be.setContent(beContent[i-1]);
					}
					be.setOrigin(filea.getOriginalFilename());// DB에는 파일명 저장
					be.setRename(renameFileName);
					be.setSeq(i);
					int result3 = bService.insertExpTVRecipe(be);
					i++;
				}
				
			}
		}
		if(result > 0) {
			return "redirect:atvSearchList";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("adminmaingraph")
	public void adminmaingraph(HttpServletResponse response) throws JsonIOException, IOException {
		Date date = new Date();
		ArrayList<graphvo> daylist = gService.getSixMonth(date);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().create();
		
		gson.toJson(daylist,response.getWriter());
	}
	
	@RequestMapping("adminweekgraph")
	public void adminweekgraph(HttpServletResponse response) throws JsonIOException,IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		ArrayList<graphvo> weeklist = gService.getSixWeek();
		
		Gson gson = new GsonBuilder().create();
		
		gson.toJson(weeklist,response.getWriter());
		
	}
	@RequestMapping("admindaygraph")
	public void admindaygraph(HttpServletResponse response) throws JsonIOException , IOException{
		
		
		ArrayList ddatelist = gService.getSevenDay();//일
		ArrayList<graphvo> pricelist = gService.getSevenPrice(); // 2개
		int j = 0 ;
		ArrayList<graphvo> sendlist = new ArrayList<graphvo>();
		for(int i =0; i < 7;i++) {
			graphvo gv = new graphvo();
			
			if(!pricelist.get(j).getDdate().equals(ddatelist.get(i))) {
				gv.setDdate(ddatelist.get(i).toString());
				gv.setPrice(0);
			}else {
				gv.setDdate(ddatelist.get(i).toString());
				gv.setPrice(pricelist.get(j).getPrice());	
				j++;
			}
			sendlist.add(gv);
			
		}
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().create();
		
		gson.toJson(sendlist,response.getWriter());
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
		ArrayList<SubCategory> sc = cService.selectSubCategoryList();
			//maincatearr.add()
			if(mc!=null) {
				mv.addObject("maincate", mc) //筌롫뗄�뵥燁삳똾�믤�⑥쥓�봺
				.setViewName("admin/admincategory");
			}
		 return mv; 
		 }
	 
	 @RequestMapping("adminrecipeSuggest")
		public ModelAndView recipeSuggestView(ModelAndView mv,
											  @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {


			int RSlistCount = sService.getRSlistCountRecipeSuggest();


			ServiceCenterRecipeSuggestPageInfo rpi = Pagination_RecipeSuggest.getRecipeSuggestPageInfo(currentPage,
					RSlistCount);

			ArrayList<ServiceCenterRecipeSuggestBoard> RSlist = sService.RecipeSuggestSelectList(rpi);

			for (int i = 0; i < RSlist.size(); i++) {
				String[] strArr = RSlist.get(i).getRb_date().split(" ");
				RSlist.get(i).setRb_date(strArr[0]);
			}

			mv.addObject("RSlist", RSlist);
			mv.addObject("rpi", rpi);
			mv.setViewName("admin/adminrecipeSuggest");

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
		  
		  
		  int listCount=pService.getListCount();
		  
		  
		  AdminProductPageInfo pi = AdminProductPagnation.getPageInfo(currentPage, listCount);
		  
		  ArrayList<Product> list = pService.getProductList(pi);
		  
		  
		  if(list!=null) {
			  mv.addObject("list",list)
			  .addObject("pi",pi)
			  .setViewName("admin/adminproduct_list");
		  }
		  return mv; 
		  
		  }
	  
	  @RequestMapping("adminServiceCenter") 
	  public ModelAndView admin_SerivceCenterView(ModelAndView mv,
				@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) { //怨좉컼�꽱�꽣 硫붿씤(notice)�쑝濡� �씠�룞�븯�뒗 硫붿냼�뱶
			System.out.println("@@@@ currentPage : "+ currentPage);
			
			int listCount = sService.getListCountNotice();
			
			ServiceCenterNoticePageInfo pi = Pagination_Notice.getPageInfo(currentPage,listCount);
			
			ArrayList<ServiceCenterNoticeBoard> list = sService.NoticeselectList(pi);
			
			mv.addObject("list", list);
			mv.addObject("pi",pi);
			mv.setViewName("admin/adminnotice");  
			return mv;
			
			
		  }
	  @RequestMapping("Noticewrite")
	  public String noticewrite() {
		  return "admin/adminnoticewrite";
	  }
	  
	  @RequestMapping("adminnoticeinsert")
	  public String adminnoticewrite(ServiceCenterNoticeBoard N) {
		  
		  int result = sService.insertNotice(N);
		  
		  return "admin/adminnotice";
	  }
	  
	@RequestMapping("adminqnadetail")
	public ModelAndView adminqnadetail(ModelAndView mv, int bId,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) { // admin QNA detail

		ServiceCenterQnaBoard b = sService.QNAselectBoard(bId);
		ArrayList<ServiceCenterQnaReply> qr = sService.selectQnaReplyList(bId);

		if (b != null) {
			mv.addObject("b", b).
			addObject("qr", qr).
			addObject("currentPage", currentPage)
			.setViewName("admin/adminqnadetail");
		} else {
			mv.addObject("msg", "에러임").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("adminsuggestwriteDetail")
	public ModelAndView adminreipeSuggestDetail(ModelAndView mv, int rb_num, @SessionAttribute("loginUser") Member m,
			@RequestParam(value = "currnetPage", required = false, defaultValue = "1") int currentPage) {

		ServiceCenterRecipeSuggestBoard rcb = sService.recipeSuggestSelectBoard(rb_num);

		// �뿬湲곗꽌遺��꽣
		ServiceCenterBoardLike scb = new ServiceCenterBoardLike();

		scb.setMem_num(m.getMem_num());
		scb.setRb_num(rb_num);
		// �뿬湲곌퉴吏�

		if (rcb != null) {
			int boardLike = sService.checklike(scb);

			mv.addObject("rcb", rcb).addObject("currentPage", currentPage).addObject("boardLike", boardLike)
					.setViewName("admin/adminsuggestwriteDetail");
		} else {
			mv.addObject("msg", "寃뚯떆湲� �긽�꽭議고쉶 �떎�뙣");
		}
		return mv;
		
	}
	
	
	@RequestMapping("adminnoticeDetail")
	public ModelAndView adminnoticeDetail(ModelAndView mv, int notice_num,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {

		ServiceCenterNoticeBoard snb = sService.NoticeselectBoard(notice_num);

		if (snb != null) {
			mv.addObject("snb", snb).addObject("currentPage", currentPage).setViewName("admin/adminnoticeDetail");
		} else {
			mv.addObject("msg", "寃뚯떆湲� �긽�꽭議고쉶 �떎�뙣");
		}
		return mv;
	}
	
	
	 @RequestMapping("categorysee")
	  public ModelAndView admincategory_seeView(ModelAndView mv , @RequestParam("maincatename") String maincatename) {

		  String[] maincatearr = maincatename.split(",");
		  
		  
		  mv.addObject("maincatearr",maincatearr)
		    .setViewName("admin/categorysee");
		  return mv;
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
		  
		  
		  mv.addObject("list",mlist)
		  .addObject("pi",pi)
		  .setViewName("admin/adminmodify_user");
		  
		  return mv;
	  }
	  
	  @RequestMapping("adminqna")
		public ModelAndView QNAViewView(ModelAndView mv,
										@RequestParam(value="currentPage",required=false,defaultValue="1")int currentPage) { //怨좉컼�꽱�꽣 QNA硫붿씤�쑝濡� �씠�룞�븯�뒗 硫붿냼�뱶
			int listCount = sService.getListCountQna();
			
			ServiceCenterQnaPageInfo pi = Pagination_Qna.getPageInfo(currentPage,listCount);
			
			ArrayList<ServiceCenterQnaBoard> list = sService.QnaselectList(pi);
			
			mv.addObject("list", list);
			mv.addObject("pi",pi);
			mv.setViewName("admin/adminqna");
			
			return mv;
		}
	  
	  //tv레시피 처음화면(전체)
	  @RequestMapping("atvCateList") 
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
				int listCount = bService.getTvListCount(mc_cate_num);
				
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
				
				ArrayList<Board> blist = bService.TvBoardList(pi, mc_cate_num);
				
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
			mv.addObject("pageValue", "atvSearchList");
			mv.addObject("TvOrUser", "tv");
			mv.setViewName("admin/adminrecipe_TV");
			
			return mv;
		}
	  

		//디테일 페이지
		@RequestMapping("aRecipeDetail")
		public ModelAndView recipeDetailView(ModelAndView mv, int bId,
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, String TvOrUser) { //레시피 자세히 보는 페이지로 이동하는 메소드
			
			
			if(TvOrUser.equals("user")) {
				Board b = bService.USERselectBoard(bId);
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
//			mv.addObject("pageValue", "tvSearchList");
			mv.addObject("TvOrUser", "user");
			mv.setViewName("admin/adminrecipe_USER");
			
			return mv;
		}
		
		@RequestMapping(value = "cateimgupload.do",method=RequestMethod.POST)
		public ModelAndView cateimgupload(ModelAndView mv,HttpServletRequest request,
				@RequestParam("upcatecode") String upcatecode,
				@RequestParam(name="uploadFile",required=false) MultipartFile file) {	
			MainCategory mc = new MainCategory();
					
			String renameFileName= "";
			if(!file.getOriginalFilename().equals("")) {
				renameFileName = saveFile(file,request);
			}
			mc.setCatecode1(upcatecode);
			mc.setRenamefilename(renameFileName);
			int result = cService.imgupdate(mc);
			
			mv.setViewName("admin/close");
			
			return mv;
		}
		
		@RequestMapping("cateimgpopup")
		public ModelAndView cateimgpopup(ModelAndView mv,
				@RequestParam("upcatecode") String upcatecode,
				@RequestParam("catename") String catename) {
			
			mv.addObject("upcatecode",upcatecode)
			.addObject("catename",catename)
			.setViewName("admin/cateimgpopup");
			return mv;
		}
		
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\img\\categoryuploadimg";
			
			File folder = new File(savePath);
			
			if(!folder.exists()) {
				folder.mkdir(); // 
			}
			
			String originFileName = file.getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
							+ originFileName.substring(originFileName.lastIndexOf(".")+1);
			
			
			String renamePath = folder + "\\"+ renameFileName;
			
			try {
				file.transferTo(new File(renamePath)); 
			}catch (Exception e) {
			} 
			
			return renameFileName;
		}
		
		public String saveFile2(MultipartFile file, HttpServletRequest request,int i) {
String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\/img/TvRecipe";
			
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
		
		
		//배송관련 테이블 수정하는 메소드
		@RequestMapping("updateShippingCode")
		public ModelAndView insertShipping(ModelAndView mv, int or_num33, String shipping_status, int shipping_code) {
			
			
			SHIPPING sh = new SHIPPING();
			
			sh.setOr_num(or_num33);
			sh.setShipping_code(shipping_code);
			sh.setShipping_status(shipping_status);
			
			int result=0;
			int result2=0;
			result = mrtService.updateShipping(sh);
			result2= mrtService.updateShipping_Mirotic(sh);
			
//			String url = "redirect:/shippingtrace";
//			return new ModelAndView(url);
			
			mv.setViewName("redirect:/shippingtrace");
			return mv;
			
		}
		
		
		
		//tv레시피 카테고리 리스트를 추가하는 메소드
		@RequestMapping("insertclist")
		public ModelAndView insertclist(ModelAndView mv
									, @ModelAttribute("clist") ArrayList clist
									, Menu_Category menuCate
									) {
			
			
			int result=0;
			
			result = bService.insertclist(menuCate);
			
			if(result>0) {
				clist = bService.TvCateList();
			}
			
			
			mv.addObject("clist", clist);
			mv.setViewName("redirect:/atvCateList");
			
			return mv;
		}
		
		
		//tv레시피 카테고리 리스트를 삭제하는 메소드
		@RequestMapping("deleteclist")
		public ModelAndView deleteclist(ModelAndView mv
									, @ModelAttribute("clist") ArrayList clist
									, Menu_Category menuCate
									) {
			
			int result=0;
			
			result = bService.deleteclist(menuCate);
			
			if(result>0) {
				clist = bService.TvCateList();
			}
			
			
			mv.addObject("clist", clist);
			mv.setViewName("redirect:/atvCateList");
			
			return mv;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
	 
}
