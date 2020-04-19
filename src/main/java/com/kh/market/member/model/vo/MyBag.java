package com.kh.market.member.model.vo;

public class MyBag {
	
	private int mem_num; //회원 번호
	private int mb_bo_num; // 게시판 번호
	private int mb_num; //게시판 분류
	private int mb_each; //게시판 수량
	private int pr_code; //상품 코드
	private int pr_each; //상품 수량
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getMb_bo_num() {
		return mb_bo_num;
	}
	public void setMb_bo_num(int mb_bo_num) {
		this.mb_bo_num = mb_bo_num;
	}
	public int getMb_num() {
		return mb_num;
	}
	public void setMb_num(int mb_num) {
		this.mb_num = mb_num;
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
	@Override
	public String toString() {
		return "MyBag [mem_num=" + mem_num + ", mb_bo_num=" + mb_bo_num + ", mb_num=" + mb_num + ", mb_each=" + mb_each
				+ ", pr_code=" + pr_code + ", pr_each=" + pr_each + "]";
	}
	public MyBag(int mem_num, int mb_bo_num, int mb_num, int mb_each, int pr_code, int pr_each) {
		super();
		this.mem_num = mem_num;
		this.mb_bo_num = mb_bo_num;
		this.mb_num = mb_num;
		this.mb_each = mb_each;
		this.pr_code = pr_code;
		this.pr_each = pr_each;
	}
	
	public MyBag() {}
	
}
