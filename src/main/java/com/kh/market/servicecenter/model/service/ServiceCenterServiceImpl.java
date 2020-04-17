package com.kh.market.servicecenter.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.recipe.model.vo.PageInfo;
import com.kh.market.servicecenter.model.dao.ServiceCenterDao;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticeBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterNoticePageInfo;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaBoard;
import com.kh.market.servicecenter.model.vo.ServiceCenterQnaPageInfo;

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

	@Override
	public int getListCountQna() {
		
		return sDao.getListCountQna();
	}

	@Override
	public ArrayList<ServiceCenterQnaBoard> QnaselectList(ServiceCenterQnaPageInfo pi) {
		
		return sDao.QnaselectList(pi);
	}

	@Override
	public int QNAinsert(ServiceCenterQnaBoard b) {
		
		return sDao.QNAinsert(b);
	}

	@Override
	public ServiceCenterQnaBoard QNAselectBoard(int bId) {
		
		int result = sDao.QNAupdateCount(bId);
		
		if(result > 0) {
			System.out.println("qna bId2 : " + bId);
			return sDao.QNAselectBoard(bId);
		}else {
			return null;
		}
	}



	
}
