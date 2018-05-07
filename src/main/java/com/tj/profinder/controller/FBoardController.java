package com.tj.profinder.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.profinder.model.FbComment;
import com.tj.profinder.model.Fboard;
import com.tj.profinder.model.Likes;
import com.tj.profinder.model.Report;
import com.tj.profinder.service.FbCommentService;
import com.tj.profinder.service.FboardService;
import com.tj.profinder.service.LikesService;
import com.tj.profinder.service.Paging;
import com.tj.profinder.service.ReportService;

@Controller
public class FBoardController {
	@Autowired
	public FboardService fboardservice;
	@Autowired
	public FbCommentService commentservice;
	@Autowired
	public ReportService rService;
	@Autowired
	public LikesService likeService;
	/* 자유게시판 리스트 보기 */
	@RequestMapping(value="fboardList", method=RequestMethod.GET)
	public String fboardList1(Model model,HttpSession session) {
		
		
		ArrayList<Fboard> fboardList = (ArrayList<Fboard>)fboardservice.fboardList();
		if(fboardList!=null) {
			for(int i=0;i<fboardList.size();i++) {
				
				fboardList.get(i).setTotal(fboardservice.fboardTotal(fboardList.get(i).getFb_num()));
				fboardList.get(i).setLikecnt(fboardservice.fboardLikeCnt(fboardList.get(i).getFb_num()));
				System.out.println("댓글갯수"+fboardservice.fboardTotal(fboardList.get(i).getFb_num()));
				System.out.println("라이크갯수"+fboardservice.fboardLikeCnt(fboardList.get(i).getFb_num()));
			}
		}
		model.addAttribute("fboardList",fboardList );
		model.addAttribute("fboardTotal", commentservice.fbCommentTotal());
		session.setAttribute("jspFile","fboardList.do");
		return "fboard/fboardList";
	}
	/* 자유게시판 리스트 보기 */
	@RequestMapping(value="fboardList", method=RequestMethod.POST)
	public String fboardList(Fboard fboard, String pageNum, Model model) {
		model.addAttribute("fboardList", fboardservice.fboardList());
		model.addAttribute("fboardTotal", commentservice.fbCommentTotal());
		return "fboard/fboardList";
	}
	/* 자유게시판 글 작성 */
	@RequestMapping(value="fboardInsert", method=RequestMethod.POST)
	public String fboardWrite(Fboard fboard, HttpServletRequest request, HttpSession session, Model model) {
		fboard.setFb_ip(request.getRemoteHost());
		int result = fboardservice.fboardInsert(fboard);
		model.addAttribute("insertResult", result);
		return "forward:fboardList.do";
	}
	/* 자유게시판 글 수정하기 */
	@RequestMapping(value="fboardModify", method=RequestMethod.POST)
	public String fboardModify(Fboard fboard, String pageNum, String fb_num, Model model) {
		int result = fboardservice.fboardModify(fboard);
		model.addAttribute("modifyResult", result);
		return "forward:fboardList.do";
	}
	/* 자유게시판 글 삭제여부 변경 */
	@RequestMapping(value="fboardDelete")
	public String fboardDelete(String fb_num) {
		fboardservice.fboardDelete(fb_num);
		return "redirect:fboardList.do";
	}
	/* 자유게시판 댓글 리스트 */
	@RequestMapping(value="fboardCommentList")
	public String fboardList(String fb_num, Model model) {
		model.addAttribute("fboardComment", commentservice.fbCommentListView(fb_num));
		model.addAttribute("fb_num", fb_num);
		return "fboard/fboardComment";
	}
	/* 자유게시판 댓글 작성 */
	@RequestMapping(value="fboardCommentInsert")
	public String fboardInsert(FbComment comment, Model model, HttpServletRequest request) {
		comment.setFc_ip(request.getRemoteHost());
		commentservice.fbCommentInsertView(comment);
		return "redirect:fboardCommentList.do?fb_num="+comment.getFb_num();
	}
	/* 댓글의 원글 정보 가져오기 */
	@RequestMapping(value="getComment")
	public String getComment(String fc_num, Model model, String fb_num) {
		System.out.println(commentservice.getFbComment(fc_num));
		model.addAttribute("getcomment", commentservice.getFbComment(fc_num));
		return "forward:fboardCommentList.do?fb_num="+fb_num;
	}
	/* 자유게시판 대댓글 작성 */
	@RequestMapping(value="fboardCommentReply")
	public String fboardCommentReply(FbComment comment, Model model, HttpServletRequest request, String fc_num, int cnt) {
		comment.setFc_ip(request.getRemoteHost());
		if(cnt == 0) {
			commentservice.fbCommentInserttwo(comment, fc_num);
		}else if(cnt != 0) {
			commentservice.fbCommentInsertThree(comment, fc_num);
		}
		return "redirect:fboardCommentList.do?fb_num="+comment.getFb_num();
	}
	/* 자유게시판 검색 */
	@RequestMapping(value="fboardSearch")
	public String fboardSearch(Fboard fboard, Model model) {
		model.addAttribute("fboardList", fboardservice.fboardSearch(fboard));
		System.out.println("검색결과 : "+fboardservice.fboardSearch(fboard));
		return "fboard/fboardList";
	}
	/* 자유게시판 댓글 수정 */
	@RequestMapping(value="commentUpdate")
	public String fbCommentUpdate(FbComment comment, Model model, String fb_num) {
		commentservice.fbCommentUpdate(comment);
		return "redirect:fboardCommentList.do?fb_num="+fb_num;
	}
	/* 자유게시판 댓글 삭제 여부 변경 */
	@RequestMapping(value="commentDelete")
	public String fbCommentDelete(String fc_num, Model model, String fb_num) {
		commentservice.fbCommentDelete(fc_num);
		return "redirect:fboardCommentList.do?fb_num="+fb_num;
	}
	/* 자유게시판 신고하기 */
	@RequestMapping(value="report")
	public String report(Report report, Model model) {
		rService.ReportInsert(report);
		return "redirect:fboardList.do";
	}
	/* 자유게시판 무한 스크롤 */
	@RequestMapping(value="fboardlistajax")
	public String fboardListajax(Fboard fboard, Model model) {
		System.out.println(fboardservice.fboardListajax(fboard.getRn()));
		model.addAttribute("fboardListAjax", fboardservice.fboardListajax(fboard.getRn()));
		System.out.println(fboard.getRn());
		return "fboard/fboardListajax";
	}
	/* 자유게시판 좋아요 추가 */
	@RequestMapping(value="fboardLikeInsert")
	public String fboardLikeInsert(Likes likes, Model model) {
		int cnt = likeService.fboardLikesChk(likes);
		if(cnt == 0) {
			likeService.likeInsert(likes);
		}else {
			model.addAttribute("likeChk", 1);
		}
		return "forward:fboardList.do";
	}
	@RequestMapping(value="fboardAutoInsert")
	public String fboardAutoInsert() {
		fboardservice.autoFboard();
		return "redirect:searchmain.do";
	}
}
		
	
