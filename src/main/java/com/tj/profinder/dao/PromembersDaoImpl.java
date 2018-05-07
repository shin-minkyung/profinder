package com.tj.profinder.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Promembers;
import com.tj.profinder.model.SearchPro;

@Repository
public class PromembersDaoImpl implements PromembersDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public int promembersConfirmEmail(String p_email) {
		return sessionTemplate.selectOne("promembersConfirmEmail", p_email);
	}

	@Override
	public int promembersInsert(Promembers promembers) {
		System.out.println("DAO : "+promembers.toString());
		return sessionTemplate.insert("promembersInsert", promembers);
	}

	@Override
	public Promembers getPromembers(String p_email) {
		return sessionTemplate.selectOne("getPromembers", p_email);
	}

	@Override
	public int promembersConfirmNickName(String p_nickname) {
		return sessionTemplate.selectOne("promembersConfirmNickName", p_nickname);
	}

	@Override
	public int proInsert(Promembers pro) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("proInsert", pro);
	}

	@Override
	public List<Promembers> searchProforSM(SearchPro searchPro) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("searchProforSM", searchPro);
	}

	@Override
	public int searchProforSMCnt(SearchPro searchPro) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("searchProforSMCnt", searchPro);
	}
	
	@Override
	public int getProIDChk(Promembers promembers) {
		return sessionTemplate.selectOne("getProIDChk", promembers);
	}

	@Override
	public Promembers LoginPro(Promembers promembers) {
		return sessionTemplate.selectOne("LoginPro", promembers);
	}

	@Override
	public Promembers proSearchID(Promembers promembers) {
		System.out.println(promembers);
		return sessionTemplate.selectOne("proSearchID", promembers);
	}

	@Override
	public Promembers proSearchPW(Promembers promembers) {
		return sessionTemplate.selectOne("proSearchPW", promembers);
	}

	@Override
	public int contentsPointUp(Promembers promembers) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("contentsPointUp",promembers);
	}

}
