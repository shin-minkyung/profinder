package com.tj.profinder.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.BuyDao;
import com.tj.profinder.model.Buy;
@Service
public class BuyServiceImpl implements BuyService {
	@Autowired
	private BuyDao buyDao;
	@Override
	public int contentsBuy(Buy buy) {
		// TODO Auto-generated method stub
		return buyDao.contentsBuy(buy);
	}
	@Override
	public int contentsBuySelect(Buy buy) {
		// TODO Auto-generated method stub
		return buyDao.contentsBuySelect(buy);
	}

}
