package com.tj.profinder.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Buy;
@Repository
public class BuyDaoImpl implements BuyDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int contentsBuy(Buy buy) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("contentsBuy",buy);
	}
	@Override
	public int contentsBuySelect(Buy buy) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("contentsBuySelect",buy);
	}

}
