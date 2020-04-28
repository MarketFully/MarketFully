package com.kh.market.admin.model.vo;

public class graphvo {

	private int price;
	private String Ddate;

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDdate() {
		return Ddate;
	}

	public void setDdate(String ddate) {
		Ddate = ddate;
	}

	public graphvo(int price, String ddate) {
		super();
		this.price = price;
		Ddate = ddate;
	}

	public graphvo() {
		super();
	}

	@Override
	public String toString() {
		return "graphvo [price=" + price + ", Ddate=" + Ddate + "]";
	}

}
