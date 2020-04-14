package com.kh.market.recipe.model.vo;

import java.io.Serializable;

public class Menu_Category implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int mc_cate_num;
	private String mc_name;
	
	public Menu_Category() {}

	public int getMc_cate_num() {
		return mc_cate_num;
	}

	public void setMc_cate_num(int mc_cate_num) {
		this.mc_cate_num = mc_cate_num;
	}

	public String getMc_name() {
		return mc_name;
	}

	public void setMc_name(String mc_name) {
		this.mc_name = mc_name;
	}

	@Override
	public String toString() {
		return "Menu_Category [mc_cate_num=" + mc_cate_num + ", mc_name=" + mc_name + "]";
	}

	public Menu_Category(int mc_cate_num, String mc_name) {
	
		this.mc_cate_num = mc_cate_num;
		this.mc_name = mc_name;
	}
	
	

}