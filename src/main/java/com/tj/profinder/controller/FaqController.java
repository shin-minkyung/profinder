package com.tj.profinder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.profinder.service.FaqService;

@Controller
public class FaqController {
	@Autowired
	private FaqService faqservice;

	@RequestMapping(value = "faqView", method = RequestMethod.GET)
	public String faqViewList(Model model) {
		model.addAttribute("faqViewResult", faqservice.faqViewList());
		return "faq/faqView";
	}
	
}
