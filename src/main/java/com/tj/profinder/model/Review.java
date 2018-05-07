package com.tj.profinder.model;

import java.sql.Timestamp;

public class Review {
	private String re_num;
	private String re_connum;
	private String re_name;
	private String re_content;
	private Timestamp re_date;
	private int re_star;
	
	public Review() {}

	public Review(String re_num, String re_connum, String re_name, String re_content, Timestamp re_date, int re_star) {
		super();
		this.re_num = re_num;
		this.re_connum = re_connum;
		this.re_name = re_name;
		this.re_content = re_content;
		this.re_date = re_date;
		this.re_star = re_star;
	}

	public String getRe_num() {
		return re_num;
	}

	public void setRe_num(String re_num) {
		this.re_num = re_num;
	}

	public String getRe_connum() {
		return re_connum;
	}

	public void setRe_connum(String re_connum) {
		this.re_connum = re_connum;
	}

	public String getRe_name() {
		return re_name;
	}

	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public Timestamp getRe_date() {
		return re_date;
	}

	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}

	public int getRe_star() {
		return re_star;
	}

	public void setRe_star(int re_star) {
		this.re_star = re_star;
	}

}
