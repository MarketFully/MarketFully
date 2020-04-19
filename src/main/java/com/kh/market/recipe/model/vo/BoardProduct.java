package com.kh.market.recipe.model.vo;

import java.io.Serializable;

import com.kh.market.product.model.vo.Product;

public class BoardProduct implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int bId;	//게시판번호
	private int pcode;	//상품코드
	private int peach; 	//상품수량
	
	private Product prd;

	public Product getPrd() {
		return prd;
	}

	public void setPrd(Product prd) {
		this.prd = prd;
	}

	@Override
	public String toString() {
		return "BoardProduct [bId=" + bId + ", pcode=" + pcode + ", peach=" + peach + ", prd=" + prd + "]";
	}

	public BoardProduct() {}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public int getPcode() {
		return pcode;
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public int getPeach() {
		return peach;
	}

	public void setPeach(int peach) {
		this.peach = peach;
	}


	public BoardProduct(int bId, int pcode, int peach) {
		super();
		this.bId = bId;
		this.pcode = pcode;
		this.peach = peach;
	}
	
	
	
}
