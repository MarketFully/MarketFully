package com.kh.market.servicecenter.model.vo;

public class ServiceCenterBoardLike {
	private int mem_num;
	private int rb_num;
	
	public ServiceCenterBoardLike() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ServiceCenterBoardLike(int mem_num, int rb_num) {
		super();
		this.mem_num = mem_num;
		this.rb_num = rb_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getRb_num() {
		return rb_num;
	}

	public void setRb_num(int rb_num) {
		this.rb_num = rb_num;
	}

	@Override
	public String toString() {
		return "ServiceCenterBoardLike [mem_num=" + mem_num + ", rb_num=" + rb_num + "]";
	}
	
	
	
}
