package com.tj.profinder.model;

public class Favorite {
	private String f_email;
	private String p_email;
	private int cate_num;
	private String cate_name;
	private int cnt;
	private int startRow;
	private int endRow;
	private String f_nickname;
	private String f_photo1;
	private String p_nickname;
	private String p_photo1;
	
	public Favorite() {}
	
		
	public Favorite(String f_email, String p_email, int cate_num, String cate_name, int cnt, int startRow, int endRow,
			String f_nickname, String f_photo1, String p_nickname, String p_photo1) {
		super();
		this.f_email = f_email;
		this.p_email = p_email;
		this.cate_num = cate_num;
		this.cate_name = cate_name;
		this.cnt = cnt;
		this.startRow = startRow;
		this.endRow = endRow;
		this.f_nickname = f_nickname;
		this.f_photo1 = f_photo1;
		this.p_nickname = p_nickname;
		this.p_photo1 = p_photo1;
	}

	
	public String getP_nickname() {
		return p_nickname;
	}


	public void setP_nickname(String p_nickname) {
		this.p_nickname = p_nickname;
	}


	public String getP_photo1() {
		return p_photo1;
	}


	public void setP_photo1(String p_photo1) {
		this.p_photo1 = p_photo1;
	}


	@Override
	public String toString() {
		return "Favorite [f_email=" + f_email + ", p_email=" + p_email + ", cate_num=" + cate_num + ", cate_name="
				+ cate_name + ", cnt=" + cnt + ", startRow=" + startRow + ", endRow=" + endRow + ", f_nickname="
				+ f_nickname + ", f_photo1=" + f_photo1 + "]";
	}

	public String getF_nickname() {
		return f_nickname;
	}

	public void setF_nickname(String f_nickname) {
		this.f_nickname = f_nickname;
	}

	public String getF_photo1() {
		return f_photo1;
	}

	public void setF_photo1(String f_photo1) {
		this.f_photo1 = f_photo1;
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
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
	
	
}
