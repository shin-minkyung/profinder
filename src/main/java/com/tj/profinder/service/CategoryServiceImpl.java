package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.CategoryDao;
import com.tj.profinder.model.Category;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao categoryDao;
	@Override
	public List<Category> categorySelect() {
		return categoryDao.categorySelect();
	}

}
