package com.tj.profinder.model;

import java.sql.Date;

public class Promembers {
	private String p_email;
	private String p_pw;
	private String p_name;
	private String p_nickname;
	private String p_tel1;
	private String p_tel2;
	private String p_tel3;
	private String p_accountnum;
	private String p_bank;
	private String p_area;
	private int p_point;
	private String p_photo1;
	private int p_drop;
	private int p_suspend;
	private Date p_date;
	private String p_message;
	private String p_photo2;
	private int cate_num;
	private int cnt;
	private int rn;
	private int jjimCnt;
	private String p_spec;
	private int startRow;
	private int endRow;
	
	public Promembers() {}

	

	public Promembers(String p_email, String p_pw, String p_name, String p_nickname, String p_tel1, String p_tel2,
			String p_tel3, String p_accountnum, String p_bank, String p_area, int p_point, String p_photo1, int p_drop,
			int p_suspend, Date p_date, String p_message, String p_photo2, int cate_num, int cnt, int rn, int jjimCnt,
			String p_spec, int startRow, int endRow) {
		super();
		this.p_email = p_email;
		this.p_pw = p_pw;
		this.p_name = p_name;
		this.p_nickname = p_nickname;
		this.p_tel1 = p_tel1;
		this.p_tel2 = p_tel2;
		this.p_tel3 = p_tel3;
		this.p_accountnum = p_accountnum;
		this.p_bank = p_bank;
		this.p_area = p_area;
		this.p_point = p_point;
		this.p_photo1 = p_photo1;
		this.p_drop = p_drop;
		this.p_suspend = p_suspend;
		this.p_date = p_date;
		this.p_message = p_message;
		this.p_photo2 = p_photo2;
		this.cate_num = cate_num;
		this.cnt = cnt;
		this.rn = rn;
		this.jjimCnt = jjimCnt;
		this.p_spec = p_spec;
		this.startRow = startRow;
		this.endRow = endRow;
	}
	


	public int getStartRow() {
		return startRow;
	}



	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}



	public int getEndRow() {
		return endRow;
	}



	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}



	public String getP_spec() {
		return p_spec;
	}

	public void setP_spec(String p_spec) {
		this.p_spec = p_spec;
	}

	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getP_pw() {
		return p_pw;
	}

	public void setP_pw(String p_pw) {
		this.p_pw = p_pw;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_nickname() {
		return p_nickname;
	}

	public void setP_nickname(String p_nickname) {
		this.p_nickname = p_nickname;
	}

	public String getP_tel1() {
		return p_tel1;
	}

	public void setP_tel1(String p_tel1) {
		this.p_tel1 = p_tel1;
	}

	public String getP_tel2() {
		return p_tel2;
	}

	public void setP_tel2(String p_tel2) {
		this.p_tel2 = p_tel2;
	}

	public String getP_tel3() {
		return p_tel3;
	}

	public void setP_tel3(String p_tel3) {
		this.p_tel3 = p_tel3;
	}

	public String getP_accountnum() {
		return p_accountnum;
	}

	public void setP_accountnum(String p_accountnum) {
		this.p_accountnum = p_accountnum;
	}

	public String getP_bank() {
		return p_bank;
	}

	public void setP_bank(String p_bank) {
		this.p_bank = p_bank;
	}

	public String getP_area() {
		return p_area;
	}

	public void setP_area(String p_area) {
		this.p_area = p_area;
	}

	public int getP_point() {
		return p_point;
	}

	public void setP_point(int p_point) {
		this.p_point = p_point;
	}

	public String getP_photo1() {
		return p_photo1;
	}

	public void setP_photo1(String p_photo1) {
		this.p_photo1 = p_photo1;
	}

	public int getP_drop() {
		return p_drop;
	}

	public void setP_drop(int p_drop) {
		this.p_drop = p_drop;
	}

	public int getP_suspend() {
		return p_suspend;
	}

	public void setP_suspend(int p_suspend) {
		this.p_suspend = p_suspend;
	}

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}

	public String getP_message() {
		return p_message;
	}

	public void setP_message(String p_message) {
		this.p_message = p_message;
	}

	public String getP_photo2() {
		return p_photo2;
	}

	public void setP_photo2(String p_photo2) {
		this.p_photo2 = p_photo2;
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getJjimCnt() {
		return jjimCnt;
	}

	public void setJjimCnt(int jjimCnt) {
		this.jjimCnt = jjimCnt;
	}

	@Override
	public String toString() {
		return "Promembers [p_email=" + p_email + ", p_pw=" + p_pw + ", p_name=" + p_name + ", p_nickname=" + p_nickname
				+ ", p_tel1=" + p_tel1 + ", p_tel2=" + p_tel2 + ", p_tel3=" + p_tel3 + ", p_accountnum=" + p_accountnum
				+ ", p_bank=" + p_bank + ", p_area=" + p_area + ", p_point=" + p_point + ", p_photo1=" + p_photo1
				+ ", p_drop=" + p_drop + ", p_suspend=" + p_suspend + ", p_date=" + p_date + ", p_message=" + p_message
				+ ", p_photo2=" + p_photo2 + ", cate_num=" + cate_num + ", cnt=" + cnt + ", rn=" + rn + ", jjimCnt="
				+ jjimCnt + "]";
	}
		
}
