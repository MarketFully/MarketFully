package com.kh.market.servicecenter.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.dao.ServiceCenterDao;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;

@Service("sService")
public class ServiceCenterServiceImpl implements ServiceCenterService {
	
	@Autowired
	private ServiceCenterDao sDao;
	
	@Override
	public int getListCountNotice() {

		return sDao.getListCountNotice();
	}

	@Override
	public ArrayList<ServiceCenterNoticeBoard> NoticeselectList(ServiceCenterNoticePageInfo pi) {
		
		return sDao.NoticeselectList(pi);
	}



	
}