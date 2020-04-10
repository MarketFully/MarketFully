package com.kh.market.admin.model.vo;

public class MainCategory {

	private String catecode1;
	private String catename1;
	private String Y_index;

	public String getCatecode1() {
		return catecode1;
	}

	public void setCatecode1(String catecode1) {
		this.catecode1 = catecode1;
	}

	public String getCatename1() {
		return catename1;
	}

	public void setCatename1(String catename1) {
		this.catename1 = catename1;
	}

	public MainCategory() {
		super();
	}

	

	public MainCategory(String catecode1, String catename1, String y_index) {
		super();
		this.catecode1 = catecode1;
		this.catename1 = catename1;
		Y_index = y_index;
	}

	public String getY_index() {
		return Y_index;
	}

	public void setY_index(String y_index) {
		Y_index = y_index;
	}

	@Override
	public String toString() {
		return "MainCategory [catecode1=" + catecode1 + ", catename1=" + catename1 + ", Y_index=" + Y_index + "]";
	}

	

}
