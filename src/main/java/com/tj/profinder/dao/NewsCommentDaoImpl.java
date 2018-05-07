package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.NewsComment;
@Repository
public class NewsCommentDaoImpl implements NewsCommentDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<NewsComment> newsCommetSelect(String n_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("newsCommentSelect",n_num);
	}
	@Override
	public int newsCommentInsert(NewsComment newsComment) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("newsCommentInsert",newsComment);
	}

}
