package com.kh.market.servicecenter.model.vo;

public class ServiceCenterRecipeSuggestBoard {
	private int rb_num;
	private String rb_title;
	private String rb_foodcategory;
	private String rb_content;
	private String rb_writer;
	private String rb_date;
	private String rb_file;
	private String rb_refile;
	private int rb_thank;
	private int rb_nothank;
	private String rb_status;
	private int rb_count;
	
	public ServiceCenterRecipeSuggestBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ServiceCenterRecipeSuggestBoard(int rb_num, String rb_title, String rb_foodcategory, String rb_content,
			String rb_writer, String rb_date, String rb_file, String rb_refile, int rb_thank, int rb_nothank,
			String rb_status, int rb_count) {
		super();
		this.rb_num = rb_num;
		this.rb_title = rb_title;
		this.rb_foodcategory = rb_foodcategory;
		this.rb_content = rb_content;
		this.rb_writer = rb_writer;
		this.rb_date = rb_date;
		this.rb_file = rb_file;
		this.rb_refile = rb_refile;
		this.rb_thank = rb_thank;
		this.rb_nothank = rb_nothank;
		this.rb_status = rb_status;
		this.rb_count = rb_count;
	}

	public int getRb_num() {
		return rb_num;
	}

	public void setRb_num(int rb_num) {
		this.rb_num = rb_num;
	}

	public String getRb_title() {
		return rb_title;
	}

	public void setRb_title(String rb_title) {
		this.rb_title = rb_title;
	}

	public String getRb_foodcategory() {
		return rb_foodcategory;
	}

	public void setRb_foodcategory(String rb_foodcategory) {
		this.rb_foodcategory = rb_foodcategory;
	}

	public String getRb_content() {
		return rb_content;
	}

	public void setRb_content(String rb_content) {
		this.rb_content = rb_content;
	}

	public String getRb_writer() {
		return rb_writer;
	}

	public void setRb_writer(String rb_writer) {
		this.rb_writer = rb_writer;
	}

	public String getRb_date() {
		return rb_date;
	}

	public void setRb_date(String rb_date) {
		this.rb_date = rb_date;
	}

	public String getRb_file() {
		return rb_file;
	}

	public void setRb_file(String rb_file) {
		this.rb_file = rb_file;
	}

	public String getRb_refile() {
		return rb_refile;
	}

	public void setRb_refile(String rb_refile) {
		this.rb_refile = rb_refile;
	}

	public int getRb_thank() {
		return rb_thank;
	}

	public void setRb_thank(int rb_thank) {
		this.rb_thank = rb_thank;
	}

	public int getRb_nothank() {
		return rb_nothank;
	}

	public void setRb_nothank(int rb_nothank) {
		this.rb_nothank = rb_nothank;
	}

	public String getRb_status() {
		return rb_status;
	}

	public void setRb_status(String rb_status) {
		this.rb_status = rb_status;
	}

	public int getRb_count() {
		return rb_count;
	}

	public void setRb_count(int rb_count) {
		this.rb_count = rb_count;
	}

	@Override
	public String toString() {
		return "ServiceCenterRecipeSuggestBoard [rb_num=" + rb_num + ", rb_title=" + rb_title + ", rb_foodcategory="
				+ rb_foodcategory + ", rb_content=" + rb_content + ", rb_writer=" + rb_writer + ", rb_date=" + rb_date
				+ ", rb_file=" + rb_file + ", rb_refile=" + rb_refile + ", rb_thank=" + rb_thank + ", rb_nothank="
				+ rb_nothank + ", rb_status=" + rb_status + ", rb_count=" + rb_count + "]";
	}

	
	
	
	
	
}
