package com.tj.profinder.service;

import java.util.List;

import com.tj.profinder.model.FbComment;

public interface FbCommentService {
	public int fbCommentInsertView(FbComment comment);
	public List<FbComment> fbCommentListView(String fb_num);
	public FbComment getFbComment(String fc_num);
	public int fbCommentInserttwo(FbComment comment, String fc_num);
	public int fbCommentInsertThree(FbComment comment, String fc_num);
	public int fbCommentUpdate(FbComment comment);
	public int fbCommentDelete(String fc_num);
	public List<FbComment> fbCommentTotal();
}
