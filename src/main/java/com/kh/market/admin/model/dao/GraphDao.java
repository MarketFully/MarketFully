package com.kh.market.admin.model.dao;

import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.admin.model.vo.graphvo;

@Repository("gDao")
public class GraphDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<graphvo> getSixMonth(Date date) {
		return (ArrayList)sqlSession.selectList("graphMapper.getSixMonth");
	}

	public ArrayList<graphvo> getSixWeek() {
		return (ArrayList)sqlSession.selectList("graphMapper.getSixWeek");
	}

	public ArrayList getSevenDay() {
		return (ArrayList)sqlSession.selectList("graphMapper.getSevenDay");
	}

	public ArrayList getSevenPrice() {
		return (ArrayList)sqlSession.selectList("graphMapper.getSevenPrice");
	}

}
