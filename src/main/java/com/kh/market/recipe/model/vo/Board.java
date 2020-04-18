package com.kh.market.recipe.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board {
	private int MB_NUM;
	private String MB_TITLE;
	private String MB_CONTENT;
	private Date MB_CDATE;
	private String MB_WRITER;
	private String MB_IMAGE;
	private int MB_THANK;
	private int MB_COUNT;
	private int MB_RCOUNT;
	private String MB_STATUS;
	private String MB_TYPE;
	private int MC_CATE_NUM;
	
	private Menu_Category mc;
	
	
	public Menu_Category getMc() {
		return mc;
	}

	public void setMc(Menu_Category mc) {
		this.mc = mc;
	}

	public int getMC_CATE_NUM() {
		return MC_CATE_NUM;
	}

	public void setMC_CATE_NUM(int mC_CATE_NUM) {
		MC_CATE_NUM = mC_CATE_NUM;
	}

	public Board() {
		super();
	}

	public Board(int mB_NUM, String mB_TITLE, String mB_CONTENT, Date mB_CDATE, String mB_WRITER, String mB_IMAGE,
			int mB_THANK, int mB_COUNT, int mB_RCOUNT, String mB_STATUS, String mB_TYPE) {
		super();
		MB_NUM = mB_NUM;
		MB_TITLE = mB_TITLE;
		MB_CONTENT = mB_CONTENT;
		MB_CDATE = mB_CDATE;
		MB_WRITER = mB_WRITER;
		MB_IMAGE = mB_IMAGE;
		MB_THANK = mB_THANK;
		MB_COUNT = mB_COUNT;
		MB_RCOUNT = mB_RCOUNT;
		MB_STATUS = mB_STATUS;
		MB_TYPE = mB_TYPE;
	}

	public int getMB_NUM() {
		return MB_NUM;
	}

	public void setMB_NUM(int mB_NUM) {
		MB_NUM = mB_NUM;
	}

	public String getMB_TITLE() {
		return MB_TITLE;
	}

	public void setMB_TITLE(String mB_TITLE) {
		MB_TITLE = mB_TITLE;
	}

	public String getMB_CONTENT() {
		return MB_CONTENT;
	}

	public void setMB_CONTENT(String mB_CONTENT) {
		MB_CONTENT = mB_CONTENT;
	}

	public Date getMB_CDATE() {
		return MB_CDATE;
	}

	public void setMB_CDATE(Date mB_CDATE) {
		MB_CDATE = mB_CDATE;
	}

	public String getMB_WRITER() {
		return MB_WRITER;
	}

	public void setMB_WRITER(String mB_WRITER) {
		MB_WRITER = mB_WRITER;
	}

	public String getMB_IMAGE() {
		return MB_IMAGE;
	}

	public void setMB_IMAGE(String mB_IMAGE) {
		MB_IMAGE = mB_IMAGE;
	}

	public int getMB_THANK() {
		return MB_THANK;
	}

	public void setMB_THANK(int mB_THANK) {
		MB_THANK = mB_THANK;
	}

	public int getMB_COUNT() {
		return MB_COUNT;
	}

	public void setMB_COUNT(int mB_COUNT) {
		MB_COUNT = mB_COUNT;
	}

	public int getMB_RCOUNT() {
		return MB_RCOUNT;
	}

	public void setMB_RCOUNT(int mB_RCOUNT) {
		MB_RCOUNT = mB_RCOUNT;
	}

	public String getMB_STATUS() {
		return MB_STATUS;
	}

	public void setMB_STATUS(String mB_STATUS) {
		MB_STATUS = mB_STATUS;
	}

	public String getMB_TYPE() {
		return MB_TYPE;
	}

	public void setMB_TYPE(String mB_TYPE) {
		MB_TYPE = mB_TYPE;
	}

	@Override
	public String toString() {
		return "Board [MB_NUM=" + MB_NUM + ", MB_TITLE=" + MB_TITLE + ", MB_CONTENT=" + MB_CONTENT + ", MB_CDATE="
				+ MB_CDATE + ", MB_WRITER=" + MB_WRITER + ", MB_IMAGE=" + MB_IMAGE + ", MB_THANK=" + MB_THANK
				+ ", MB_COUNT=" + MB_COUNT + ", MB_RCOUNT=" + MB_RCOUNT + ", MB_STATUS=" + MB_STATUS + ", MB_TYPE="
				+ MB_TYPE + "]";
	}

	
	
	
}

