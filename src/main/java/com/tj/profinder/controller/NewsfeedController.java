package com.tj.profinder.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.tj.profinder.model.Likes;
import com.tj.profinder.model.NewsComment;
import com.tj.profinder.model.Newsfeed;
import com.tj.profinder.model.Ppage;
import com.tj.profinder.service.CategoryService;
import com.tj.profinder.service.LikesService;
import com.tj.profinder.service.NewsCommentService;
import com.tj.profinder.service.NewsfeedService;
import com.tj.profinder.service.PpageService;
@Controller
public class NewsfeedController {
	@Autowired
	private NewsfeedService newsfeedService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private NewsCommentService newsCommentService;
	@Autowired
	private LikesService likesService;
	@Autowired
	private PpageService ppageService;
	@RequestMapping(value="main")
	public String trueMain(Model model,HttpSession httpSession) {
		ArrayList<Likes> likes = (ArrayList<Likes>)likesService.likesMainBannerNewsfeed();
		ArrayList<Newsfeed> newsfeedMainBanner = new ArrayList<Newsfeed>();
		for(int i=0;i<likes.size();i++) {
			newsfeedMainBanner.add(newsfeedService.newsfeedMainBanner(likes.get(i).getL_num()));
			newsfeedMainBanner.get(i).setCnt(likes.get(i).getCnt());
		}
		ArrayList<Newsfeed> newsfeedMain = (ArrayList<Newsfeed>)newsfeedService.newsfeedMain();
		for(int i=0;i<newsfeedMain.size();i++) {
			newsfeedMain.get(i).setCcnt(newsfeedService.newsfeedCommentCnt(newsfeedMain.get(i).getN_num()));
			newsfeedMain.get(i).setLcnt(newsfeedService.newsfeedLikeCnt(newsfeedMain.get(i).getN_num()));
		}
		model.addAttribute("newsfeedMain",newsfeedMain);
		model.addAttribute("newsfeedMainBanner",newsfeedMainBanner);
		model.addAttribute("cate", categoryService.categorySelect());
		httpSession.setAttribute("jspFile","main.do");
		return "main/main";
	}
	
