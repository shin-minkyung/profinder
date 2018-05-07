package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Contents;
@Repository
public class ContentsDaoImpl implements ContentsDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int contentsInsert(Contents contents) {
		// TODO Auto-generated method stub
		
		return sessionTemplate.insert("contentsInsert",contents);
	}

	@Override
	public List<Contents> contentsList(String p_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("contentsList",p_email);
	}

	@Override
	public String contentsNowNum() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("contentsNowNum");
	}

	@Override
	public Contents contentsMainBanner(String con_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("contentsMainBanner",con_num);
	}
	@Override
	public int contentsAutoInsert(Contents contents) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("contentsAutoInsert", contents);
	}

	@Override
	public List<Contents> eduContentsListforSearchmain(Contents rows) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("eduContentsListforSearchmain", rows);
	}

	@Override
	public List<Contents> topEduCon6() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("topEduCon6");
	}

	@Override
	public List<Contents> topBizCon(Contents rows) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("topBizCon", rows);
	}

	@Override
	public List<Contents> topContents(Contents rowscate) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("topConents", rowscate);
	}

	@Override
	public int totalContents() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("totalContents");
	}

	@Override
	public List<Contents> allContentslist(Contents rows) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("allContentsList", rows);
	}

	@Override
	public Contents getContents(String con_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getContents", con_num);
	}

	@Override
	public List<Contents> searchContents(Contents searchWord) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("searchContents", searchWord);
	}

	@Override
	public int searchConCnt(Contents searchWord) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("searchedConCnt", searchWord);
	}

	@Override
	public int contentsLikeCnt(String con_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("contentsLikeCnt",con_num);
	}

	@Override
	public int contentsDownloadUp(String con_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("contentsDownloadUp",con_num);
	}
}
