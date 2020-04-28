package com.kh.market.admin.model.Service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.market.admin.model.dao.GraphDao;
import com.kh.market.admin.model.vo.graphvo;

@Service("gService")
public class GraphServiceImpl implements GraphService{
	
	@Autowired
	private GraphDao gDao;

	@Override
	public ArrayList<graphvo> getSixMonth(Date date) {
		return gDao.getSixMonth(date);
	}

	@Override
	public ArrayList<graphvo> getSixWeek() {
		return gDao.getSixWeek();
	}

	@Override
	public ArrayList getSevenDay() {
		return gDao.getSevenDay();
	}

	@Override
	public ArrayList getSevenPrice() {
		return gDao.getSevenPrice();
	}
 
}