	@RequestMapping(value="newsfeedInsertView",method=RequestMethod.GET)
	public String newsfeedInsertView(Model model) {
		model.addAttribute("categorySelect",categoryService.categorySelect());
		return "newspeed/newsfeedInsertView";
	}
	@RequestMapping(value="newsfeedInsert",method=RequestMethod.POST)
	public String newsfeedInsert(Newsfeed newsfeed, Model model) {
		System.out.println(newsfeed);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String n_ip = request.getHeader("X-FORWARDED-FOR");
		if(n_ip == null) {
			n_ip = request.getRemoteAddr();
		}
		newsfeed.setN_ip(n_ip);
		int result = newsfeedService.newsfeedInsert(newsfeed);
		if(result==1) {
			Ppage ppage = new Ppage();
			ppage.setP_email(newsfeed.getP_email());
			ppage.setN_num(newsfeedService.newsfeedNowNum());
			System.out.println(ppageService.ppageNewsfeedInsert(ppage));
		}
		return "redirect:ppageNewsfeedView.do?p_email="+newsfeed.getP_email();
	}
	@RequestMapping(value="newsfeedMainAjax",method=RequestMethod.POST)
	public String ajaxAdd(Model model,Newsfeed newsfeed) {
		Newsfeed newsfeedMainAjax = newsfeedService.newsfeedAjax(newsfeed.getRn());
		newsfeedMainAjax.setCcnt(newsfeedService.newsfeedCommentCnt(newsfeedMainAjax.getN_num()));
		newsfeedMainAjax.setLcnt(newsfeedService.newsfeedLikeCnt(newsfeedMainAjax.getN_num()));
		model.addAttribute("newsfeedMainAjax",newsfeedMainAjax);
		return "newsfeed/newsfeedMainAjax";
	}
	@RequestMapping(value="newsfeedCommentAjax")
	public String commentAjax(Model model,Newsfeed newsfeed) {
		model.addAttribute("newsCommentSelect",newsCommentService.newsCommentSelect(newsfeed.getN_num()));
		return "newsfeed/newsfeedCommentAjax";
	}
	@RequestMapping(value="newsCommentInsert",method=RequestMethod.POST)
	public String newsCommentInsert(Model model,NewsComment newsComment) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String nc_ip = request.getHeader("X-FORWARDED-FOR");
		if(nc_ip == null) {
			nc_ip = request.getRemoteAddr();
		}
		newsComment.setNc_ip(nc_ip);
		newsCommentService.newsCommentInsert(newsComment);
		return "redirect:newsfeedCommentAjax.do?n_num="+newsComment.getN_num();
	}
	@RequestMapping(value="newsfeedMainBannerAjax",method=RequestMethod.POST)
	public String newsfeedMainBannerAjax(Likes like,Model model) {
		ArrayList<Likes> likes = (ArrayList<Likes>)likesService.likesMainBannerNewsfeedAjax(like);
		ArrayList<Newsfeed> newsfeedMainBannerAjax = new ArrayList<Newsfeed>();
		for(int i=0;i<likes.size();i++) {
			newsfeedMainBannerAjax.add(newsfeedService.newsfeedMainBanner(likes.get(i).getL_num()));
			newsfeedMainBannerAjax.get(i).setCnt(likes.get(i).getCnt());
		}
		model.addAttribute("newsfeedMainBannerAjax",newsfeedMainBannerAjax);
		return "newsfeed/newsfeedBannerAjax";
	}
	@RequestMapping(value="newsfeedMainBanner",method=RequestMethod.POST)
	public String newsfeedMainBanner(Model model) {
		ArrayList<Likes> likes = (ArrayList<Likes>)likesService.likesMainBannerNewsfeed();
		ArrayList<Newsfeed> newsfeedMainBanner = new ArrayList<Newsfeed>();
		for(int i=0;i<likes.size();i++) {
			newsfeedMainBanner.add(newsfeedService.newsfeedMainBanner(likes.get(i).getL_num()));
			newsfeedMainBanner.get(i).setCnt(likes.get(i).getCnt());
		}
		model.addAttribute("newsfeedMainBanner",newsfeedMainBanner);
		return "newsfeed/newsfeedBanner";
	}
	@RequestMapping(value="newsfeedModifyView",method=RequestMethod.POST)
	public String newsfeedModifyView(Newsfeed newsfeed,Model model) {
		model.addAttribute("categorySelect",categoryService.categorySelect());
		model.addAttribute("newsfeed",newsfeedService.newsfeedModifyView(newsfeed.getN_num()));
		return "newsfeed/newsfeedModifyView";
	}
	@RequestMapping(value="newsfeedModify",method=RequestMethod.POST)
	public String newsfeedModify(Newsfeed newsfeed,Model model) {
		System.out.println("이거제대로 되었는가용?"+newsfeed);
		int result = newsfeedService.newsfeedModify(newsfeed);
		System.out.println("result는 몇?"+result);
		if(result==1) {
			
			model.addAttribute("newsfeedList",newsfeedService.newsfeedView(newsfeed.getN_num()));
			model.addAttribute("p_email",newsfeed.getP_email());
		}
		return "newsfeed/newsfeedModify";
	}
	@RequestMapping(value="newsfeedAutoInsert")
	public void newsfeedAutoInsert() {
		newsfeedService.newsfeedAutoInsert();
	}
	@RequestMapping(value="newsfeedAutolike")
	public void newsfeedAutolike() {
		likesService.newsfeedAutolike();
	}
	@RequestMapping(value="newsfeedDelete")
	public String newsfeedDelete(Newsfeed newsfeed) {
		int result = newsfeedService.newsfeedDelete(newsfeed.getN_num());
		if(result == 1) {
			return "redirect:ppageNewsfeedView.do?p_email="+newsfeed.getP_email();
		}else {
			return "redirect:main.do";
		}
	}
	@RequestMapping(value="newsfeedMainDelete")
	public String newsfeedMainDelete(String n_num) {
		newsfeedService.newsfeedDelete(n_num);
		return "redirect:main.do";
	}
}
