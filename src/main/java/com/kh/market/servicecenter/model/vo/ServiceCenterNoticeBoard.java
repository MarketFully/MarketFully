package com.kh.market.servicecenter.model.vo;

import java.sql.Date;

public class ServiceCenterNoticeBoard {
	private int NOTICE_NUM;
	private String NOTICE_TITLE;
	private String NOTICE_CONTENT;
	private String NOTICE_WRITER;
	private Date NOTICE_CDATE;
	private String NOTICE_STATUS;
	private int NOTICE_COUNT;
	
	public ServiceCenterNoticeBoard() {
		super();
		
	}

	public ServiceCenterNoticeBoard(int nOTICE_NUM, String nOTICE_TITLE, String nOTICE_CONTENT, String nOTICE_WRITER,
			Date nOTICE_CDATE, String nOTICE_STATUS, int nOTICE_COUNT) {
		super();
		NOTICE_NUM = nOTICE_NUM;
		NOTICE_TITLE = nOTICE_TITLE;
		NOTICE_CONTENT = nOTICE_CONTENT;
		NOTICE_WRITER = nOTICE_WRITER;
		NOTICE_CDATE = nOTICE_CDATE;
		NOTICE_STATUS = nOTICE_STATUS;
		NOTICE_COUNT = nOTICE_COUNT;
	}

	public int getNOTICE_NUM() {
		return NOTICE_NUM;
	}

	public void setNOTICE_NUM(int nOTICE_NUM) {
		NOTICE_NUM = nOTICE_NUM;
	}

	public String getNOTICE_TITLE() {
		return NOTICE_TITLE;
	}

	public void setNOTICE_TITLE(String nOTICE_TITLE) {
		NOTICE_TITLE = nOTICE_TITLE;
	}

	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}

	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}

	public String getNOTICE_WRITER() {
		return NOTICE_WRITER;
	}

	public void setNOTICE_WRITER(String nOTICE_WRITER) {
		NOTICE_WRITER = nOTICE_WRITER;
	}

	public Date getNOTICE_CDATE() {
		return NOTICE_CDATE;
	}

	public void setNOTICE_CDATE(Date nOTICE_CDATE) {
		NOTICE_CDATE = nOTICE_CDATE;
	}

	public String getNOTICE_STATUS() {
		return NOTICE_STATUS;
	}

	public void setNOTICE_STATUS(String nOTICE_STATUS) {
		NOTICE_STATUS = nOTICE_STATUS;
	}

	public int getNOTICE_COUNT() {
		return NOTICE_COUNT;
	}

	public void setNOTICE_COUNT(int nOTICE_COUNT) {
		NOTICE_COUNT = nOTICE_COUNT;
	}

	@Override
	public String toString() {
		return "ServiceCenterNoticeBoard [NOTICE_NUM=" + NOTICE_NUM + ", NOTICE_TITLE=" + NOTICE_TITLE
				+ ", NOTICE_CONTENT=" + NOTICE_CONTENT + ", NOTICE_WRITER=" + NOTICE_WRITER + ", NOTICE_CDATE="
				+ NOTICE_CDATE + ", NOTICE_STATUS=" + NOTICE_STATUS + ", NOTICE_COUNT=" + NOTICE_COUNT + "]";
	}
	
	
	
}