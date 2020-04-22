package com.kh.market.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.member.model.vo.Favorite;
import com.kh.market.member.model.vo.Member;
import com.kh.market.member.model.vo.MyBag;
import com.kh.market.member.model.vo.MypageOrderPageInfo;
import com.kh.market.member.model.vo.MypageloverecipePageInfo;
import com.kh.market.mirotic.model.vo.Mirotic;
import com.kh.market.product.model.vo.Product;

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
		System.out.println(id);
		return sqlSession.delete("memberMapper.deleteMember",id);
	}
	
	// 회원 정보 수정
	public int updateMember(Member m) {
		System.out.println(m);
		return sqlSession.update("memberMapper.updateMember",m);
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
	public ArrayList<Mirotic> selectOrderList(MypageOrderPageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectOrderList",null,rowBounds);
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
			result += sqlSession.insert("memberMapper.setMyBagList", mybag);
		}
		System.out.println("mDao setMyBagList result : "+result);
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

	public int selectDeleteMybag(MyBag mybag) {

		return sqlSession.delete("memberMapper.selectDeleteMybag", mybag);
	}

}
