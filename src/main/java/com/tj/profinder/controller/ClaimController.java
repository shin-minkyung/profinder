package com.tj.profinder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.profinder.model.Claim;
import com.tj.profinder.service.ClaimService;
import com.tj.profinder.service.Paging;

@Controller
public class ClaimController {
	@Autowired
	private ClaimService claimService;
	
	@RequestMapping(value="claimInsert",method=RequestMethod.POST)
	public String claimInsert(Claim claim) {
		int result = claimService.claimInsert(claim);
		return "redirect:claimList.do?claimInsert="+String.valueOf(result)+"&cl_email="+claim.getCl_email();
	}
	@RequestMapping(value="claimList")
	public String claimList(Claim claim,Model model,String pageNum,String claimInsert,String claimDelete) {
		Paging paging = new Paging(claimService.claimListCount(claim.getCl_email()), pageNum);
		claim.setStartRow(paging.getStartRow());
		claim.setEndRow(paging.getEndRow());
		model.addAttribute("claimViewResult",claimService.claimList(claim));
		model.addAttribute("paging",paging);
		if(pageNum==null) {
			pageNum="1";
		}
		if(claimInsert != null) {
			model.addAttribute("claimInsert",claimInsert);
		}
		if(claimDelete!=null) {
			model.addAttribute("claimDelete",claimInsert);
		}
		model.addAttribute("pageNum",pageNum);
		return "account/claimList";
	}
	@RequestMapping(value="claimModifyView",method=RequestMethod.POST)
	public String claimModifyView(Claim claim,Model model) {
		model.addAttribute("list",claim);
		return "account/claimModifyView";
	}
	@RequestMapping(value="claimModify",method=RequestMethod.POST)
	public String claimModify(Claim claim,Model model) {
		int result = claimService.claimModify(claim);
		if(result==1) {
			model.addAttribute("list",claim);
		}
		return "account/claimModify";
	}
	@RequestMapping(value="claimDelete")
	public String claimDelete(Claim claim,String pageNum) {
		int result = claimService.claimDelete(claim.getCl_num());
		if(pageNum==null || pageNum.trim().equals("")) {
			pageNum = "1";
		}
		return "redirect:claimList.do?pageNum="+pageNum+"&cl_email="+claim.getCl_email()+"&claimDelete="+String.valueOf(result);
	}
}
