package com.kh.market.product.model.vo;

public class Product {
	private int PR_CODE;
	private String PR_CATE1;
	private String PR_CATE2;
	private String PR_NAME;
	private int PR_PRICE;
	private String PR_CONTENT;
	private int PR_CARLORY;
	private String PR_FROM;
	private String PR_SIZE;
	private int PR_ENTITY; 
	private String originalFileName;
	private String renameFileName;
	

	public Product(int pR_CODE, String pR_CATE1, String pR_CATE2, String pR_NAME, int pR_PRICE, String pR_CONTENT,
			int pR_CARLORY, String pR_FROM, String pR_SIZE, int pR_ENTITY, String originalFileName,
			String renameFileName) {
		super();
		PR_CODE = pR_CODE;
		PR_CATE1 = pR_CATE1;
		PR_CATE2 = pR_CATE2;
		PR_NAME = pR_NAME;
		PR_PRICE = pR_PRICE;
		PR_CONTENT = pR_CONTENT;
		PR_CARLORY = pR_CARLORY;
		PR_FROM = pR_FROM;
		PR_SIZE = pR_SIZE;
		PR_ENTITY = pR_ENTITY;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
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

	public Product() {
		super();
	}

	public int getPR_CODE() {
		return PR_CODE;
	}

	public void setPR_CODE(int pR_CODE) {
		PR_CODE = pR_CODE;
	}

	public String getPR_CATE1() {
		return PR_CATE1;
	}

	public void setPR_CATE1(String pR_CATE1) {
		PR_CATE1 = pR_CATE1;
	}

	public String getPR_CATE2() {
		return PR_CATE2;
	}

	public void setPR_CATE2(String pR_CATE2) {
		PR_CATE2 = pR_CATE2;
	}

	public String getPR_NAME() {
		return PR_NAME;
	}

	public void setPR_NAME(String pR_NAME) {
		PR_NAME = pR_NAME;
	}

	public int getPR_PRICE() {
		return PR_PRICE;
	}

	public void setPR_PRICE(int pR_PRICE) {
		PR_PRICE = pR_PRICE;
	}

	public String getPR_CONTENT() {
		return PR_CONTENT;
	}

	public void setPR_CONTENT(String pR_CONTENT) {
		PR_CONTENT = pR_CONTENT;
	}

	public int getPR_CARLORY() {
		return PR_CARLORY;
	}

	public void setPR_CARLORY(int pR_CARLORY) {
		PR_CARLORY = pR_CARLORY;
	}

	public String getPR_FROM() {
		return PR_FROM;
	}

	public void setPR_FROM(String pR_FROM) {
		PR_FROM = pR_FROM;
	}

	public String getPR_SIZE() {
		return PR_SIZE;
	}

	public void setPR_SIZE(String pR_SIZE) {
		PR_SIZE = pR_SIZE;
	}

	public Product(int pR_CODE, String pR_CATE1, String pR_CATE2, String pR_NAME, int pR_PRICE, String pR_CONTENT,
			int pR_CARLORY, String pR_FROM, String pR_SIZE, int pR_ENTITY) {
		super();
		PR_CODE = pR_CODE;
		PR_CATE1 = pR_CATE1;
		PR_CATE2 = pR_CATE2;
		PR_NAME = pR_NAME;
		PR_PRICE = pR_PRICE;
		PR_CONTENT = pR_CONTENT;
		PR_CARLORY = pR_CARLORY;
		PR_FROM = pR_FROM;
		PR_SIZE = pR_SIZE;
		PR_ENTITY = pR_ENTITY;
	}

	@Override
	public String toString() {
		return "Product [PR_CODE=" + PR_CODE + ", PR_CATE1=" + PR_CATE1 + ", PR_CATE2=" + PR_CATE2 + ", PR_NAME="
				+ PR_NAME + ", PR_PRICE=" + PR_PRICE + ", PR_CONTENT=" + PR_CONTENT + ", PR_CARLORY=" + PR_CARLORY
				+ ", PR_FROM=" + PR_FROM + ", PR_SIZE=" + PR_SIZE + ", PR_ENTITY=" + PR_ENTITY + "]";
	}

	public int getPR_ENTITY() {
		return PR_ENTITY;
	}

	public void setPR_ENTITY(int pR_ENTITY) {
		PR_ENTITY = pR_ENTITY;
	}



}