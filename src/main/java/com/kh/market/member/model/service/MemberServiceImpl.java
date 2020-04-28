package com.kh.market.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.admin.model.vo.AdminProductPageInfo;
import com.kh.market.member.model.dao.MemberDao;
import com.kh.market.member.model.vo.Favorite;
import com.kh.market.member.model.vo.Member;
import com.kh.market.member.model.vo.MyBag;
import com.kh.market.member.model.vo.MypageOrderPageInfo;
import com.kh.market.member.model.vo.MypageloverecipePageInfo;
import com.kh.market.mirotic.model.vo.Mirotic;
import com.kh.market.product.model.vo.Product;
import com.kh.market.product.model.vo.ProductReview;


@Service("mService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	// 회원 로그인
	@Override
	public Member loginMember(Member m) {
		Member loginUser = mDao.loginMember(m);
		
		return loginUser;
	}

	// 아이디 중복 체크
	@Override
	public int idCheck(String mem_id) {
		System.out.println(mem_id);
		return mDao.idCheck(mem_id);

	}

	// 회원 가입
	@Override
	public int insertMember(Member m) {
		int result = mDao.insertMember(m);
		
		return result;
	}
	
	// 회원가입 이메일인증 후 DB 변경 
	@Override
	public Member changeMemcert(String mem_id) {
		Member Memcert = mDao.changeMemcert(mem_id);
		
		return Memcert;
	}
	
	// 회원 탈퇴
	@Override
	public int deleteMember(String id) {
		return mDao.deleteMember(id);
	}

	// 회원 정보 수정
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}
	
	
	// 아이디 찾기
	@Override
	public Member idfind(Member m) {
			
		return mDao.idfind(m);
	}

	// 비밀번호 찾기 (값 일치)
	@Override
	public Member pwdfind(Member m) {
			
		return mDao.pwdfind(m);
	}

		
	// 비밀번호 재설정(임시 비밀번호)
	@Override
	public int changePwd(Member m) {
		return mDao.changePwd(m);
	}
	
	// 마이페이지 주문 내역 리스트 갯수 조회
	@Override
	public int getOrderListCount(int mem_num) {
		return mDao.getOrderListCount(mem_num);
	}

	// 마이페이지 주문 내역 리스트 조회
	@Override
	public ArrayList<Mirotic> selectOrderList(MypageOrderPageInfo pi) {
		return mDao.selectOrderList(pi);
	}

	// 마이페이지 찜한 레시피 리스트 갯수 조회
	@Override
	public int getRecipeListCount(int mem_num) {
		return mDao.getRecipeListCount(mem_num);
	}

	// 마이페이지 찜한 레시피 리스트 조회
	@Override
	public ArrayList<Favorite> selectRecipeList(Member m, MypageloverecipePageInfo pi) {
		return mDao.selectRecipeList(m, pi);
	}

	// 마이페이지 찜한 레시피 전체 삭제
	@Override
	public int deleteRecipeList(int mem_num) {
		return mDao.deleteRecipeList(mem_num);
	}

	// 마이페이지 찜한 레시피 선택 삭제
	@Override
	public int oneDeleteRecipeList(Favorite f) {
		return mDao.oneDeleteRecipeList(f);
	}

	// 마이페이지 헤더 찜한레시피 수 증가
	@Override
	public ArrayList<Favorite> selectRecipeList(Member m) {
		return mDao.selectRecipeList(m);
	}

	@Override
	public int setMyBagList(ArrayList<MyBag> cartList) {
		return mDao.setMyBagList(cartList);
	}

	@Override
	public Product selectOneProduct(int pcode) {
		
		return mDao.selectOneProduct(pcode);
	}

	@Override
	public int deleteMybag(MyBag mybag) {

		return mDao.deleteMybag(mybag);
	}

	@Override
	public ArrayList<MyBag> selectListProduct(Member loginUser) {
		
		return mDao.selectListProduct(loginUser);
	}

	@Override
	public int selectDeleteMybag(MyBag mybag) {

		return mDao.selectDeleteMybag(mybag);
	}

	@Override
	public ArrayList<Member> SelectMemberLIst(AdminProductPageInfo pi) {
		return mDao.selectMemberList(pi);
	}

	@Override
	public ArrayList<Member> SelectMemberLIst() {
		return mDao.selectMemberList();
	}
	
	@Override
	public Member selectmember(int mem_num) {
		return mDao.selectMemberOne(mem_num);
	}

	@Override
	public ArrayList<Member> searchmemid(String mkeyword) {
		return mDao.searchmemberlist(mkeyword);
	}

	@Override
	public ArrayList<Member> searchmemidpaging(String mkeyword, AdminProductPageInfo pi) {
		return mDao.searchmempaging(mkeyword, pi);
	}

	@Override
	public ArrayList<Member> searchmemname(String mkeyword) {
		return mDao.searchmemname(mkeyword);
	}

	@Override
	public ArrayList<Member> searchmemnamepaging(String mkeyword, AdminProductPageInfo pi) {
		return mDao.searchmemnamepaging(mkeyword,pi);
	}

	// 마이페이지 후기 리스트
	@Override
	public ArrayList<Mirotic> selectlistMirotic(Member loginUser) {
		return mDao.selectlistMirotic(loginUser);
	}

	// 마이페이지 작성환료한후기 삭제
	@Override
	public int reviewDeleteList(int re_num) {
		return mDao.reviewDeleteList(re_num);
	}

	// 마이페이지 후기 작성
	@Override
	public int reviewinsert(ProductReview pr_re) {
		return mDao.reviewinsert(pr_re);
	}
	
	@Override
	public void updateListProduct(MyBag mybag) {
		mDao.updateListProduct(mybag);
	}
}
