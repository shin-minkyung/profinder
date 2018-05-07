package com.tj.profinder.model;

import java.sql.Date;

public class Claim {
	private String cl_num;
	private String cl_email;
	private String cl_title;
	private String cl_content;
	private Date cl_date;
	private String cl_cate;
	private int cl_status;
	private String cl_nickname;
	private int startRow;
	private int endRow;
	private String searchWord;
	public Claim() {}


	

	public Claim(String cl_num, String cl_email, String cl_title, String cl_content, Date cl_date, String cl_cate,
			int cl_status, String cl_nickname, int startRow, int endRow, String searchWord) {
		super();
		this.cl_num = cl_num;
		this.cl_email = cl_email;
		this.cl_title = cl_title;
		this.cl_content = cl_content;
		this.cl_date = cl_date;
		this.cl_cate = cl_cate;
		this.cl_status = cl_status;
		this.cl_nickname = cl_nickname;
		this.startRow = startRow;
		this.endRow = endRow;
		this.searchWord = searchWord;
	}




	@Override
	public String toString() {
		return "Claim [cl_num=" + cl_num + ", cl_email=" + cl_email + ", cl_title=" + cl_title + ", cl_content="
				+ cl_content + ", cl_date=" + cl_date + ", cl_cate=" + cl_cate + ", cl_status=" + cl_status
				+ ", cl_nickname=" + cl_nickname + ", startRow=" + startRow + ", endRow=" + endRow + ", searchWord="
				+ searchWord + "]";
	}




	public String getSearchWord() {
		return searchWord;
	}




	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
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

	public String getCl_title() {
		return cl_title;
	}

	public void setCl_title(String cl_title) {
		this.cl_title = cl_title;
	}

	public String getCl_nickname() {
		return cl_nickname;
	}

	public void setCl_nickname(String cl_nickname) {
		this.cl_nickname = cl_nickname;
	}

	public String getCl_num() {
		return cl_num;
	}

	public void setCl_num(String cl_num) {
		this.cl_num = cl_num;
	}

	public String getCl_email() {
		return cl_email;
	}

	public void setCl_email(String cl_email) {
		this.cl_email = cl_email;
	}

	public String getCl_content() {
		return cl_content;
	}

	public void setCl_content(String cl_content) {
		this.cl_content = cl_content;
	}

	public Date getCl_date() {
		return cl_date;
	}

	public void setCl_date(Date cl_date) {
		this.cl_date = cl_date;
	}

	public String getCl_cate() {
		return cl_cate;
	}

	public void setCl_cate(String cl_cate) {
		this.cl_cate = cl_cate;
	}

	public int getCl_status() {
		return cl_status;
	}

	public void setCl_status(int cl_status) {
		this.cl_status = cl_status;
	}
	
	
}
