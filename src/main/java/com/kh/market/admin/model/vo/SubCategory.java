package com.kh.market.admin.model.vo;

public class SubCategory {

	private String upcate;
	private String catecode2;
	private String catename2;
	private String Y_index;

	public String getUpcate() {
		return upcate;
	}

	public void setUpcate(String upcate) {
		this.upcate = upcate;
	}

	public String getCatecode2() {
		return catecode2;
	}

	public void setCatecode2(String catecode2) {
		this.catecode2 = catecode2;
	}

	public String getCatename2() {
		return catename2;
	}

	public void setCatename2(String catename2) {
		this.catename2 = catename2;
	}

	public SubCategory() {
		super();
	}

	public String getY_index() {
		return Y_index;
	}

	public void setY_index(String y_index) {
		Y_index = y_index;
	}

	public SubCategory(String upcate, String catecode2, String catename2, String y_index) {
		super();
		this.upcate = upcate;
		this.catecode2 = catecode2;
		this.catename2 = catename2;
		Y_index = y_index;
	}

	@Override
	public String toString() {
		return "SubCategory [upcate=" + upcate + ", catecode2=" + catecode2 + ", catename2=" + catename2 + ", Y_index="
				+ Y_index + "]";
	}

}
