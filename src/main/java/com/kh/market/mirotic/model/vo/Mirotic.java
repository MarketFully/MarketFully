package com.kh.market.mirotic.model.vo;

import java.sql.Date;

import com.kh.market.product.model.vo.Product;

public class Mirotic {
	private int or_num;
	private int me_num;
	private int mb_each;
	private int pr_code;
	private int pr_each;
	private int or_total;
	private Date or_date;
	private String or_status;
	private String sender_name;
	private String sender_addr;
	private String sender_phone;
	private int shipping_code;
	private int mem_num;
	
	private Product product;
	
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Mirotic() {
		super();
	}

	public Mirotic(int or_num, int me_num, int mb_each, int pr_code, int pr_each, int or_total, Date or_date,
			String or_status, String sender_name, String sender_addr, String sender_phone, int shipping_code,
			int mem_num, Product product) {
		super();
		this.or_num = or_num;
		this.me_num = me_num;
		this.mb_each = mb_each;
		this.pr_code = pr_code;
		this.pr_each = pr_each;
		this.or_total = or_total;
		this.or_date = or_date;
		this.or_status = or_status;
		this.sender_name = sender_name;
		this.sender_addr = sender_addr;
		this.sender_phone = sender_phone;
		this.shipping_code = shipping_code;
		this.mem_num = mem_num;
		this.product = product;
	}

	public int getOr_num() {
		return or_num;
	}

	public void setOr_num(int or_num) {
		this.or_num = or_num;
	}

	public int getMe_num() {
		return me_num;
	}

	public void setMe_num(int me_num) {
		this.me_num = me_num;
	}

	public int getMb_each() {
		return mb_each;
	}

	public void setMb_each(int mb_each) {
		this.mb_each = mb_each;
	}

	public int getPr_code() {
		return pr_code;
	}

	public void setPr_code(int pr_code) {
		this.pr_code = pr_code;
	}

	public int getPr_each() {
		return pr_each;
	}

	public void setPr_each(int pr_each) {
		this.pr_each = pr_each;
	}

	public int getOr_total() {
		return or_total;
	}

	public void setOr_total(int or_total) {
		this.or_total = or_total;
	}

	public Date getOr_date() {
		return or_date;
	}

	public void setOr_date(Date or_date) {
		this.or_date = or_date;
	}

	public String getOr_status() {
		return or_status;
	}

	public void setOr_status(String or_status) {
		this.or_status = or_status;
	}

	public String getSender_name() {
		return sender_name;
	}

	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}

	public String getSender_addr() {
		return sender_addr;
	}

	public void setSender_addr(String sender_addr) {
		this.sender_addr = sender_addr;
	}

	public String getSender_phone() {
		return sender_phone;
	}

	public void setSender_phone(String sender_phone) {
		this.sender_phone = sender_phone;
	}

	public int getShipping_code() {
		return shipping_code;
	}

	public void setShipping_code(int shipping_code) {
		this.shipping_code = shipping_code;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	@Override
	public String toString() {
		return "Mirotic [or_num=" + or_num + ", me_num=" + me_num + ", mb_each=" + mb_each + ", pr_code=" + pr_code
				+ ", pr_each=" + pr_each + ", or_total=" + or_total + ", or_date=" + or_date + ", or_status="
				+ or_status + ", sender_name=" + sender_name + ", sender_addr=" + sender_addr + ", sender_phone="
				+ sender_phone + ", shipping_code=" + shipping_code + ", mem_num=" + mem_num + ", product=" + product
				+ "]";
	}
	 
}
