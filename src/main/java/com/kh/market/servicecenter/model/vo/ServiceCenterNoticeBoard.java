package com.kh.market.servicecenter.model.vo;

import java.sql.Date;

public class ServiceCenterNoticeBoard {
	private int notice_num;
	private String notice_title;
	private String notice_content;
	private String notice_writer;
	private Date notice_cdate;
	private String notice_status;
	private int notice_count;
	
	public ServiceCenterNoticeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ServiceCenterNoticeBoard(int notice_num, String notice_title, String notice_content, String notice_writer,
			Date notice_cdate, String notice_status, int notice_count) {
		super();
		this.notice_num = notice_num;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_writer = notice_writer;
		this.notice_cdate = notice_cdate;
		this.notice_status = notice_status;
		this.notice_count = notice_count;
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}

	public Date getNotice_cdate() {
		return notice_cdate;
	}

	public void setNotice_cdate(Date notice_cdate) {
		this.notice_cdate = notice_cdate;
	}

	public String getNotice_status() {
		return notice_status;
	}

	public void setNotice_status(String notice_status) {
		this.notice_status = notice_status;
	}

	public int getNotice_count() {
		return notice_count;
	}

	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}

	@Override
	public String toString() {
		return "ServiceCenterNoticeBoard [notice_num=" + notice_num + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_writer=" + notice_writer + ", notice_cdate="
				+ notice_cdate + ", notice_status=" + notice_status + ", notice_count=" + notice_count + "]";
	}
	
	
	

	
}