package com.tj.profinder.service;

import java.util.List;

import com.tj.profinder.model.NewsComment;

public interface NewsCommentService {
	public List<NewsComment> newsCommentSelect(String n_num);
	public int newsCommentInsert(NewsComment newsComment);
}
