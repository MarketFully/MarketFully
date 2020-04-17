package com.kh.market.recipe.model.vo;

public class SearchInfo {

	private String src_cate;	//검색 카테고리
	private String src_input;	//검색어
	private int mc_cate_num;	//레시피 카테고리 번호	
	
	private String product;		// 혹시 쓸까봐 만들어놨음
	private String count;		// 혹시 쓸까봐 만들어놨음
	
	
	
	public SearchInfo() {}



	public String getSrc_cate() {
		return src_cate;
	}



	public void setSrc_cate(String src_cate) {
		this.src_cate = src_cate;
	}



	public String getSrc_input() {
		return src_input;
	}



	public void setSrc_input(String src_input) {
		this.src_input = src_input;
	}



	public int getMc_cate_num() {
		return mc_cate_num;
	}



	public void setMc_cate_num(int mc_cate_num) {
		this.mc_cate_num = mc_cate_num;
	}



	public String getProduct() {
		return product;
	}



	public void setProduct(String product) {
		this.product = product;
	}



	public String getCount() {
		return count;
	}



	public void setCount(String count) {
		this.count = count;
	}



	@Override
	public String toString() {
		return "SearchInfo [src_cate=" + src_cate + ", src_input=" + src_input + ", mc_cate_num=" + mc_cate_num
				+ ", product=" + product + ", count=" + count + "]";
	}



	public SearchInfo(String src_cate, String src_input, int mc_cate_num, String product, String count) {
		this.src_cate = src_cate;
		this.src_input = src_input;
		this.mc_cate_num = mc_cate_num;
		this.product = product;
		this.count = count;
	}
		
	
	
}
