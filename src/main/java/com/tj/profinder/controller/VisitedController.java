package com.tj.profinder.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.profinder.model.Visited;
import com.tj.profinder.service.Paging;
import com.tj.profinder.service.VisitedService;

@Controller
public class VisitedController {
	@Autowired
	private VisitedService visitedService;	
	
	@RequestMapping(value="getVisitCnt",method=RequestMethod.GET)
	public String getTodayVisitCnt(Model model, Visited loginpro) {
		int todayCnt =visitedService.getVisitTodayCnt(loginpro.getP_email());
		int totalCnt =visitedService.getVisitTotalCnt(loginpro.getP_email());
		model.addAttribute("todayCnt", todayCnt);
		model.addAttribute("totalCnt", totalCnt);		
		return "ppage/visitAjax";		
	}
	@RequestMapping(value="getFinderVisitors")
	public String getFinderVisitors(Model model, Visited loginpro, String pageNum) {
		int totalCnt =visitedService.getVisitTotalCnt(loginpro.getP_email());
		Paging paging = new Paging(totalCnt, pageNum, 12);
		loginpro.setStartRow(paging.getStartRow());
		loginpro.setEndRow(paging.getEndRow());
		ArrayList<Visited> myVisitors= (ArrayList<Visited>) visitedService.getmyFinderVisitorAll(loginpro);
		model.addAttribute("myVisitors", myVisitors );
		model.addAttribute("paging", paging);		
		return "";
	}
	
	
}
