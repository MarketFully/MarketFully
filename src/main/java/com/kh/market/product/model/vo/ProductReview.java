package com.kh.market.product.model.vo;

import java.sql.Date;

public class ProductReview {

	 
	private int prcode;	  // 상품 코드
	private int re_num;		  // 댓글 번호	
	private String re_title;  // 제목
	private String re_writer; // 작성자
	private Date re_date;	  // 작성일
	private String re_content;// 내용
	private int re_thank;	  // 좋아요
	private int re_count;	  // 조회수
	private String re_status;	  // 사용여부
	private String re_orign;  // 사진
	private String re_rename; // 사진
	private int mem_num; // 회원 번호
	private int or_num; //주문 번호

	public ProductReview() {
		super();
	}

	public ProductReview(int prcode, int re_num, String re_title, String re_writer, Date re_date, String re_content,
			int re_thank, int re_count, String re_status, String re_orign, String re_rename, int mem_num, int or_num) {
		super();
		this.prcode = prcode;
		this.re_num = re_num;
		this.re_title = re_title;
		this.re_writer = re_writer;
		this.re_date = re_date;
		this.re_content = re_content;
		this.re_thank = re_thank;
		this.re_count = re_count;
		this.re_status = re_status;
		this.re_orign = re_orign;
		this.re_rename = re_rename;
		this.mem_num = mem_num;
		this.or_num = or_num;
	}

	public int getPrcode() {
		return prcode;
	}

	public void setPrcode(int prcode) {
		this.prcode = prcode;
	}

	public int getRe_num() {
		return re_num;
	}

	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}

	public String getRe_title() {
		return re_title;
	}

	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}

	public String getRe_writer() {
		return re_writer;
	}

	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}

	public Date getRe_date() {
		return re_date;
	}

	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public int getRe_thank() {
		return re_thank;
	}

	public void setRe_thank(int re_thank) {
		this.re_thank = re_thank;
	}

	public int getRe_count() {
		return re_count;
	}

	public void setRe_count(int re_count) {
		this.re_count = re_count;
	}

	public String getRe_status() {
		return re_status;
	}

	public void setRe_status(String re_status) {
		this.re_status = re_status;
	}

	public String getRe_orign() {
		return re_orign;
	}

	public void setRe_orign(String re_orign) {
		this.re_orign = re_orign;
	}

	public String getRe_rename() {
		return re_rename;
	}

	public void setRe_rename(String re_rename) {
		this.re_rename = re_rename;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	

	public int getOr_num() {
		return or_num;
	}

	public void setOr_num(int or_num) {
		this.or_num = or_num;
	}

	@Override
	public String toString() {
		return "ProductReview [prcode=" + prcode + ", re_num=" + re_num + ", re_title=" + re_title + ", re_writer="
				+ re_writer + ", re_date=" + re_date + ", re_content=" + re_content + ", re_thank=" + re_thank
				+ ", re_count=" + re_count + ", re_status=" + re_status + ", re_orign=" + re_orign + ", re_rename="
				+ re_rename + ", mem_num=" + mem_num + ", or_num=" + or_num + "]";
	}

	
	
	
	
}
