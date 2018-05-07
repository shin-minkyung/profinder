package com.tj.profinder.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.profinder.model.Contents;

public interface ContentsService {
	public int contentsInsert(MultipartHttpServletRequest mRequest);
	public List<Contents> contentsList(String p_email);	
	public String contentsNowNum();
	public Contents contentsMainBanner(String con_num);
	public List<Contents> eduContentsList(Contents rows);
	public List<Contents> topEduCon6();
	public List<Contents> topBizCon(Contents rows);
	public List<Contents> topContents(Contents rowscate);
	public void contentsAutoInsert();	
	public int totalContents();
	public List<Contents> allContentsList(Contents rows);
	public Contents getContents(String con_num);
	public List<Contents> searchContents(Contents searchWord); //the Contents object includes startRow, endRow and searchWord
	public int searchedConCnt(Contents searchWord);
	public int contentsLikeCnt(String con_num);
	public int contentsDownloadUp(String con_num);
}
