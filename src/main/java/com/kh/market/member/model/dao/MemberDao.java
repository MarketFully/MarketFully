package com.kh.market.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.member.model.vo.Favorite;
import com.kh.market.member.model.vo.Member;
import com.kh.market.member.model.vo.MyBag;
import com.kh.market.member.model.vo.MypageOrderPageInfo;
import com.kh.market.member.model.vo.MypageloverecipePageInfo;
import com.kh.market.mirotic.model.vo.Mirotic;
import com.kh.market.product.model.vo.Product;
import com.kh.market.product.model.vo.ProductReview;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 로그인
	public Member loginMember(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.loginMember",m);
	}

	//아이디 중복 체크
	public int idCheck(String mem_id) {
		return sqlSession.selectOne("memberMapper.idCheck",mem_id);
	}

	// 회원가입
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	// 이메일 인증 후 DB 값 변경 
	public Member changeMemcert(String mem_id) {
		return (Member)sqlSession.selectOne("memberMapper.registSuccess",mem_id);
	}
	
	// 회원 탈퇴 
	public int deleteMember(String id) {
		return sqlSession.delete("memberMapper.deleteMember",id);
	}
	
	// 회원 정보 수정
	public int updateMember(Member m) {
		if(m.getMem_status()==null) {
			return sqlSession.update("memberMapper.updateMember",m);			
		}else {
			return sqlSession.update("memberMapper.adminupdateMember",m);
		}
	}
	
	// 아이디 찾기
	public Member idfind(Member m) {
		return (Member) sqlSession.selectOne("memberMapper.findId",m);
	}

	// 비밀번호 찾기 
	public Member pwdfind(Member m) {
		return (Member) sqlSession.selectOne("memberMapper.pwdfind", m);
	}

	// 임시비밀번호
	public int changePwd(Member m) {
		return sqlSession.update("memberMapper.changePwd", m);

	}
	
	// 마이페이지 주문내역 리스트 갯수 조회
	public int getOrderListCount(int mem_num) {
		return sqlSession.selectOne("memberMapper.getOrderListCount",mem_num);
	}

	// 마이페이지 주문내역 리스트 조회
	public ArrayList<Mirotic> selectOrderList(MypageOrderPageInfo pi,int mem_num) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectOrderList",mem_num,rowBounds);
	}

	// 마이페이지 찜한레시피 리스트 갯수 조회
	public int getRecipeListCount(int mem_num) {
		return sqlSession.selectOne("memberMapper.getRecipeListCount",mem_num);
	}


	// 마이페이지 찜한레시피 리스트 조회
	public ArrayList<Favorite> selectRecipeList(Member m ,MypageloverecipePageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectRecipeList",m,rowBounds);
	}

	// 마이페이지 찜한레시피 전체 삭제
	public int deleteRecipeList(int mem_num) {
		return sqlSession.delete("memberMapper.deleteRecipeList",mem_num);
	}

	// 마이페이지 찜한 레시피 선택 삭제
	public int oneDeleteRecipeList(Favorite f) {
		return sqlSession.delete("memberMapper.oneDeleteRecipeList",f);
	}
	
	//마이페이지 헤더에 찜한갯수 세기
	public ArrayList<Favorite> selectRecipeList(Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllRecipeList",m);
	}

	
	//장바구니에 리스트 저장
	public int setMyBagList(ArrayList<MyBag> cartList) {
		
		int result = 0;
		
		for(MyBag mybag : cartList) {
			result += sqlSession.insert("memberMapper.mergeMybag", mybag);
		}
		return result;
	}

	//상품코드에 맞는 상품을 불러오는 메소드
	public Product selectOneProduct(int pcode) {
		return sqlSession.selectOne("memberMapper.selectOneProduct", pcode);
	}

	public int deleteMybag(MyBag mybag) {
		
		return sqlSession.delete("memberMapper.deleteMybag", mybag);
	}

	public ArrayList<MyBag> selectListProduct(Member loginUser) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectListProduct",loginUser.getMem_num());
	}

	public ArrayList<MyBag> updateListProduct(MyBag mybag) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.updateListProduct",mybag.getPr_code());
	}
	
	
	

	public int selectDeleteMybag(MyBag mybag) {

		return sqlSession.delete("memberMapper.selectDeleteMybag", mybag);
	}
	
	public ArrayList<Member> selectMemberList(AdminProductPageInfo pi) {//전체  페이징된 회원정보 조회
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectmemberlist",null,rowBounds);
	}

	public ArrayList<Member> selectMemberList() {//페이지 안된 전체 회원정보 조회
		return (ArrayList)sqlSession.selectList("memberMapper.selectmemberlist");
	}
	
	public Member selectMemberOne(int mem_num) {
		return (Member)sqlSession.selectOne("memberMapper.selectmemberOne",mem_num);
	}

	public ArrayList<Member> searchmemberlist(String mkeyword) {
		return (ArrayList)sqlSession.selectList("memberMapper.searchmemberid",mkeyword);
	}

	public ArrayList<Member> searchmempaging(String mkeyword, AdminProductPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.searchmemberid", mkeyword, rowBounds);
	}

	public ArrayList<Member> searchmemname(String mkeyword) {
	
		return (ArrayList)sqlSession.selectList("memberMapper.searchmembername", mkeyword);
	}

	public ArrayList<Member> searchmemnamepaging(String mkeyword, AdminProductPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.searchmembername", mkeyword,rowBounds);
	}

	// 마이페이지 루기 리스트
	public ArrayList<Mirotic> selectlistMirotic(Member loginUser) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectlistMirotic",loginUser);
	}

	// 마이페이지 후기 삭제 
	public int reviewDeleteList(int re_num) {
		return sqlSession.update("memberMapper.reviewDeleteList",re_num);
	}

	// 마이페이지 상품 후기 작성
	public int reviewinsert(ProductReview pr_re) {
		return sqlSession.insert("memberMapper.reviewinsert",pr_re);
	}

	public Product OneProduct(int parseInt) {

		return sqlSession.selectOne("memberMapper.OneProduct", parseInt);
	}

	// 마이페이지 주문내역 상세보기
	public ArrayList<Mirotic> orderdetailList(int or_num) {
		return (ArrayList)sqlSession.selectList("memberMapper.orderdetailList",or_num);
	}

	// 마이페이지 헤더 주문,배송 수 증가
	public ArrayList<Mirotic> selectOrdeheader(Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectOrdeheader",m);
	}
	
	// 마이페이지 헤더 작성가능 후기 수 증가
	public ArrayList<Mirotic> selectReviewheader(Member m) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectReviewheader",m);
	}

	public int mergeMypageCart(MyBag mybag) {
		return sqlSession.insert("memberMapper.mergeMybag", mybag);
	}


}
