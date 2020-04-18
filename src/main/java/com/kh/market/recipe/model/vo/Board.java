package com.kh.market.recipe.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board {
	
	private int mb_num;
	private String mb_title;
	private String mb_content;
	private Date mb_cdate;
	private String mb_writer;
	private String mb_image;
	private int mb_thank;
	private int mb_count;
	private int mb_rcount;
	private String mb_status;
	private String mb_type;
	private int mc_cate_num;

	private Menu_Category mc;
	
	public int getMb_num() {
		return mb_num;
	}

	public void setMb_num(int mb_num) {
		this.mb_num = mb_num;
	}

	public String getMb_title() {
		return mb_title;
	}

	public void setMb_title(String mb_title) {
		this.mb_title = mb_title;
	}

	public String getMb_content() {
		return mb_content;
	}

	public void setMb_content(String mb_content) {
		this.mb_content = mb_content;
	}

	public Date getMb_cdate() {
		return mb_cdate;
	}

	public void setMb_cdate(Date mb_cdate) {
		this.mb_cdate = mb_cdate;
	}

	public String getMb_writer() {
		return mb_writer;
	}

	public void setMb_writer(String mb_writer) {
		this.mb_writer = mb_writer;
	}

	public String getMb_image() {
		return mb_image;
	}

	public void setMb_image(String mb_image) {
		this.mb_image = mb_image;
	}

	public int getMb_thank() {
		return mb_thank;
	}

	public void setMb_thank(int mb_thank) {
		this.mb_thank = mb_thank;
	}

	public int getMb_count() {
		return mb_count;
	}

	public void setMb_count(int mb_count) {
		this.mb_count = mb_count;
	}

	public int getMb_rcount() {
		return mb_rcount;
	}

	public void setMb_rcount(int mb_rcount) {
		this.mb_rcount = mb_rcount;
	}

	public String getMb_status() {
		return mb_status;
	}

	public void setMb_status(String mb_status) {
		this.mb_status = mb_status;
	}

	public String getMb_type() {
		return mb_type;
	}

	public void setMb_type(String mb_type) {
		this.mb_type = mb_type;
	}

	public int getMc_cate_num() {
		return mc_cate_num;
	}

	public void setMc_cate_num(int mc_cate_num) {
		this.mc_cate_num = mc_cate_num;
	}

	public Menu_Category getMc() {
		return mc;
	}

	public void setMc(Menu_Category mc) {
		this.mc = mc;
	}

	@Override
	public String toString() {
		return "Board [mb_num=" + mb_num + ", mb_title=" + mb_title + ", mb_content=" + mb_content + ", mb_cdate="
				+ mb_cdate + ", mb_writer=" + mb_writer + ", mb_image=" + mb_image + ", mb_thank=" + mb_thank
				+ ", mb_count=" + mb_count + ", mb_rcount=" + mb_rcount + ", mb_status=" + mb_status + ", mb_type="
				+ mb_type + ", mc_cate_num=" + mc_cate_num + ", mc=" + mc + "]";
	}

	public Board(int mb_num, String mb_title, String mb_content, Date mb_cdate, String mb_writer, String mb_image,
			int mb_thank, int mb_count, int mb_rcount, String mb_status, String mb_type, int mc_cate_num,
			Menu_Category mc) {
		super();
		this.mb_num = mb_num;
		this.mb_title = mb_title;
		this.mb_content = mb_content;
		this.mb_cdate = mb_cdate;
		this.mb_writer = mb_writer;
		this.mb_image = mb_image;
		this.mb_thank = mb_thank;
		this.mb_count = mb_count;
		this.mb_rcount = mb_rcount;
		this.mb_status = mb_status;
		this.mb_type = mb_type;
		this.mc_cate_num = mc_cate_num;
		this.mc = mc;
	}

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

}
