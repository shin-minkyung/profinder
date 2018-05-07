package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.Ppage;

public interface PpageDao {
	/* ppageContents*/
	public int ppageContentInsert(Ppage ppage);
	public List<Ppage> ppageContentsList(Ppage ppage);
	public int ppageContentListCount(String p_email);
	public void ppageContentsAutoInsert(Ppage ppage);
	
	/* ppageNewsfeed */
	public int ppageNewsfeedListCount(String p_email);
	public List<Ppage> ppageNewsfeedList(Ppage ppage);
	public int ppageNewsfeedInsert(Ppage ppage);
	public void ppageNewsfeedAutoInsert(Ppage ppage);
	
	/* ppageQuestion*/
	public int ppageQuestionInsert(Ppage ppage);
	public List<Ppage> ppageQuestionList(Ppage ppage);
	public int ppageQuestionListCount(String p_email);
	public void ppageQuestionAutoInsert(Ppage ppage);
	public int ppageQuestionDelete(String q_num);
}
