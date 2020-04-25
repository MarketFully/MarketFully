package com.kh.market.servicecenter.model.vo;

public class Search_Qna{
	
	private String q_title;
	private String q_writer;
	private String q_category;
	private String q_keyword;
	private String q_searchType;
	
	public Search_Qna() {
		super();
	}

	public Search_Qna(String q_title, String q_writer, String q_category, String q_keyword, String q_searchType) {
		super();
		this.q_title = q_title;
		this.q_writer = q_writer;
		this.q_category = q_category;
		this.q_keyword = q_keyword;
		this.q_searchType = q_searchType;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_writer() {
		return q_writer;
	}

	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}


	public String getQ_category() {
		return q_category;
	}

	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}

	public String getQ_keyword() {
		return q_keyword;
	}

	public void setQ_keyword(String q_keyword) {
		this.q_keyword = q_keyword;
	}

	public String getQ_searchType() {
		return q_searchType;
	}

	public void setQ_searchType(String q_searchType) {
		this.q_searchType = q_searchType;
	}

	@Override
	public String toString() {
		return "Search_Qna [q_title=" + q_title + ", q_writer=" + q_writer + ", q_category=" + q_category
				+ ", q_keyword=" + q_keyword + ", q_searchType=" + q_searchType + "]";
	}

	

	
	
	
	
	
}
