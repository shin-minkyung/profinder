package com.tj.profinder.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.profinder.model.Favorite;
import com.tj.profinder.model.Ppage;
import com.tj.profinder.model.Visited;
import com.tj.profinder.service.CategoryService;
import com.tj.profinder.service.ContentsService;
import com.tj.profinder.service.FavoriteService;
import com.tj.profinder.service.NewsfeedService;
import com.tj.profinder.service.Paging;
import com.tj.profinder.service.PpageService;
import com.tj.profinder.service.PromembersService;
import com.tj.profinder.service.VisitedService;

@Controller
public class PpageController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private PpageService ppageService;
	@Autowired
	private PromembersService promembersService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private VisitedService visitedService;
	@Autowired
	private NewsfeedService newsfeedService;
	@Autowired
	private ContentsService contentsService;
	/*ppageContentView*/
	@RequestMapping(value="ppageContentView",method=RequestMethod.GET)
	public String ppageContentView(Model model, Ppage ppage,String p_email,String pageNum, HttpSession session,String con_num) {		
		int total = ppageService.ppageContentListCount(p_email);
		Paging paging = new Paging(total, pageNum);
		model.addAttribute("categorySelect", categoryService.categorySelect());
		ppage.setP_email(p_email);
		ppage.setStartRow(paging.getStartRow());
		ppage.setEndRow(paging.getEndRow());
		ArrayList<Ppage> ppageContentsList = (ArrayList<Ppage>)ppageService.ppageContentsList(ppage);
		if(ppageContentsList.size()!=0) {
			for(int i=0;i<ppageContentsList.size();i++) {
				ppageContentsList.get(i).setLcnt(contentsService.contentsLikeCnt(ppageContentsList.get(i).getCon_num()));
			}
		}
		model.addAttribute("ppageContentsList",ppageContentsList);
		model.addAttribute("p_email",p_email);
		model.addAttribute("paging",paging);
		model.addAttribute("ppageInfo",promembersService.getPromembers(p_email) );
		model.addAttribute("ppageContentsListCount",ppageService.ppageContentListCount(p_email));
		model.addAttribute("ppageNewsfeedListCount",ppageService.ppageNewsfeedListCount(p_email));
		model.addAttribute("ppageQuestionListCount",ppageService.ppageQuestionListCount(p_email));
		model.addAttribute("jjimCnt", favoriteService.getJjimCnt(p_email));
		session.setAttribute("jspFile","ppageContentView.do?p_email="+p_email);
		
		if(session.getAttribute("email")!=null) {
			String loginmember= (String) session.getAttribute("email");
			Visited visit = new Visited();
			visit.setP_email(p_email);
			visit.setV_visitor(loginmember);		
			int ifvisitedtoday = visitedService.chkifVisitedtoday(visit);
			if(!p_email.equals(loginmember) && ifvisitedtoday==0) {
				visitedService.insertVisit(visit);
			}
		}	
		if(con_num!=null) {
			model.addAttribute("downCon_num",con_num);
		}
		return "ppage/ppageContentView";
	}
	
	/*ppageNewsfeed*/
	@RequestMapping(value="ppageNewsfeedView",method=RequestMethod.GET)
	public String ppageNewsfeedView(Model model,String p_email,Ppage ppage,String pageNum,HttpSession httpSession) {
		int total = ppageService.ppageNewsfeedListCount(p_email);
		Paging paging = new Paging(total, pageNum);
		ppage.setP_email(p_email);
		ppage.setStartRow(paging.getStartRow());
		ppage.setEndRow(paging.getEndRow());
		ArrayList<Ppage> ppageNewsfeedList = (ArrayList<Ppage>)ppageService.ppageNewsfeedList(ppage);
		if(ppageNewsfeedList.size()!=0) {
			for(int i=0;i<ppageNewsfeedList.size();i++) {
				ppageNewsfeedList.get(i).setCcnt(newsfeedService.newsfeedCommentCnt(ppageNewsfeedList.get(i).getN_num()));
				ppageNewsfeedList.get(i).setLcnt(newsfeedService.newsfeedLikeCnt(ppageNewsfeedList.get(i).getN_num()));
			}
		}
		model.addAttribute("ppageNewsfeedList",ppageNewsfeedList);
		model.addAttribute("p_email",p_email);
		model.addAttribute("paging",paging);
		model.addAttribute("categorySelect",categoryService.categorySelect());
		model.addAttribute("ppageInfo",promembersService.getPromembers(p_email) );		
		httpSession.setAttribute("promemberPageEmail",p_email);
		model.addAttribute("ppageContentsListCount",ppageService.ppageContentListCount(p_email));
		model.addAttribute("ppageQuestionListCount",ppageService.ppageQuestionListCount(p_email));
		model.addAttribute("ppageNewsfeedListCount",ppageService.ppageNewsfeedListCount(p_email));
		model.addAttribute("jjimCnt", favoriteService.getJjimCnt(p_email));
		httpSession.setAttribute("jspFile","ppageNewsfeedView.do?p_email="+p_email);
		
		if(httpSession.getAttribute("email")!=null) {
			String loginmember= (String) httpSession.getAttribute("email");
			Visited visit = new Visited();
			visit.setP_email(p_email);
			visit.setV_visitor(loginmember);		
			int ifvisitedtoday = visitedService.chkifVisitedtoday(visit);
			if(!p_email.equals(loginmember) && ifvisitedtoday==0) {
				visitedService.insertVisit(visit);
			}
		}		
		return "ppage/ppageNewsfeedView";
	}
	
	/*ppageQuestionView*/
	@RequestMapping(value="ppageQuestionView",method=RequestMethod.GET)
	public String ppageQuestionView(Model model, Ppage ppage,String p_email,String pageNum, HttpSession session) {
		int total = ppageService.ppageQuestionListCount(p_email);
		Paging paging = new Paging(total, pageNum);
		model.addAttribute("categorySelect",categoryService.categorySelect());
		ppage.setP_email(p_email);
		ppage.setStartRow(paging.getStartRow());
		ppage.setEndRow(paging.getEndRow());		
		model.addAttribute("ppageQuestionList",ppageService.ppageQuestionList(ppage));
		model.addAttribute("p_email",p_email);
		model.addAttribute("paging",paging);
		model.addAttribute("ppageInfo",promembersService.getPromembers(p_email) );
		model.addAttribute("ppageContentsListCount",ppageService.ppageContentListCount(p_email));
		model.addAttribute("ppageNewsfeedListCount",ppageService.ppageNewsfeedListCount(p_email));
		model.addAttribute("ppageQuestionListCount",ppageService.ppageQuestionListCount(p_email));
		model.addAttribute("jjimCnt", favoriteService.getJjimCnt(p_email));
		session.setAttribute("jspFile","ppageQuestionView.do?p_email="+p_email);
		
		if(session.getAttribute("email")!=null) {
			String loginmember= (String) session.getAttribute("email");
			Visited visit = new Visited();
			visit.setP_email(p_email);
			visit.setV_visitor(loginmember);		
			int ifvisitedtoday = visitedService.chkifVisitedtoday(visit);
			if(!p_email.equals(loginmember) && ifvisitedtoday==0) {
				visitedService.insertVisit(visit);
			}
		}	
		return "ppage/ppageQuestionView";
	}
	@RequestMapping(value="ppageNewsfeedAutoInsert")
	public String ppageNewsfeeedAutoInsert() {
		ppageService.ppageNewsfeedAutoInsert();
		return "redirect:searchmain.do";
	}
	@RequestMapping(value="ppageContentsAutoInsert")
	public String ppageContentsAutoInsert() {
		ppageService.ppageContentsAutoInsert();
		return "redirect:searchmain.do";
	}
	@RequestMapping(value="ppageQuestionAutoInsert")
	public String ppageQuestionAutoInsert() {
		ppageService.ppageQuestionAutoInsert();
		return "redirect:searchmain.do";
	}
	@RequestMapping(value="ppageJjimView",method=RequestMethod.GET)
	public String ppageJjimView(Model model, Favorite jjim, String p_email,String pageNum, HttpSession session) {		
		model.addAttribute("categorySelect",categoryService.categorySelect());
		int total = favoriteService.getJjimCnt(p_email);
		Paging paging = new Paging(total, pageNum, 12);
		jjim.setP_email(p_email);
		jjim.setStartRow(paging.getStartRow());
		jjim.setEndRow(paging.getEndRow());
		ArrayList<Favorite> jjimList = (ArrayList<Favorite>) favoriteService.getJjimList(jjim);
		model.addAttribute("jjimCnt", total);		
		model.addAttribute("jjimList", jjimList);
		model.addAttribute("p_email",p_email);
		model.addAttribute("paging", paging);
		model.addAttribute("ppageInfo",promembersService.getPromembers(p_email) );
		model.addAttribute("ppageContentsListCount",ppageService.ppageContentListCount(p_email));
		model.addAttribute("ppageNewsfeedListCount",ppageService.ppageNewsfeedListCount(p_email));
		model.addAttribute("ppageQuestionListCount",ppageService.ppageQuestionListCount(p_email));
		session.setAttribute("jspFile","ppageJjimView.do?p_email="+p_email);
		
		if(session.getAttribute("email")!=null) {
			String loginmember= (String) session.getAttribute("email");
			Visited visit = new Visited();
			visit.setP_email(p_email);
			visit.setV_visitor(loginmember);		
			int ifvisitedtoday = visitedService.chkifVisitedtoday(visit);
			if(!p_email.equals(loginmember) && ifvisitedtoday==0) {
				visitedService.insertVisit(visit);
			}
		}	
		return "ppage/ppageJjimView";
	}
	@RequestMapping(value="jjimChk", method=RequestMethod.GET)
	public String jjimChk(Model model, Favorite jjim) {
		int ifJjim = favoriteService.jjimChk(jjim);
		model.addAttribute("ifJjim", ifJjim);
		return "ppage/jjimChk";
	}
	@RequestMapping(value="addJjim", method=RequestMethod.GET)
	public String addJjim(Model model, Favorite jjim) {
		favoriteService.insertJjim(jjim);
		//model.addAttribute("result", result);
		return "ppage/jjimChk";
	}
	@RequestMapping(value="removeJjim", method=RequestMethod.GET)
	public String removeJjim(Model model, Favorite jjim) {
		int result = favoriteService.deleteJjim(jjim);
		model.addAttribute("result", result);
		return "ppage/jjimChk";
	}
}
