package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.FbComment;
@Repository
public class FbCommentDaoImpl implements FbCommentDao {
	@Autowired
	private SqlSession SessionTemplate;
	
	@Override
	public int fbCommentInsertView(FbComment comment) {
		return SessionTemplate.insert("fbCommentInsertView", comment);
	}

	@Override
	public List<FbComment> fbCommentListView(String fb_num) {
		return SessionTemplate.selectList("fbCommentListView", fb_num);
	}

	@Override
	public FbComment getFbComment(String fc_num) {
		return SessionTemplate.selectOne("getFbComment", fc_num);
	}

	@Override
	public int fbCommentInserttwo(FbComment comment) {
		return SessionTemplate.insert("fbCommentInserttwo", comment);
	}

	@Override
	public int fbCommentInsertThree(FbComment comment) {
		return SessionTemplate.insert("fbCommentInsertThree", comment);
	}

	@Override
	public int fbCommentUpdate(FbComment comment) {
		return SessionTemplate.update("fbCommentUpdate", comment);
	}

	@Override
	public int fbCommentDelete(String fc_num) {
		return SessionTemplate.update("fbCommentDelete", fc_num);
	}

	@Override
	public List<FbComment> fbCommentTotal() {
		return SessionTemplate.selectList("fbCommentTotal");
	}

}
