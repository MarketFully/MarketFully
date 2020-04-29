package com.kh.market.product.model.vo;

public class ProductRank {
	private int pr_code;
	private int sum;

	public int getPr_code() {
		return pr_code;
	}

	public void setPr_code(int pr_code) {
		this.pr_code = pr_code;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public ProductRank(int pr_code, int sum) {
		super();
		this.pr_code = pr_code;
		this.sum = sum;
	}

	public ProductRank() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ProductRank [pr_code=" + pr_code + ", sum=" + sum + "]";
	}

}
