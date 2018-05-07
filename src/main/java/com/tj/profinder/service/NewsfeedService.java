package com.tj.profinder.service;

import java.util.List;

import com.tj.profinder.model.Newsfeed;

public interface NewsfeedService {
	public int newsfeedInsert(Newsfeed newsfeed);
	public List<Newsfeed> newsfeedMain();
	public Newsfeed newsfeedAjax(int rn);
	public Newsfeed newsfeedMainBanner(String n_num);
	public String newsfeedNowNum();
	public Newsfeed newsfeedModifyView(String n_num);
	public void newsfeedAutoInsert();
	public int newsfeedModify(Newsfeed newsfeed);
	public Newsfeed newsfeedView(String n_num);
	public int newsfeedDelete(String n_num);
	public int newsfeedCommentCnt(String n_num);
	public int newsfeedLikeCnt(String n_num);
}
