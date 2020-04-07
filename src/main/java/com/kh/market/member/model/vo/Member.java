package com.kh.market.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member {
	private int MEM_NUM;
	private String MEM_ID;
	private String MEM_PWD;
	private String MEM_EMAIL;
	private String MEM_PHONE;
	private String MEM_ADDR;
	private String MEM_NAME;
	private String MEM_GENDER;
	private String MEM_BIRTH;
	private int MEM_POINT;
	private String MEM_PROFILE;
	private String MEM_STATUS;
	private int SHIPPING_CODE;
	private String MEM_GRADE;
	private String MEM_CERT;
	private String MEM_SMS_AGREE;
	private String MEM_EMAIL_AGREE;
	
	public Member() {
		super();
	}

	
	public Member(int mEM_NUM, String mEM_ID, String mEM_PWD, String mEM_EMAIL, String mEM_PHONE, String mEM_ADDR,
			String mEM_NAME, String mEM_GENDER, String mEM_BIRTH, int mEM_POINT, String mEM_PROFILE, String mEM_STATUS,
			int sHIPPING_CODE, String mEM_GRADE, String mEM_CERT, String mEM_SMS_AGREE, String mEM_EMAIL_AGREE) {
		super();
		MEM_NUM = mEM_NUM;
		MEM_ID = mEM_ID;
		MEM_PWD = mEM_PWD;
		MEM_EMAIL = mEM_EMAIL;
		MEM_PHONE = mEM_PHONE;
		MEM_ADDR = mEM_ADDR;
		MEM_NAME = mEM_NAME;
		MEM_GENDER = mEM_GENDER;
		MEM_BIRTH = mEM_BIRTH;
		MEM_POINT = mEM_POINT;
		MEM_PROFILE = mEM_PROFILE;
		MEM_STATUS = mEM_STATUS;
		SHIPPING_CODE = sHIPPING_CODE;
		MEM_GRADE = mEM_GRADE;
		MEM_CERT = mEM_CERT;
		MEM_SMS_AGREE = mEM_SMS_AGREE;
		MEM_EMAIL_AGREE = mEM_EMAIL_AGREE;
	}


	public int getMEM_NUM() {
		return MEM_NUM;
	}

	public void setMEM_NUM(int mEM_NUM) {
		MEM_NUM = mEM_NUM;
	}

	public String getMEM_ID() {
		return MEM_ID;
	}

	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}

	public String getMEM_PWD() {
		return MEM_PWD;
	}

	public void setMEM_PWD(String mEM_PWD) {
		MEM_PWD = mEM_PWD;
	}

	public String getMEM_EMAIL() {
		return MEM_EMAIL;
	}

	public void setMEM_EMAIL(String mEM_EMAIL) {
		MEM_EMAIL = mEM_EMAIL;
	}

	public String getMEM_PHONE() {
		return MEM_PHONE;
	}

	public void setMEM_PHONE(String mEM_PHONE) {
		MEM_PHONE = mEM_PHONE;
	}

	public String getMEM_ADDR() {
		return MEM_ADDR;
	}

	public void setMEM_ADDR(String mEM_ADDR) {
		MEM_ADDR = mEM_ADDR;
	}

	public String getMEM_NAME() {
		return MEM_NAME;
	}

	public void setMEM_NAME(String mEM_NAME) {
		MEM_NAME = mEM_NAME;
	}

	public String getMEM_GENDER() {
		return MEM_GENDER;
	}

	public void setMEM_GENDER(String mEM_GENDER) {
		MEM_GENDER = mEM_GENDER;
	}

	public String getMEM_BIRTH() {
		return MEM_BIRTH;
	}

	public void setMEM_BIRTH(String mEM_BIRTH) {
		MEM_BIRTH = mEM_BIRTH;
	}

	public int getMEM_POINT() {
		return MEM_POINT;
	}

	public void setMEM_POINT(int mEM_POINT) {
		MEM_POINT = mEM_POINT;
	}

	public String getMEM_PROFILE() {
		return MEM_PROFILE;
	}

	public void setMEM_PROFILE(String mEM_PROFILE) {
		MEM_PROFILE = mEM_PROFILE;
	}

	public String getMEM_STATUS() {
		return MEM_STATUS;
	}

	public void setMEM_STATUS(String mEM_STATUS) {
		MEM_STATUS = mEM_STATUS;
	}

	public int getSHIPPING_CODE() {
		return SHIPPING_CODE;
	}

	public void setSHIPPING_CODE(int sHIPPING_CODE) {
		SHIPPING_CODE = sHIPPING_CODE;
	}

	public String getMEM_GRADE() {
		return MEM_GRADE;
	}

	public void setMEM_GRADE(String mEM_GRADE) {
		MEM_GRADE = mEM_GRADE;
	}
	
	

	public String getMEM_CERT() {
		return MEM_CERT;
	}


	public void setMEM_CERT(String mEM_CERT) {
		MEM_CERT = mEM_CERT;
	}


	public String getMEM_SMS_AGREE() {
		return MEM_SMS_AGREE;
	}


	public void setMEM_SMS_AGREE(String mEM_SMS_AGREE) {
		MEM_SMS_AGREE = mEM_SMS_AGREE;
	}


	public String getMEM_EMAIL_AGREE() {
		return MEM_EMAIL_AGREE;
	}


	public void setMEM_EMAIL_AGREE(String mEM_EMAIL_AGREE) {
		MEM_EMAIL_AGREE = mEM_EMAIL_AGREE;
	}


	@Override
	public String toString() {
		return "Member [MEM_NUM=" + MEM_NUM + ", MEM_ID=" + MEM_ID + ", MEM_PWD=" + MEM_PWD + ", MEM_EMAIL=" + MEM_EMAIL
				+ ", MEM_PHONE=" + MEM_PHONE + ", MEM_ADDR=" + MEM_ADDR + ", MEM_NAME=" + MEM_NAME + ", MEM_GENDER="
				+ MEM_GENDER + ", MEM_BIRTH=" + MEM_BIRTH + ", MEM_POINT=" + MEM_POINT + ", MEM_PROFILE=" + MEM_PROFILE
				+ ", MEM_STATUS=" + MEM_STATUS + ", SHIPPING_CODE=" + SHIPPING_CODE + ", MEM_GRADE=" + MEM_GRADE
				+ ", MEM_CERT=" + MEM_CERT + ", MEM_SMS_AGREE=" + MEM_SMS_AGREE + ", MEM_EMAIL_AGREE=" + MEM_EMAIL_AGREE
				+ "]";
	}

	
}
