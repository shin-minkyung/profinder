package com.tj.profinder.service;

import java.util.List;

import com.tj.profinder.model.Ppage;

public interface PpageService {
	/*ppageContent*/
	public int ppageContentInsert(Ppage ppage);
	public List<Ppage> ppageContentsList(Ppage ppage);
	public int ppageContentListCount(String p_email);
	public void ppageContentsAutoInsert();
	
	/*ppageNewsfeed*/
	public int ppageNewsfeedInsert(Ppage ppage);
	public List<Ppage> ppageNewsfeedList(Ppage ppage);
	public int ppageNewsfeedListCount(String p_email);
	public void ppageNewsfeedAutoInsert();
	
	/*ppageQuestion*/
	public int ppageQuestionInsert(Ppage ppage);
	public List<Ppage> ppageQuestionList(Ppage ppage);
	public int ppageQuestionListCount(String p_email);
	public void ppageQuestionAutoInsert();
	public int ppageQuestionDelete(String q_num);
	

}
