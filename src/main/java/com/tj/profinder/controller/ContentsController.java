package com.tj.profinder.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.profinder.model.Buy;
import com.tj.profinder.model.Contents;
import com.tj.profinder.model.Findermembers;
import com.tj.profinder.model.Likes;
import com.tj.profinder.model.Newsfeed;
import com.tj.profinder.model.Ppage;
import com.tj.profinder.model.Promembers;
import com.tj.profinder.service.BuyService;
import com.tj.profinder.service.ContentsService;
import com.tj.profinder.service.FindermembersService;
import com.tj.profinder.service.LikesService;
import com.tj.profinder.service.PpageService;
import com.tj.profinder.service.PromembersService;

@Controller
public class ContentsController {
	@Autowired
	private ContentsService contentsService;
	@Autowired
	private PpageService ppageService;
	@Autowired
	private LikesService likesService;
	@Autowired
	private FindermembersService findermembersService;
	@Autowired
	private BuyService buyService;
	@Autowired
	private PromembersService promembersService;
	
	@RequestMapping(value="contentsInsertView",method=RequestMethod.GET)
	public String contentsInsertView() {
		return "contents/contentsInsertView";
	}
	@RequestMapping(value="contentsInsert",method=RequestMethod.POST)
	public String contentsInsert(MultipartHttpServletRequest mRequest) {
		int result = contentsService.contentsInsert(mRequest);
		if(result==1) {
			Ppage ppage = new Ppage();
			ppage.setP_email(mRequest.getParameter("p_email"));
			ppage.setCon_num(contentsService.contentsNowNum());
			System.out.println(ppageService.ppageContentInsert(ppage));
		}
		return "redirect:ppageContentView.do?p_email="+mRequest.getParameter("p_email");
	}
	@RequestMapping(value="contentsList",method=RequestMethod.GET)
	public String contentsList(String p_email,Model model) {
		model.addAttribute("contentsProList", contentsService.contentsList(p_email));
		return "contents/contentsList";
	}
	@RequestMapping(value="contentsMainBanner",method=RequestMethod.POST)
	public String contentsMainBanner(Model model) {
		ArrayList<Likes> likes = (ArrayList<Likes>)likesService.likesMainBannerContents();
		ArrayList<Contents> contentsMainBanner = new ArrayList<Contents>();
		for(int i=0;i<likes.size();i++) {
			contentsMainBanner.add(contentsService.contentsMainBanner(likes.get(i).getL_num()));
			contentsMainBanner.get(i).setCnt(likes.get(i).getCnt());
		}
		model.addAttribute("contentsMainBanner",contentsMainBanner);
		return "contents/contentsBanner";
	}
	@RequestMapping(value="contentsMainBannerAjax",method=RequestMethod.POST)
	public String contentsMainBannerAjax(Likes like,Model model) {
		ArrayList<Likes> likes = (ArrayList<Likes>)likesService.likesMainBannerContentsAjax(like);
		ArrayList<Contents> contentsMainBannerAjax = new ArrayList<Contents>();
		for(int i=0;i<likes.size();i++) {
			contentsMainBannerAjax.add(contentsService.contentsMainBanner(likes.get(i).getL_num()));
			contentsMainBannerAjax.get(i).setCnt(likes.get(i).getCnt());
		}
		model.addAttribute("contentsMainBannerAjax",contentsMainBannerAjax);
		return "contents/contentsBannerAjax";
	}

	@RequestMapping(value="contentsAutoInsert200")
	public void contentsAutoInsert200() {
		contentsService.contentsAutoInsert();		
	}
	@RequestMapping(value="contentsAutolike")
	public void contentsAutolike() {
		likesService.contentsAutolike();
	}
	@RequestMapping(value="contentsDelete",method=RequestMethod.GET)
	public String contentsDelete(String pageNum,String p_email) {
		return "redirect:ppageContentView.do?pageNum="+pageNum+"&p_email="+p_email;
	}
	@RequestMapping(value="contentsDownload",method=RequestMethod.GET)
	public String contentsDownload(String pageNum,String p_email,String f_email,String con_num,int f_point,String jsp,HttpSession session) {
		Buy buy = new Buy(f_email,con_num);
		if(buyService.contentsBuySelect(buy)!=1) {
			buyService.contentsBuy(buy);
			Findermembers findermembers = new Findermembers();
			findermembers.setF_email(f_email);
			findermembers.setF_point(f_point);
			findermembersService.cotnentsDownload(findermembers);
			session.setAttribute("findermembers",findermembersService.getFindermember(f_email));
			Promembers promembers = new Promembers();
			promembers.setP_point(f_point);
			promembers.setP_email(p_email);
			promembersService.contentsPointUp(promembers);
			contentsService.contentsDownloadUp(con_num);
		}
		if(jsp.equals("fpage")) {
			return "redirect:fpageBuyContentsView.do?pageNum="+pageNum+"&f_email="+f_email+"&con_num="+con_num;
		}else {
			return "redirect:ppageContentView.do?pageNum="+pageNum+"&p_email="+p_email+"&con_num="+con_num;
		}
	}
}
