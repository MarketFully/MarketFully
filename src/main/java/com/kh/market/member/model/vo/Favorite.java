package com.kh.market.member.model.vo;

import com.kh.market.recipe.model.vo.Board;

public class Favorite {
	private int mem_num;
	private int mb_bo_num;
	private int mb_num;
	
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


	public Favorite(int mem_num, int mb_bo_num, int mb_num, Board uboard, Board tboard) {
		super();
		this.mem_num = mem_num;
		this.mb_bo_num = mb_bo_num;
		this.mb_num = mb_num;
		Uboard = uboard;
		Tboard = tboard;
	}


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


	@Override
	public String toString() {
		return "Favorite [mem_num=" + mem_num + ", mb_bo_num=" + mb_bo_num + ", mb_num=" + mb_num + ", Uboard=" + Uboard
				+ ", Tboard=" + Tboard + "]";
	}

}
