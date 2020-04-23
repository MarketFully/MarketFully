package com.kh.market.mirotic.model.vo;

import java.sql.Date;

public class SHIPPING {

	private int shipping_code;
	private String shipping_status;
	private int shipping_price;
	private String receiver_name;
	private String receiver_addr;
	private String receiver_phone;
	private int ship_code;
	private String shipping_request;
	private Date shipping_date;
	private int or_num;
	
	
	public SHIPPING() {
	}


	public int getShipping_code() {
		return shipping_code;
	}


	public void setShipping_code(int shipping_code) {
		this.shipping_code = shipping_code;
	}


	public String getShipping_status() {
		return shipping_status;
	}


	public void setShipping_status(String shipping_status) {
		this.shipping_status = shipping_status;
	}


	public int getShipping_price() {
		return shipping_price;
	}


	public void setShipping_price(int shipping_price) {
		this.shipping_price = shipping_price;
	}


	public String getReceiver_name() {
		return receiver_name;
	}


	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}


	public String getReceiver_addr() {
		return receiver_addr;
	}


	public void setReceiver_addr(String receiver_addr) {
		this.receiver_addr = receiver_addr;
	}


	public String getReceiver_phone() {
		return receiver_phone;
	}


	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}


	public int getShip_code() {
		return ship_code;
	}


	public void setShip_code(int ship_code) {
		this.ship_code = ship_code;
	}


	public String getShipping_request() {
		return shipping_request;
	}


	public void setShipping_request(String shipping_request) {
		this.shipping_request = shipping_request;
	}


	public Date getShipping_date() {
		return shipping_date;
	}


	public void setShipping_date(Date shipping_date) {
		this.shipping_date = shipping_date;
	}


	public int getOr_num() {
		return or_num;
	}


	public void setOr_num(int or_num) {
		this.or_num = or_num;
	}


	@Override
	public String toString() {
		return "SHIPPING [shipping_code=" + shipping_code + ", shipping_status=" + shipping_status + ", shipping_price="
				+ shipping_price + ", receiver_name=" + receiver_name + ", receiver_addr=" + receiver_addr
				+ ", receiver_phone=" + receiver_phone + ", ship_code=" + ship_code + ", shipping_request="
				+ shipping_request + ", shipping_date=" + shipping_date + ", or_num=" + or_num + "]";
	}


	public SHIPPING(int shipping_code, String shipping_status, int shipping_price, String receiver_name,
			String receiver_addr, String receiver_phone, int ship_code, String shipping_request, Date shipping_date,
			int or_num) {
		super();
		this.shipping_code = shipping_code;
		this.shipping_status = shipping_status;
		this.shipping_price = shipping_price;
		this.receiver_name = receiver_name;
		this.receiver_addr = receiver_addr;
		this.receiver_phone = receiver_phone;
		this.ship_code = ship_code;
		this.shipping_request = shipping_request;
		this.shipping_date = shipping_date;
		this.or_num = or_num;
	}
	
	
	
	
	
	
}
