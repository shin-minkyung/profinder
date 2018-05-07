package com.tj.profinder.service;

import java.util.List;

import com.tj.profinder.model.Fpage;

public interface FpageService {
	/* fpageNewsfeed */
	public List<Fpage> fpageNewsfeedList(String f_email);
	public Fpage fpageNewsfeedAjax(Fpage fpage);
	public int fpageNewsfeedAjaxChk(Fpage fpage);
	
	/* fpageContents */
	public List<Fpage> fpageContentsList(Fpage fpage);
	public int fpageContentsListCount(String f_email);

	/* fpageQuestion */
	public List<Fpage> fpageQuestionList(Fpage fpage);
	public int fpageQuestionListCount(String f_email);
}
