package com.kh.market.servicecenter.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;

@Repository("sDao")
public class ServiceCenterDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCountNotice() {
		
		return sqlSession.selectOne("NoticeboardMapper.getListCountNotice");
	}

	public ArrayList<ServiceCenterNoticeBoard> NoticeselectList(ServiceCenterNoticePageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("NoticeboardMapper.NoticeselectList",null,rowBounds);
	}

	

	
}
