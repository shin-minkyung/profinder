package com.tj.profinder.model;

import java.sql.Timestamp;

public class Question {
	private String q_num;
	private String p_email;
	private String f_email;
	private int cate_num;
	private String q_title;
	private String q_content;
	private Timestamp q_date;
	private int q_price;
	private int q_accept;
	private int q_show;
	private int q_star;
	private int startRow;
	private int endRow;
	private int cnt;
	private int rn;
	private String p_nickname;
	private int likecnt;
	private String searchWord;
	
	public Question() {}


	public Question(String q_num, String p_email, String f_email, int cate_num, String q_title, String q_content,
			Timestamp q_date, int q_price, int q_accept, int q_show, int q_star, int startRow, int endRow, int cnt,
			int rn, String p_nickname, int likecnt, String searchWord) {
		super();
		this.q_num = q_num;
		this.p_email = p_email;
		this.f_email = f_email;
		this.cate_num = cate_num;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.q_price = q_price;
		this.q_accept = q_accept;
		this.q_show = q_show;
		this.q_star = q_star;
		this.startRow = startRow;
		this.endRow = endRow;
		this.cnt = cnt;
		this.rn = rn;
		this.p_nickname = p_nickname;
		this.likecnt = likecnt;
		this.searchWord = searchWord;
	}
	

	public String getSearchWord() {
		return searchWord;
	}


	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}


	public String getQ_num() {
		return q_num;
	}


	public void setQ_num(String q_num) {
		this.q_num = q_num;
	}


	public String getP_email() {
		return p_email;
	}


	public void setP_email(String p_email) {
		this.p_email = p_email;
	}


	public String getF_email() {
		return f_email;
	}


	public void setF_email(String f_email) {
		this.f_email = f_email;
	}


	public int getCate_num() {
		return cate_num;
	}


	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}


	public String getQ_title() {
		return q_title;
	}


	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}


	public String getQ_content() {
		return q_content;
	}


	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}


	public Timestamp getQ_date() {
		return q_date;
	}


	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}


	public int getQ_price() {
		return q_price;
	}


	public void setQ_price(int q_price) {
		this.q_price = q_price;
	}


	public int getQ_accept() {
		return q_accept;
	}


	public void setQ_accept(int q_accept) {
		this.q_accept = q_accept;
	}


	public int getQ_show() {
		return q_show;
	}


	public void setQ_show(int q_show) {
		this.q_show = q_show;
	}


	public int getQ_star() {
		return q_star;
	}


	public void setQ_star(int q_star) {
		this.q_star = q_star;
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


	public String getP_nickname() {
		return p_nickname;
	}


	public void setP_nickname(String p_nickname) {
		this.p_nickname = p_nickname;
	}


	public int getLikecnt() {
		return likecnt;
	}


	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}


	@Override
	public String toString() {
		return "Question [q_num=" + q_num + ", p_email=" + p_email + ", f_email=" + f_email + ", cate_num=" + cate_num
				+ ", q_title=" + q_title + ", q_content=" + q_content + ", q_date=" + q_date + ", q_price=" + q_price
				+ ", q_accept=" + q_accept + ", q_show=" + q_show + ", q_star=" + q_star + ", startRow=" + startRow
				+ ", endRow=" + endRow + ", cnt=" + cnt + ", rn=" + rn + ", p_nickname=" + p_nickname + ", likecnt="
				+ likecnt + "]";
	}
	
}
