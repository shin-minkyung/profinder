package com.tj.profinder.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.profinder.model.Likes;
import com.tj.profinder.model.Ppage;
import com.tj.profinder.model.Qanswer;
import com.tj.profinder.model.Question;
import com.tj.profinder.service.LikesService;
import com.tj.profinder.service.PpageService;
import com.tj.profinder.service.PromembersService;
import com.tj.profinder.service.QanswerService;
import com.tj.profinder.service.QuestionService;

@Controller
public class QuestionController {

	@Autowired 
	private QuestionService questionService;
	
	@Autowired
	private PpageService ppageService;
	
	@Autowired
	private QanswerService qanswerService;
	
	@Autowired
	private LikesService likeService;
	
	@Autowired
	private PromembersService promembersService;
	

	/* 유료질문방 글작성 */
	@RequestMapping(value="questionInsert", method=RequestMethod.POST)
	public String questionInsert(Question question, Model model) {
		int result = questionService.questionInsert(question);
		if(result==1) {
			Ppage ppage = new Ppage();
			ppage.setP_email(question.getP_email());
			ppage.setQ_num(questionService.questionNownum());
			ppageService.ppageQuestionInsert(ppage);
		}
		System.out.println("questionController : " + question.getP_email());
		return "redirect:ppageQuestionView.do?p_email="+question.getP_email();
	}
	
	/* 유료질문방 Modify */
	@RequestMapping(value="questionModify")
	public String questionModify(Model model, Question question, HttpSession httpSession) {
		model.addAttribute("questionModify", questionService.questionModify(question));
		return "redirect: fpageQuestionView.do?f_email="+httpSession.getAttribute("email");
	}
		
	/* 유료질문방 Delete */
	@RequestMapping(value="questionDelete")
	public String questionDelete(Model model, String q_num, Question question, HttpSession httpSession) {
		int result = ppageService.ppageQuestionDelete(q_num);
		if(result==1) {
			questionService.questionDelete(q_num);
		}
		return "redirect: fpageQuestionView.do?f_email="+httpSession.getAttribute("email");
	}
	
	/* 유료질문 답변보기 Ajax */
	@RequestMapping(value="qanswerList")
	public String qanswerList(String q_num, Model model, String p_email) {
		String p_nickname= promembersService.getPromembers(p_email).getP_nickname();
		ArrayList<Qanswer> qanswerlist=(ArrayList<Qanswer>) qanswerService.qanswerList(q_num);
		for(int i=0;i<qanswerlist.size(); i++) {
			qanswerlist.get(i).setP_nickname(p_nickname);
		}		
		model.addAttribute("qanswer", qanswerlist );
		model.addAttribute("q_num", q_num);
		model.addAttribute("getQ_star", questionService.getQ_star(q_num));		
		return "question/qanswer";
	}
	
	@RequestMapping(value="qanswerListforFinder")
	public String qanswerListforFinder(String q_num, Model model, String p_email) {
		Qanswer qanswer= qanswerService.getQanswer(q_num);
		String p_nickname=promembersService.getPromembers(p_email).getP_nickname();
		qanswer.setP_nickname(p_nickname);
		model.addAttribute("qanswer", qanswer);	
		model.addAttribute("getQ_star", questionService.getQ_star(q_num));	
		return "question/qanswer_fpage";
	}
	
	
	/* 유료질문방댓글 작성 */
	@RequestMapping(value="qanswerInsert")
	public String qanswerInsert(Qanswer qanswer, Model model, String p_email) {
		System.out.println("p_email: "+p_email);
		int result = qanswerService.qanswerInsert(qanswer);
		System.out.println("qanswer obj q_num: "+qanswer.getQ_num());
		if(result==1) {
			model.addAttribute("questionAccept", questionService.questionAccept(qanswer.getQ_num()));
		}		
		return "redirect:ppageQuestionView.do?p_email="+p_email;
	}
	
	/* 유료질문방답변 수정 */
	@RequestMapping(value="qanswerModify")
	public String qanswerModify(Qanswer qanswer, Model model,String p_email) {
		qanswerService.qanswerModify(qanswer);
		return "redirect:ppageQuestionView.do?p_email="+p_email;
		/*return "redirect:qanswerList.do?q_num="+q_num;*/
	}
	
	/* 유료질문방답변 삭제 */
	@RequestMapping(value="qanswerDelete")
	public String qanswerDelete(String q_num, Model model, String p_email) {
		System.out.println("q_num: "+q_num);
		int result = qanswerService.qanswerDelete(q_num);
		if(result==1) {
			model.addAttribute("questionStanBy", questionService.questionStanBy(q_num));
		}		
		return "redirect:ppageQuestionView.do?p_email="+p_email;
	}
	
	
	/* 유료질문방 거절 Reject */
	@RequestMapping(value="questionReject")
	public String questionReject(String q_num, Model model, Question question) {
		model.addAttribute("questionReject", questionService.questionReject(q_num));
		Ppage ppage = new Ppage();
		ppage.setP_email(question.getP_email());			
		return "redirect:ppageQuestionView.do?p_email="+question.getP_email();
	}	

	/* 유료질문방 별점주기 */
	@RequestMapping(value="question_qstar", method=RequestMethod.GET)
	public String questionQ_star(Question question, Model model, HttpSession httpSession) {
		model.addAttribute("questionQ_star", questionService.questionQ_star(question));		 
		return "redirect:fpageQuestionView.do?f_email="+httpSession.getAttribute("email");
	}			
	
	@RequestMapping(value="questionMainBanner",method=RequestMethod.POST)
	public String questionMainBanner(Model model) {
		ArrayList<Likes> likes = (ArrayList<Likes>)likeService.likesMainBannerQuestion();
		ArrayList<Question> questionMainBanner = new ArrayList<Question>();
		for(int i=0;i<likes.size();i++) {
			questionMainBanner.add(questionService.questionMainBanner(likes.get(i).getL_num()));
			questionMainBanner.get(i).setCnt(likes.get(i).getCnt());
		}
		model.addAttribute("questionMainBanner",questionMainBanner);
		return "question/questionBanner";
	}
	@RequestMapping(value="questionMainBannerAjax",method=RequestMethod.POST)
	public String questionMainBannerAjax(Likes like,Model model) {
		ArrayList<Likes> likes = (ArrayList<Likes>)likeService.likesMainBannerQuestionAjax(like);
		
		ArrayList<Question> questionMainBannerAjax = new ArrayList<Question>();
		for(int i=0;i<likes.size();i++) {
			questionMainBannerAjax.add(questionService.questionMainBanner(likes.get(i).getL_num()));
			questionMainBannerAjax.get(i).setCnt(likes.get(i).getCnt());
		}
		model.addAttribute("questionMainBannerAjax",questionMainBannerAjax);
		return "question/questionBannerAjax";
	}
	
	@RequestMapping(value="questionAutoInsert")
	public void questionAutoInsert300(){
		questionService.questionAutoInsert();		
	}
	
	@RequestMapping(value="qAnswerAutoInsert")
	public void qAnswerAutoInsert() {
		qanswerService.qAnswerAutoInsert();
	}
	
	@RequestMapping(value="questionAutolike")
	public void questionAutolike() {
		likeService.questionAutolike();
	}
	
	
	
}

