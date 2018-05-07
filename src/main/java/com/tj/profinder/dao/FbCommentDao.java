package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.FbComment;

public interface FbCommentDao {
	public int fbCommentInsertView(FbComment comment);
	public List<FbComment> fbCommentListView(String fb_num);
	public FbComment getFbComment(String fc_num);
	public int fbCommentInserttwo(FbComment comment);
	public int fbCommentInsertThree(FbComment comment);
	public int fbCommentUpdate(FbComment comment);
	public int fbCommentDelete(String fc_num);
	public List<FbComment> fbCommentTotal();
}
