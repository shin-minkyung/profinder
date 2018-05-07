package com.tj.profinder.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.profinder.model.Category;
import com.tj.profinder.model.Contents;
import com.tj.profinder.model.Favorite;
import com.tj.profinder.model.Likes;
import com.tj.profinder.model.Promembers;
import com.tj.profinder.model.Question;
import com.tj.profinder.model.SearchPro;
import com.tj.profinder.service.CategoryService;
import com.tj.profinder.service.ContentsService;
import com.tj.profinder.service.FavoriteService;
import com.tj.profinder.service.LikesService;
import com.tj.profinder.service.Paging;
import com.tj.profinder.service.PromembersService;
import com.tj.profinder.service.QuestionService;
@Controller
public class SearchmainController {
	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private PromembersService promembersService;
	@Autowired
	private ContentsService contentsService;
	@Autowired
	private LikesService likesService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value="searchmain", method=RequestMethod.GET)
	public String searchmain(Model model, String key, HttpSession session) {		
		model.addAttribute("key", key);
		ArrayList<Category> category = (ArrayList<Category>) categoryService.categorySelect();
		//System.out.println(category);
		model.addAttribute("cate", category);
		
		ArrayList<Favorite> favorite = (ArrayList<Favorite>) favoriteService.topEduPros6();
		ArrayList<Promembers> topEduPro6 = new ArrayList<Promembers>();
		for(int i=0; i<favorite.size(); i++) {
			topEduPro6.add(promembersService.getPromembers(favorite.get(i).getP_email()));
			topEduPro6.get(i).setJjimCnt(favorite.get(i).getCnt());
		}		
		ArrayList<Contents> topEduCon6 = (ArrayList<Contents>) contentsService.topEduCon6();
		
		ArrayList<Likes> topEduQue6likes = (ArrayList<Likes>) likesService.topEduQuestion6();
		ArrayList<Question> topEduQue6 = new ArrayList<Question>();
		for(int i=0; i<topEduQue6likes.size(); i++) {
			topEduQue6.add(questionService.getQuestion(topEduQue6likes.get(i).getL_num()));
			topEduQue6.get(i).setLikecnt(topEduQue6likes.get(i).getCnt());
		}
		
		model.addAttribute("topEduPro6",topEduPro6);
		model.addAttribute("topEduCon6",topEduCon6);
		model.addAttribute("topEduQue6",topEduQue6);
		session.setAttribute("jspFile", "searchmain.do");
		return "searchmain/searchmain";		
	}	
	/* .do from Ajax */
	
	@RequestMapping(value="topPros", method=RequestMethod.POST)
	public String topPros(Favorite jjim, Model model) {		
		ArrayList<Favorite> favorite = (ArrayList<Favorite>) favoriteService.topPros(jjim);
		ArrayList<Promembers> topPro = new ArrayList<Promembers>();
		for(int i=0; i<favorite.size(); i++) {
			topPro.add(promembersService.getPromembers(favorite.get(i).getP_email()));
			topPro.get(i).setJjimCnt(favorite.get(i).getCnt());
		}
		model.addAttribute("cate", categoryService.categorySelect());
		model.addAttribute("topPro",topPro);
		return "searchmain/topEduPros";		
	}

	/*Contents Ajax*/
	@RequestMapping(value="topContents", method=RequestMethod.POST)
	public String topContents(Contents rowscate, Model model) {	
		ArrayList<Contents> topContents = (ArrayList<Contents>) contentsService.topContents(rowscate);
		model.addAttribute("topContents", topContents);
		model.addAttribute("cate", categoryService.categorySelect());
		return "searchmain/topContents";		
	}
	
	/*Questions Ajax*/
	@RequestMapping(value="topQuestions", method=RequestMethod.POST)
	public String topQuestions(Likes rowscate, Model model) {
		//System.out.println(rowscate);
		ArrayList<Likes> topQuestionsRanks = (ArrayList<Likes>) likesService.topQuestions(rowscate);
		ArrayList<Question> topQuestions = new ArrayList<Question>();
		for(int i=0; i<topQuestionsRanks.size(); i++) {
			topQuestions.add(questionService.getQuestion(topQuestionsRanks.get(i).getL_num()));
			topQuestions.get(i).setLikecnt(topQuestionsRanks.get(i).getCnt());
		}
		model.addAttribute("topQuestions", topQuestions);
		model.addAttribute("cate", categoryService.categorySelect());
		return "searchmain/topQuestions";
	}
	
	@RequestMapping(value="searchProforSM", method=RequestMethod.GET)
	public String searchProSM(SearchPro searchPro, Model model,String pageNum) {
		ArrayList<Category> category = (ArrayList<Category>) categoryService.categorySelect();
		//System.out.println(category);
		model.addAttribute("cate", category);
		//System.out.println(searchPro);
		int totalCnt = promembersService.searchProforSMCnt(searchPro);
		Paging paging = new Paging(totalCnt, pageNum, 6);
		System.out.println("pageNum: "+pageNum);
		searchPro.setStartRow(paging.getStartRow());
		searchPro.setEndRow(paging.getEndRow());
		ArrayList<Promembers> searchedPros = (ArrayList<Promembers>) promembersService.searchProforSM(searchPro);
		//System.out.println(searchedPros);
		model.addAttribute("cnt", totalCnt);
		model.addAttribute("searched", searchedPros);		
		model.addAttribute("paging", paging);
		model.addAttribute("p_area", searchPro.getP_area());
		model.addAttribute("cate_num", searchPro.getCate_num());
		//System.out.println(model.toString());
		return "searchmain/searchResult";
	}
	
	@RequestMapping(value="searchConforSM", method=RequestMethod.GET)
	public String searchConSM(Contents searchCon, Model model,String pageNum) {
		ArrayList<Category> category = (ArrayList<Category>) categoryService.categorySelect();
		//System.out.println(category);
		model.addAttribute("cate", category);
		//System.out.println(searchPro);
		int totalCnt = contentsService.searchedConCnt(searchCon);
		Paging paging = new Paging(totalCnt, pageNum, 6);
		searchCon.setStartRow(paging.getStartRow());
		searchCon.setEndRow(paging.getEndRow());
		ArrayList<Contents> searchedCons = (ArrayList<Contents>) contentsService.searchContents(searchCon); 
		//System.out.println(searchedCons);
		model.addAttribute("cnt", totalCnt);
		model.addAttribute("searched", searchedCons);		
		model.addAttribute("paging", paging);
		model.addAttribute("searchWord", searchCon.getSearchWord());
		model.addAttribute("cate_num", searchCon.getCate_num());
		return "searchmain/searchResult";
	}
	
	@RequestMapping(value="searchQueforSM", method=RequestMethod.GET)
	public String searchQueforSM(Question searchQue, Model model,String pageNum) {
		ArrayList<Category> category = (ArrayList<Category>) categoryService.categorySelect();
		model.addAttribute("cate", category);
		int totalCnt = questionService.searchedQueCnt(searchQue.getSearchWord());
		Paging paging = new Paging(totalCnt, pageNum, 6);
		searchQue.setStartRow(paging.getStartRow());
		searchQue.setEndRow(paging.getEndRow());
		ArrayList<Question> searchedQue = (ArrayList<Question>) questionService.searchQueforSM(searchQue); 
		//System.out.println(searchedQue);
		model.addAttribute("cnt", totalCnt);
		model.addAttribute("searched", searchedQue);		
		model.addAttribute("paging", paging);
		model.addAttribute("searchWord", searchQue.getSearchWord());
		model.addAttribute("que", "yes");
		return "searchmain/searchResult";
	}
	
}
