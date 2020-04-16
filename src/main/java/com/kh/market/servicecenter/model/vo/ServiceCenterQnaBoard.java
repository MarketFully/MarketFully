package com.kh.market.servicecenter.model.vo;

import java.sql.Date;

public class ServiceCenterQnaBoard {
	public int Q_NUM;
	public String Q_TITLE;
	public String Q_CONTENT;
	public String Q_WRITER;
	public int OR_NUM;
	public String Q_STATUS;
	public Date Q_CDATE;
	public int Q_COUNT;
	public int Q_RCOUNT;
	public String Q_CATEGORY;
	
	public ServiceCenterQnaBoard() {
		super();
	}

	public ServiceCenterQnaBoard(int q_NUM, String q_TITLE, String q_CONTENT, String q_WRITER, int oR_NUM,
			String q_STATUS, Date q_CDATE, int q_COUNT, int q_RCOUNT, String q_CATEGORY) {
		super();
		Q_NUM = q_NUM;
		Q_TITLE = q_TITLE;
		Q_CONTENT = q_CONTENT;
		Q_WRITER = q_WRITER;
		OR_NUM = oR_NUM;
		Q_STATUS = q_STATUS;
		Q_CDATE = q_CDATE;
		Q_COUNT = q_COUNT;
		Q_RCOUNT = q_RCOUNT;
		Q_CATEGORY = q_CATEGORY;
	}

	public int getQ_NUM() {
		return Q_NUM;
	}

	public void setQ_NUM(int q_NUM) {
		Q_NUM = q_NUM;
	}

	public String getQ_TITLE() {
		return Q_TITLE;
	}

	public void setQ_TITLE(String q_TITLE) {
		Q_TITLE = q_TITLE;
	}

	public String getQ_CONTENT() {
		return Q_CONTENT;
	}

	public void setQ_CONTENT(String q_CONTENT) {
		Q_CONTENT = q_CONTENT;
	}

	public String getQ_WRITER() {
		return Q_WRITER;
	}

	public void setQ_WRITER(String q_WRITER) {
		Q_WRITER = q_WRITER;
	}

	public int getOR_NUM() {
		return OR_NUM;
	}

	public void setOR_NUM(int oR_NUM) {
		OR_NUM = oR_NUM;
	}

	public String getQ_STATUS() {
		return Q_STATUS;
	}

	public void setQ_STATUS(String q_STATUS) {
		Q_STATUS = q_STATUS;
	}

	public Date getQ_CDATE() {
		return Q_CDATE;
	}

	public void setQ_CDATE(Date q_CDATE) {
		Q_CDATE = q_CDATE;
	}

	public int getQ_COUNT() {
		return Q_COUNT;
	}

	public void setQ_COUNT(int q_COUNT) {
		Q_COUNT = q_COUNT;
	}

	public int getQ_RCOUNT() {
		return Q_RCOUNT;
	}

	public void setQ_RCOUNT(int q_RCOUNT) {
		Q_RCOUNT = q_RCOUNT;
	}

	public String getQ_CATEGORY() {
		return Q_CATEGORY;
	}

	public void setQ_CATEGORY(String q_CATEGORY) {
		Q_CATEGORY = q_CATEGORY;
	}

	@Override
	public String toString() {
		return "ServiceCenterQnaBoard [Q_NUM=" + Q_NUM + ", Q_TITLE=" + Q_TITLE + ", Q_CONTENT=" + Q_CONTENT
				+ ", Q_WRITER=" + Q_WRITER + ", OR_NUM=" + OR_NUM + ", Q_STATUS=" + Q_STATUS + ", Q_CDATE=" + Q_CDATE
				+ ", Q_COUNT=" + Q_COUNT + ", Q_RCOUNT=" + Q_RCOUNT + ", Q_CATEGORY=" + Q_CATEGORY + "]";
	}
	
	
	
}
