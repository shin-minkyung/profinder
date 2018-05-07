package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.FbCommentDao;
import com.tj.profinder.model.FbComment;
@Service
public class FbCommentServiceImpl implements FbCommentService {
	@Autowired
	private FbCommentDao fbcDao;
	@Override
	public int fbCommentInsertView(FbComment comment) {
		System.out.println(comment);
		return fbcDao.fbCommentInsertView(comment);
	}

	@Override
	public List<FbComment> fbCommentListView(String fb_num) {
		return fbcDao.fbCommentListView(fb_num);
	}

	@Override
	public FbComment getFbComment(String fc_num) {
		return fbcDao.getFbComment(fc_num);
	}

	@Override
	public int fbCommentInserttwo(FbComment comment, String fc_num) {
		FbComment temp  = fbcDao.getFbComment(fc_num);
		System.out.println("comment.fc_num : "+comment.getFc_num());
			comment.setFb_num(temp.getFb_num());
			comment.setFc_group(temp.getFc_group());
			comment.setFc_indent(temp.getFc_indent()+1);
			comment.setFc_ref(temp.getFc_num());
		System.out.println("대댓글 : "+comment);
		return fbcDao.fbCommentInserttwo(comment);
	}

	@Override
	public int fbCommentInsertThree(FbComment comment, String fc_num) {
		FbComment temp  = fbcDao.getFbComment(fc_num);
		comment.setFb_num(temp.getFb_num());
		comment.setFc_group(temp.getFc_group());
		comment.setFc_group2(temp.getFc_group2());
		comment.setFc_indent(temp.getFc_indent()+1);
		comment.setFc_ref(temp.getFc_num());
		System.out.println("대대댓글 : " +comment);
		return fbcDao.fbCommentInsertThree(comment);
	}

	@Override
	public int fbCommentUpdate(FbComment comment) {
		System.out.println(comment);
		return fbcDao.fbCommentUpdate(comment);
	}

	@Override
	public int fbCommentDelete(String fc_num) {
		return fbcDao.fbCommentDelete(fc_num);
	}

	@Override
	public List<FbComment> fbCommentTotal() {
		return fbcDao.fbCommentTotal();
	}

}
