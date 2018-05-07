package com.tj.profinder.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Faq;
@Repository
public class FaqDaoImpl implements FaqDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public List<Faq> faqViewList() {
		
		return sessionTemplate.selectList("faqViewList") ;
	}

}
