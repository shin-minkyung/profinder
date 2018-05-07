package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.FaqDao;
import com.tj.profinder.model.Faq;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDao faqDao;

	@Override
	public List<Faq> faqViewList() {
		return faqDao.faqViewList();
	}

}
