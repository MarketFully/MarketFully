package com.kh.market.mirotic.model.vo;

public class totalPrice {

	private int total1;
	private int total2;
	public int getTotal1() {
		return total1;
	}
	public void setTotal1(int total1) {
		this.total1 = total1;
	}
	public int getTotal2() {
		return total2;
	}
	public void setTotal2(int total2) {
		this.total2 = total2;
	}
	public totalPrice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public totalPrice(int total1, int total2) {
		super();
		this.total1 = total1;
		this.total2 = total2;
	}
	@Override
	public String toString() {
		return "totalPrice [total1=" + total1 + ", total2=" + total2 + "]";
	}
	
	
}
