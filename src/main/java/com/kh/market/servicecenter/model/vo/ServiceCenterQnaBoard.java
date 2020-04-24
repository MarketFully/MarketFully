package com.kh.market.servicecenter.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ServiceCenterQnaBoard {
	private int q_NUM;
	private String q_TITLE;
	private String q_CONTENT;
	private String q_WRITER;
	private int oR_NUM;
	private String q_STATUS;
	private Date q_CDATE;
	private int q_COUNT;
	private int q_RCOUNT;
	private String q_CATEGORY;
	private String q_FILE;
	private String q_REFILE;
	
	
	public ServiceCenterQnaBoard() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ServiceCenterQnaBoard(int q_NUM, String q_TITLE, String q_CONTENT, String q_WRITER, int oR_NUM,
			String q_STATUS, Date q_CDATE, int q_COUNT, int q_RCOUNT, String q_CATEGORY, String q_FILE,
			String q_REFILE) {
		super();
		this.q_NUM = q_NUM;
		this.q_TITLE = q_TITLE;
		this.q_CONTENT = q_CONTENT;
		this.q_WRITER = q_WRITER;
		this.oR_NUM = oR_NUM;
		this.q_STATUS = q_STATUS;
		this.q_CDATE = q_CDATE;
		this.q_COUNT = q_COUNT;
		this.q_RCOUNT = q_RCOUNT;
		this.q_CATEGORY = q_CATEGORY;
		this.q_FILE = q_FILE;
		this.q_REFILE = q_REFILE;
	}


	public int getQ_NUM() {
		return q_NUM;
	}


	public void setQ_NUM(int q_NUM) {
		this.q_NUM = q_NUM;
	}


	public String getQ_TITLE() {
		return q_TITLE;
	}


	public void setQ_TITLE(String q_TITLE) {
		this.q_TITLE = q_TITLE;
	}


	public String getQ_CONTENT() {
		return q_CONTENT;
	}


	public void setQ_CONTENT(String q_CONTENT) {
		this.q_CONTENT = q_CONTENT;
	}


	public String getQ_WRITER() {
		return q_WRITER;
	}


	public void setQ_WRITER(String q_WRITER) {
		this.q_WRITER = q_WRITER;
	}


	public int getoR_NUM() {
		return oR_NUM;
	}


	public void setoR_NUM(int oR_NUM) {
		this.oR_NUM = oR_NUM;
	}


	public String getQ_STATUS() {
		return q_STATUS;
	}


	public void setQ_STATUS(String q_STATUS) {
		this.q_STATUS = q_STATUS;
	}


	public Date getQ_CDATE() {
		return q_CDATE;
	}


	public void setQ_CDATE(Date q_CDATE) {
		this.q_CDATE = q_CDATE;
	}


	public int getQ_COUNT() {
		return q_COUNT;
	}


	public void setQ_COUNT(int q_COUNT) {
		this.q_COUNT = q_COUNT;
	}


	public int getQ_RCOUNT() {
		return q_RCOUNT;
	}


	public void setQ_RCOUNT(int q_RCOUNT) {
		this.q_RCOUNT = q_RCOUNT;
	}


	public String getQ_CATEGORY() {
		return q_CATEGORY;
	}


	public void setQ_CATEGORY(String q_CATEGORY) {
		this.q_CATEGORY = q_CATEGORY;
	}


	public String getQ_FILE() {
		return q_FILE;
	}


	public void setQ_FILE(String q_FILE) {
		this.q_FILE = q_FILE;
	}


	public String getQ_REFILE() {
		return q_REFILE;
	}


	public void setQ_REFILE(String q_REFILE) {
		this.q_REFILE = q_REFILE;
	}


	@Override
	public String toString() {
		return "ServiceCenterQnaBoard [q_NUM=" + q_NUM + ", q_TITLE=" + q_TITLE + ", q_CONTENT=" + q_CONTENT
				+ ", q_WRITER=" + q_WRITER + ", oR_NUM=" + oR_NUM + ", q_STATUS=" + q_STATUS + ", q_CDATE=" + q_CDATE
				+ ", q_COUNT=" + q_COUNT + ", q_RCOUNT=" + q_RCOUNT + ", q_CATEGORY=" + q_CATEGORY + ", q_FILE="
				+ q_FILE + ", q_REFILE=" + q_REFILE + "]";
	}

	
}
