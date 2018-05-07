package com.tj.profinder.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.profinder.model.Favorite;
import com.tj.profinder.model.Fpage;
import com.tj.profinder.service.ContentsService;
import com.tj.profinder.service.FavoriteService;
import com.tj.profinder.service.FindermembersService;
import com.tj.profinder.service.FpageService;
import com.tj.profinder.service.NewsfeedService;
import com.tj.profinder.service.Paging;

@Controller
public class FpageController {
	@Autowired
	private FpageService fpageService;
	@Autowired
	private FindermembersService finderService;
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private NewsfeedService newsfeedService;
	@Autowired
	private ContentsService contentsService;
	
	/* fpageNewsfeed */
	@RequestMapping(value="fpageNewsfeedView",method=RequestMethod.GET)
	public String fpageNewsfeedView(String f_email,Model model, HttpSession session) {
		model.addAttribute("f_email",f_email);
		model.addAttribute("finderInfo", finderService.getFindermember(f_email));
		ArrayList<Fpage> fpageNewsfeedList = (ArrayList<Fpage>)fpageService.fpageNewsfeedList(f_email);
		if(fpageNewsfeedList.size()!=0) {
			for(int i=0;i<fpageNewsfeedList.size();i++) {
				fpageNewsfeedList.get(i).setLcnt(newsfeedService.newsfeedLikeCnt(fpageNewsfeedList.get(i).getN_num()));
				fpageNewsfeedList.get(i).setCcnt(newsfeedService.newsfeedCommentCnt(fpageNewsfeedList.get(i).getN_num()));
			}
		}
		model.addAttribute("fpageNewsfeedList",fpageNewsfeedList);
		model.addAttribute("fpageContentsListCount",fpageService.fpageContentsListCount(f_email));
		model.addAttribute("fpageQuestionListCount", fpageService.fpageQuestionListCount(f_email));
		model.addAttribute("myJjimCnt", favoriteService.getmyJjimCnt(f_email));
		session.setAttribute("jspFile", "fpageNewsfeedView.do?f_email="+f_email);		
		return "fpage/fpageNewsfeedView";
	}
	@RequestMapping(value="fpageNewsfeedAjax",method=RequestMethod.POST)
	public String fpageNewsfeedAjax(Fpage fpage,Model model) {
		
		Fpage fpageNewsfeedAjax = fpageService.fpageNewsfeedAjax(fpage);
		if(fpageNewsfeedAjax !=null) {
			fpageNewsfeedAjax.setLcnt(newsfeedService.newsfeedLikeCnt(fpageNewsfeedAjax.getN_num()));
			fpageNewsfeedAjax.setCcnt(newsfeedService.newsfeedCommentCnt(fpageNewsfeedAjax.getN_num()));
		}
		model.addAttribute("fpageNewsfeedAjaxChk",fpageService.fpageNewsfeedAjaxChk(fpage));
		model.addAttribute("fpageNewsfeedAjax",fpageNewsfeedAjax);
		return "fpage/fpageNewsfeedAjax";
	}
	
	/* fpageContents */
	@RequestMapping(value="fpageBuyContentsView",method=RequestMethod.GET)
	public String fpageContentsList(Fpage fpage,String pageNum,Model model,String con_num, HttpSession session) {
		model.addAttribute("finderInfo", finderService.getFindermember(fpage.getF_email()));
		int total = fpageService.fpageContentsListCount(fpage.getF_email());
		Paging paging = new Paging(total, pageNum);
		fpage.setStartRow(paging.getStartRow());
		fpage.setEndRow(paging.getEndRow());
		model.addAttribute("paging",paging);
		model.addAttribute("f_email",fpage.getF_email());
		ArrayList<Fpage> fpageContentsList = (ArrayList<Fpage>)fpageService.fpageContentsList(fpage);
		if(fpageContentsList.size()!=0) {
			for(int i=0;i<fpageContentsList.size();i++) {
				fpageContentsList.get(i).setLcnt(contentsService.contentsLikeCnt(fpageContentsList.get(i).getCon_num()));
			}
		}
		model.addAttribute("fpageContentsList",fpageContentsList);
		model.addAttribute("fpageQuestionListCount", fpageService.fpageQuestionListCount(fpage.getF_email()));
		model.addAttribute("myJjimCnt", favoriteService.getmyJjimCnt(fpage.getF_email()));
		session.setAttribute("jspFile", "fpageBuyContentsView.do?f_email="+fpage.getF_email());
		if(con_num!=null) {
			model.addAttribute("downCon_num",con_num);
		}
		return "fpage/fpageBuyContentsView";
	}
	
	/*fpageQuestion*/
	@RequestMapping(value="fpageQuestionView", method=RequestMethod.GET)
	public String fpageQuestionList(Fpage fpage, String pageNum, Model model, String f_email, HttpSession session) {
		model.addAttribute("finderInfo", finderService.getFindermember(f_email));
		int total = fpageService.fpageQuestionListCount(fpage.getF_email());
		Paging paging = new Paging(total, pageNum);
		fpage.setStartRow(paging.getStartRow());
		fpage.setEndRow(paging.getEndRow());
		model.addAttribute("paging",paging);
		model.addAttribute("f_email",fpage.getF_email());
		model.addAttribute("fpageQuestionList",fpageService.fpageQuestionList(fpage));
		model.addAttribute("fpageQuestionListCount", fpageService.fpageQuestionListCount(f_email));
		model.addAttribute("fpageContentsListCount",fpageService.fpageContentsListCount(f_email));
		model.addAttribute("myJjimCnt", favoriteService.getmyJjimCnt(fpage.getF_email()));
		session.setAttribute("jspFile", "fpageQuestionView.do?f_email="+f_email);
		return "fpage/fpageQuestionView";
	}
	@RequestMapping(value="fpageJjimView", method=RequestMethod.GET)
	public String fpageJjimView(Model model, String pageNum, Favorite finder, HttpSession session) {
		model.addAttribute("finderInfo", finderService.getFindermember(finder.getF_email()));
		int jjimCnt = favoriteService.getmyJjimCnt(finder.getF_email());
		Paging paging = new Paging(jjimCnt, pageNum, 12);
		finder.setStartRow(paging.getStartRow());
		finder.setEndRow(paging.getEndRow());
		ArrayList<Favorite> myjjimList = (ArrayList<Favorite>) favoriteService.getmyJjimList(finder);		
		model.addAttribute("myJjimCnt", jjimCnt);
		model.addAttribute("paging", paging);
		model.addAttribute("myjjimList", myjjimList);
		model.addAttribute("fpageQuestionListCount", fpageService.fpageQuestionListCount(finder.getF_email()));
		model.addAttribute("fpageContentsListCount",fpageService.fpageContentsListCount(finder.getF_email()));
		session.setAttribute("jspFile", "fpageJjimView.do?f_email="+finder.getF_email());
		return "fpage/fpageJjimView";
	}
	
	

}
