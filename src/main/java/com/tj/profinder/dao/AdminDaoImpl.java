package com.tj.profinder.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Admin;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int adidChk(Admin id) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("idChk", id);
	}
	@Override
	public Admin getAdmin(Admin id) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getAdmin", id);
	}
	

}
