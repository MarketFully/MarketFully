package com.kh.market.servicecenter.model.service;

import java.util.ArrayList;

import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;

public interface ServiceCenterService {
	
	int getListCountNotice();

	ArrayList<ServiceCenterNoticeBoard> NoticeselectList(ServiceCenterNoticePageInfo pi);
}
