package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.NewsCommentDao;
import com.tj.profinder.model.NewsComment;
@Service
public class NewsCommentServiceImpl implements NewsCommentService {
	@Autowired
	private NewsCommentDao newsCommentDao;
	@Override
	public List<NewsComment> newsCommentSelect(String n_num) {
		// TODO Auto-generated method stub
		return newsCommentDao.newsCommetSelect(n_num);
	}
	@Override
	public int newsCommentInsert(NewsComment newsComment) {
		// TODO Auto-generated method stub
		return newsCommentDao.newsCommentInsert(newsComment);
	}

}
