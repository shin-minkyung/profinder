package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.Contents;

public interface ContentsDao {
	public int contentsInsert(Contents contents);
	public List<Contents> contentsList(String p_email);
	public String contentsNowNum();
	public Contents contentsMainBanner(String con_num);
	public List<Contents> eduContentsListforSearchmain(Contents rows);
	public List<Contents> topEduCon6();
	public List<Contents> topBizCon(Contents rows);
	public List<Contents> topContents(Contents rowscate);
	public int contentsAutoInsert(Contents contents);
	public int totalContents();
	public List<Contents> allContentslist(Contents rows);
	public Contents getContents(String con_num);
	public List<Contents> searchContents(Contents searchWord);
	public int searchConCnt(Contents searchWord);
	public int contentsLikeCnt(String con_num);
	public int contentsDownloadUp(String con_num);
}
