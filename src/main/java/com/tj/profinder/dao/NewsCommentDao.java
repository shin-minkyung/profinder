package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.NewsComment;

public interface NewsCommentDao {
	public List<NewsComment> newsCommetSelect(String n_num);
	public int newsCommentInsert(NewsComment newsComment);
}
