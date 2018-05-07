package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Likes;
@Repository
public class LikesDaoImpl implements LikesDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Likes> likesMainBannerNewsfeed() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("likesMainBannerNewsfeed");
	}
	@Override
	public List<Likes> likesMainBannerNewsfeedAjax(Likes likes) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("likesMainBannerNewsfeedAjax",likes);
	}
	@Override
	public List<Likes> likesMainBannerContents() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("likesMainBannerContents");
	}
	@Override
	public List<Likes> likesMainBannerContentsAjax(Likes likes) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("likesMainBannerContentsAjax",likes);
	}
	@Override
	public List<Likes> likesMainBannerQuestion() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("likesMainBannerQuestion");
	}
	@Override
	public List<Likes> likesMainBannerQuestionAjax(Likes likes) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("likesMainBannerQuestionAjax",likes);
	}
	@Override
	public int like(Likes likes) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("like", likes);
	}
	@Override
	public List<Likes> topEduQuestion6() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("topEduQuestion6");
	}
	@Override
	public List<Likes> topQuestions(Likes rowscate) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("topQuestions", rowscate);
	}
	@Override
	public int fboardLikesChk(Likes likes) {
		return sessionTemplate.selectOne("fboardLikesChk", likes);
	}

}
