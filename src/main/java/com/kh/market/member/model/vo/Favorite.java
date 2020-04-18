package com.kh.market.member.model.vo;

import com.kh.market.recipe.model.vo.Board;

public class Favorite {
	private int MEM_NUM;
	private int MB_BO_NUM;
	private int MB_NUM;
	
	private Board Uboard;
	private Board Tboard;
	
	public Board getUboard() {
		return Uboard;
	}


	public void setUboard(Board uboard) {
		Uboard = uboard;
	}


	public Board getTboard() {
		return Tboard;
	}


	public void setTboard(Board tboard) {
		Tboard = tboard;
	}


	public Favorite() {
		super();
	}


	public Favorite(int mEM_NUM, int mB_BO_NUM, int mB_NUM, Board uboard, Board tboard) {
		super();
		MEM_NUM = mEM_NUM;
		MB_BO_NUM = mB_BO_NUM;
		MB_NUM = mB_NUM;
		Uboard = uboard;
		Tboard = tboard;
	}


	public int getMEM_NUM() {
		return MEM_NUM;
	}


	public void setMEM_NUM(int mEM_NUM) {
		MEM_NUM = mEM_NUM;
	}


	public int getMB_BO_NUM() {
		return MB_BO_NUM;
	}


	public void setMB_BO_NUM(int mB_BO_NUM) {
		MB_BO_NUM = mB_BO_NUM;
	}


	public int getMB_NUM() {
		return MB_NUM;
	}


	public void setMB_NUM(int mB_NUM) {
		MB_NUM = mB_NUM;
	}


	@Override
	public String toString() {
		return "Favorite [MEM_NUM=" + MEM_NUM + ", MB_BO_NUM=" + MB_BO_NUM + ", MB_NUM=" + MB_NUM + ", Uboard=" + Uboard
				+ ", Tboard=" + Tboard + "]";
	}

	
	
	


	
	
}
