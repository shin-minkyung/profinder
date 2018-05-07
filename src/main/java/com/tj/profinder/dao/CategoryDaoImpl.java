package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Category;
@Repository
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Category> categorySelect() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("categorySelect");
	}

}
