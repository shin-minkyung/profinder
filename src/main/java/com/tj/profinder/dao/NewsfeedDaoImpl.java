package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Newsfeed;

@Repository
public class NewsfeedDaoImpl implements NewsfeedDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int newsfeedInsert(Newsfeed newsfeed) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("newsfeedInsert",newsfeed);
	}
	@Override
	public List<Newsfeed> newsfeedMain() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("newsfeedMain");
	}
	@Override
	public Newsfeed newsfeedAjax(int rn) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("newsfeedAjax",rn);
	}
	@Override
	public Newsfeed newsfeedMainBanner(String n_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("newsfeedMainBanner",n_num);
	}
	@Override
	public String newsfeedNowNum() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("newsfeedNowNum");
	}
	@Override
	public Newsfeed newsfeedModifyView(String n_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("newsfeedModifyView",n_num);
	}
	@Override
	public void newsfeedAutoInsert(Newsfeed newsfeed) {
		// TODO Auto-generated method stub
		sessionTemplate.insert("newsfeedAutoInsert",newsfeed);
	}
	@Override
	public int newsfeedModify(Newsfeed newsfeed) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("newsfeedModify",newsfeed);
	}
	@Override
	public Newsfeed newsfeedView(String n_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("newsfeedView",n_num);
	}
	@Override
	public int newsfeedDelete(String n_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("newsfeedDelete",n_num);
	}
	@Override
	public int newsfeedCommentCnt(String n_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("newsfeedCommentCnt",n_num);
	}
	@Override
	public int newsfeedLikeCnt(String n_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("newsfeedLikeCnt",n_num);
	}

}
