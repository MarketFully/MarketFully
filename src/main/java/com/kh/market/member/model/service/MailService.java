package com.kh.market.member.model.service;

import javax.servlet.http.HttpServletRequest;

import com.kh.market.member.model.vo.Member;

public interface MailService {

	public void mailSendWithUserKey(String mem_email , String mem_id, HttpServletRequest request);

	public void mailsendWithPassword(String mem_name, String mem_id, String mem_email, HttpServletRequest request);

	


	


	
	
}
