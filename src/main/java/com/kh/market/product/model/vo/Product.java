package com.kh.market.product.model.vo;

public class Product {
	private int pr_code;
	private String pr_cate1;
	private String pr_cate2;
	private String pr_name;
	private int pr_price;
	private String pr_content;
	private int pr_carlory;
	private String pr_from;
	private String pr_size;
	private int pr_entity;
	private String originalFileName;
	private String renameFileName;

	public int getPr_code() {
		return pr_code;
	}

	public void setPr_code(int pr_code) {
		this.pr_code = pr_code;
	}

	public String getPr_cate1() {
		return pr_cate1;
	}

	public void setPr_cate1(String pr_cate1) {
		this.pr_cate1 = pr_cate1;
	}

	public String getPr_cate2() {
		return pr_cate2;
	}

	public void setPr_cate2(String pr_cate2) {
		this.pr_cate2 = pr_cate2;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public int getPr_price() {
		return pr_price;
	}

	public void setPr_price(int pr_price) {
		this.pr_price = pr_price;
	}

	public String getPr_content() {
		return pr_content;
	}

	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}

	public int getPr_carlory() {
		return pr_carlory;
	}

	public void setPr_carlory(int pr_carlory) {
		this.pr_carlory = pr_carlory;
	}

	public String getPr_from() {
		return pr_from;
	}

	public void setPr_from(String pr_from) {
		this.pr_from = pr_from;
	}

	public String getPr_size() {
		return pr_size;
	}

	public void setPr_size(String pr_size) {
		this.pr_size = pr_size;
	}

	public int getPr_entity() {
		return pr_entity;
	}

	public void setPr_entity(int pr_entity) {
		this.pr_entity = pr_entity;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenameFileName() {
		return renameFileName;
	}

	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}

	public Product(int pr_code, String pr_cate1, String pr_cate2, String pr_name, int pr_price, String pr_content,
			int pr_carlory, String pr_from, String pr_size, int pr_entity, String originalFileName,
			String renameFileName) {
		super();
		this.pr_code = pr_code;
		this.pr_cate1 = pr_cate1;
		this.pr_cate2 = pr_cate2;
		this.pr_name = pr_name;
		this.pr_price = pr_price;
		this.pr_content = pr_content;
		this.pr_carlory = pr_carlory;
		this.pr_from = pr_from;
		this.pr_size = pr_size;
		this.pr_entity = pr_entity;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
	}

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Product [pr_code=" + pr_code + ", pr_cate1=" + pr_cate1 + ", pr_cate2=" + pr_cate2 + ", pr_name="
				+ pr_name + ", pr_price=" + pr_price + ", pr_content=" + pr_content + ", pr_carlory=" + pr_carlory
				+ ", pr_from=" + pr_from + ", pr_size=" + pr_size + ", pr_entity=" + pr_entity + ", originalFileName="
				+ originalFileName + ", renameFileName=" + renameFileName + "]";
	}

}