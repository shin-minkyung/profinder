package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.Newsfeed;

public interface NewsfeedDao {
	public int newsfeedInsert(Newsfeed newsfeed);
	public List<Newsfeed> newsfeedMain();
	public Newsfeed newsfeedAjax(int rn);
	public Newsfeed newsfeedMainBanner(String n_num);
	public String newsfeedNowNum();
	public Newsfeed newsfeedModifyView(String n_num);
	public void newsfeedAutoInsert(Newsfeed newsfeed);
	public int newsfeedModify(Newsfeed newsfeed);
	public Newsfeed newsfeedView(String n_num);
	public int newsfeedDelete(String n_num);
	public int newsfeedCommentCnt(String n_num);
	public int newsfeedLikeCnt(String n_num);
}
