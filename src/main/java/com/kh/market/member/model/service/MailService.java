package com.kh.market.member.model.service;

import javax.servlet.http.HttpServletRequest;

import com.kh.market.member.model.vo.Member;

public interface MailService {

	public void mailSendWithUserKey(String mem_EMAIL , String MEM_ID, HttpServletRequest request);

	public void mailsendWithPassword(String mEM_NAME, String mEM_ID, String mEM_EMAIL, HttpServletRequest request);

	


	


	
	
}
