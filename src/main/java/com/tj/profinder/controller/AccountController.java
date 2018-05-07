package com.tj.profinder.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.profinder.model.Category;
import com.tj.profinder.model.Claim;
import com.tj.profinder.model.Findermembers;
import com.tj.profinder.model.Promembers;
import com.tj.profinder.service.CategoryService;
import com.tj.profinder.service.ClaimService;
import com.tj.profinder.service.FaqService;
import com.tj.profinder.service.FindermembersService;
import com.tj.profinder.service.Paging;
import com.tj.profinder.service.PromembersService;

@Controller
public class AccountController {
	@Autowired
	private FaqService faqservice;
	@Autowired
	private PromembersService promemberService;
	@Autowired
	private FindermembersService findermemberService;
	@Autowired
	private CategoryService categoryService;
	@Autowired 
	private ClaimService claimService;

	
	@RequestMapping(value="accountPage")
	public String accountPage(Model model, HttpSession session, String wing, Claim claim, String pageNum) {
		model.addAttribute("wing", wing);
		model.addAttribute("faqViewResult", faqservice.faqViewList());				
		if(session.getAttribute("findermembers")!=null) {
			String f_email=(String) session.getAttribute("email");
			Findermembers loginfinder = findermemberService.getFindermember(f_email);
			model.addAttribute("loginfinder", loginfinder);
		}else if(session.getAttribute("promembers")!=null) {
			String p_email=(String) session.getAttribute("email");
			Promembers loginpro = promemberService.getPromembers(p_email);
			model.addAttribute("loginpro", loginpro);
		}
		String loginId=(String)session.getAttribute("email");
		Paging paging = new Paging(claimService.claimListCount(loginId), pageNum);
		claim.setStartRow(paging.getStartRow());
		claim.setEndRow(paging.getEndRow());	
		claim.setCl_email(loginId);
		model.addAttribute("claimViewResult",claimService.claimList(claim));
		model.addAttribute("paging",paging);
		
		return "account/account";				
	}
	
	
	@RequestMapping(value="pointUp", method=RequestMethod.POST)
	public String pointUp(Findermembers upPoint, Model model, HttpSession session) {	
		int result = findermemberService.pointUp(upPoint);	
		String f_email=(String) session.getAttribute("email");
		Findermembers loginfinder = findermemberService.getFindermember(f_email);
		session.setAttribute("findermembers", loginfinder);
		model.addAttribute("loginfinder", loginfinder);
		model.addAttribute("result", result);	
		return "account/pointUp";
	}
	
}
