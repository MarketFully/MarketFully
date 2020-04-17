package com.kh.market.servicecenter.model.service;

import java.util.ArrayList;

import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaPageInfo;

public interface ServiceCenterService {
	
	int getListCountNotice();

	ArrayList<ServiceCenterNoticeBoard> NoticeselectList(ServiceCenterNoticePageInfo pi);

	int getListCountQna();

	ArrayList<ServiceCenterQnaBoard> QnaselectList(ServiceCenterQnaPageInfo pi);

	int QNAinsert(ServiceCenterQnaBoard b);

	ServiceCenterQnaBoard QNAselectBoard(int bId);
}
