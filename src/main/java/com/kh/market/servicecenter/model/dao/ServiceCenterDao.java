package com.kh.market.servicecenter.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaPageInfo;

@Repository("sDao")
public class ServiceCenterDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCountNotice() {
		
		return sqlSession.selectOne("ServiceCenterMapper.getListCountNotice");
	}

	public ArrayList<ServiceCenterNoticeBoard> NoticeselectList(ServiceCenterNoticePageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("ServiceCenterMapper.NoticeselectList",null,rowBounds);
	}

	public int getListCountQna() {
		
		return sqlSession.selectOne("ServiceCenterMapper.getListCountQna");
	}

	public ArrayList<ServiceCenterQnaBoard> QnaselectList(ServiceCenterQnaPageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("ServiceCenterMapper.QnaselectList",null,rowBounds);
	}

	

	
}
