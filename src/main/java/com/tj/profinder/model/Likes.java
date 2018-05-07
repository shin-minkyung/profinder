package com.tj.profinder.model;

public class Likes {
	private String l_num;
	private String l_liker;
	private int cnt;
	private int startRow;
	private int endRow;
	private int cate_num;
	
	public Likes() {}

	public Likes(String l_num, String l_liker) {
		super();
		this.l_num = l_num;
		this.l_liker = l_liker;
	}

	@Override
	public String toString() {
		return "Likes [l_num=" + l_num + ", l_liker=" + l_liker + ", cnt=" + cnt + ", startRow=" + startRow
				+ ", endRow=" + endRow + ", cate_num=" + cate_num + "]";
	}

	public int getCate_num() {
		return cate_num;
	}

	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
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

	public String getL_num() {
		return l_num;
	}

	public void setL_num(String l_num) {
		this.l_num = l_num;
	}

	public String getL_liker() {
		return l_liker;
	}

	public void setL_liker(String l_liker) {
		this.l_liker = l_liker;
	}
	
	
}
