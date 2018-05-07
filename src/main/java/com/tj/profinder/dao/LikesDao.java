package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.Likes;

public interface LikesDao {
	public List<Likes> likesMainBannerNewsfeed();
	public List<Likes> likesMainBannerNewsfeedAjax(Likes likes);
	public List<Likes> likesMainBannerContents();
	public List<Likes> likesMainBannerContentsAjax(Likes likes);
	public List<Likes> likesMainBannerQuestion();
	public List<Likes> likesMainBannerQuestionAjax(Likes likes);
	public int like(Likes likes);
	public List<Likes> topEduQuestion6(); 
	public List<Likes> topQuestions(Likes rowscate);
	public int fboardLikesChk(Likes likes);
}
