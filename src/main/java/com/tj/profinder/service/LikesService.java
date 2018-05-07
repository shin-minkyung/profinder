package com.tj.profinder.service;

import java.util.List;

import com.tj.profinder.model.Likes;

public interface LikesService {
	public List<Likes> likesMainBannerNewsfeed();
	public List<Likes> likesMainBannerNewsfeedAjax(Likes likes);
	public List<Likes> likesMainBannerContents();
	public List<Likes> likesMainBannerContentsAjax(Likes likes);
	public List<Likes> likesMainBannerQuestion();
	public List<Likes> likesMainBannerQuestionAjax(Likes likes);
	public void questionAutolike();
	public List<Likes> topEduQuestion6();
	public List<Likes> topQuestions(Likes rowscate);
	public void contentsAutolike();
	public void newsfeedAutolike();
	public int likeInsert(Likes likes);
	public int fboardLikesChk(Likes likes);
}
