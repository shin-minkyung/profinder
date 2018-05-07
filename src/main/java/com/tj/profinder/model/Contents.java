package com.tj.profinder.model;

import java.sql.Timestamp;

public class Contents {
	private String con_num;
	private String p_email;
	private String con_title;
	private String con_content;
	private String con_file1;
	private String con_file2;
	private String con_file3;
	private int con_price;
	private Timestamp con_date;
	private int cate_num;
	private int con_download;
	private int con_del;
	private int rn;
	private int cnt;
	private String p_nickname;
	private int startRow;
	private int endRow;
	private String searchWord;
	private int lcnt;
	
	
	public Contents() {}

	public Contents(String con_num, String p_email, String con_title, String con_content, String con_file1,
			String con_file2, String con_file3, int con_price, Timestamp con_date, int cate_num, int con_download,
			int con_del, int rn, int cnt, String p_nickname, int startRow, int endRow, String searchWord) {
		super();
		this.con_num = con_num;
		this.p_email = p_email;
		this.con_title = con_title;
		this.con_content = con_content;
		this.con_file1 = con_file1;
		this.con_file2 = con_file2;
		this.con_file3 = con_file3;
		this.con_price = con_price;
		this.con_date = con_date;
		this.cate_num = cate_num;
		this.con_download = con_download;
		this.con_del = con_del;
		this.rn = rn;
		this.cnt = cnt;
		this.p_nickname = p_nickname;
		this.startRow = startRow;
		this.endRow = endRow;
		this.searchWord = searchWord;
	}

	public int getLcnt() {
		return lcnt;
	}

	public void setLcnt(int lcnt) {
		this.lcnt = lcnt;
	}

	

	public String getCon_num() {
		return con_num;
	}

	public void setCon_num(String con_num) {
		this.con_num = con_num;
	}

	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getCon_title() {
		return con_title;
	}

	public void setCon_title(String con_title) {
		this.con_title = con_title;
	}

	public String getCon_content() {
		return con_content;
	}

	public void setCon_content(String con_content) {
		this.con_content = con_content;
	}

	public String getCon_file1() {
		return con_file1;
	}

	public void setCon_file1(String con_file1) {
		this.con_file1 = con_file1;
	}

	public String getCon_file2() {
		return con_file2;
	}

	public void setCon_file2(String con_file2) {
		this.con_file2 = con_file2;
	}

	public String getCon_file3() {
		return con_file3;
	}

	public void setCon_file3(String con_file3) {
		this.con_file3 = con_file3;
	}

	public int getCon_price() {
		return con_price;
	}

	public void setCon_price(int con_price) {
		this.con_price = con_price;
	}

	public Timestamp getCon_date() {
		return con_date;
	}

	public void setCon_date(Timestamp con_date) {
		this.con_date = con_date;
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public int getCon_download() {
		return con_download;
	}

	public void setCon_download(int con_download) {
		this.con_download = con_download;
	}

	public int getCon_del() {
		return con_del;
	}

	public void setCon_del(int con_del) {
		this.con_del = con_del;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getP_nickname() {
		return p_nickname;
	}

	public void setP_nickname(String p_nickname) {
		this.p_nickname = p_nickname;
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

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	@Override
	public String toString() {
		return "Contents [con_num=" + con_num + ", p_email=" + p_email + ", con_title=" + con_title + ", con_content="
				+ con_content + ", con_file1=" + con_file1 + ", con_file2=" + con_file2 + ", con_file3=" + con_file3
				+ ", con_price=" + con_price + ", con_date=" + con_date + ", cate_num=" + cate_num + ", con_download="
				+ con_download + ", con_del=" + con_del + ", rn=" + rn + ", cnt=" + cnt + ", p_nickname=" + p_nickname
				+ ", startRow=" + startRow + ", endRow=" + endRow + ", searchWord=" + searchWord + "]";
	}
	
}
