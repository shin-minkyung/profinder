package com.tj.profinder.model;

import java.sql.Timestamp;

public class Newsfeed {
	private String n_num;
	private String p_email;
	private String n_title;
	private String n_content;
	private Timestamp n_date;
	private int n_hit;
	private int n_del;
	private String n_ip;
	private int cate_num;
	private String p_nickname;
	private int rn;
	private int cnt;
	private String cate_name;
	private String p_photo1;
	private int ccnt;
	private int lcnt;
	public Newsfeed() {}

	public Newsfeed(String n_num, String p_email, String n_title, String n_content, Timestamp n_date,
			int n_hit, int n_del, String n_ip, int cate_num,String p_nickname,int rn) {
		super();
		this.n_num = n_num;
		this.p_email = p_email;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_date = n_date;
		this.n_hit = n_hit;
		this.n_del = n_del;
		this.n_ip = n_ip;
		this.cate_num = cate_num;
		this.p_nickname = p_nickname;
		this.rn = rn;
	}
	
	@Override
	public String toString() {
		return "Newspeed [n_num=" + n_num + ", p_email=" + p_email + ", n_title=" + n_title + ", n_content=" + n_content
				+ ", n_date=" + n_date + ", n_hit=" + n_hit + ", n_del=" + n_del + ", n_ip="
				+ n_ip + ", cate_num=" + cate_num +", p_nickname"+p_nickname+", rn"+ rn +"]";
	}
	
	public int getCcnt() {
		return ccnt;
	}

	public void setCcnt(int ccnt) {
		this.ccnt = ccnt;
	}

	public int getLcnt() {
		return lcnt;
	}

	public void setLcnt(int lcnt) {
		this.lcnt = lcnt;
	}

	public String getP_photo1() {
		return p_photo1;
	}

	public void setP_photo1(String p_photo1) {
		this.p_photo1 = p_photo1;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
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

	public String getN_num() {
		return n_num;
	}

	public void setN_num(String n_num) {
		this.n_num = n_num;
	}

	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}


	public Timestamp getN_date() {
		return n_date;
	}

	public void setN_date(Timestamp n_date) {
		this.n_date = n_date;
	}

	public int getN_hit() {
		return n_hit;
	}

	public void setN_hit(int n_hit) {
		this.n_hit = n_hit;
	}

	public int getN_del() {
		return n_del;
	}

	public void setN_del(int n_del) {
		this.n_del = n_del;
	}

	public String getN_ip() {
		return n_ip;
	}

	public void setN_ip(String n_ip) {
		this.n_ip = n_ip;
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}
	
}
