package com.tj.profinder.controller;

import java.util.ArrayList;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.profinder.model.Admin;
import com.tj.profinder.model.AdminMenu;
import com.tj.profinder.model.Category;
import com.tj.profinder.model.Claim;
import com.tj.profinder.model.Contents;
import com.tj.profinder.service.AdminService;
import com.tj.profinder.service.CategoryService;
import com.tj.profinder.service.ClaimService;
import com.tj.profinder.service.ContentsService;
import com.tj.profinder.service.Paging;

@Controller
public class AdminController {
	@Autowired
	private ContentsService contentsService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private ClaimService claimService;
	@Autowired
	private JavaMailSender mailSender; 
	@RequestMapping(value="adminMain")
	public String adminMain(){
		return "admin/admin";
	}
	
	@RequestMapping(value="adminChk", method=RequestMethod.POST)
	public String adminLoginChk(Admin admin, Model model) {
		System.out.println(admin);
		int result = adminService.adminLoginChk(admin);
		model.addAttribute("result", result);
		System.out.println("result"+result);
		return "admin/loginChk";
	}
	@RequestMapping(value="adminLogin", method=RequestMethod.POST)
	public String adminLogin(Admin admin, HttpSession session) {
		Admin loginAdmin= adminService.getAdmin(admin);
		//System.out.println("adminLogin.do "+admin);
		session.removeAttribute("promembers");
		session.removeAttribute("findermembers");
		session.removeAttribute("nickname");
		session.removeAttribute("email");
		session.setAttribute("loginAdmin", loginAdmin);
		session.setAttribute("ad_id", loginAdmin.getAd_id());
		session.setAttribute("ad_pw", loginAdmin.getAd_pw());
		session.setAttribute("ad_name", loginAdmin.getAd_name());
		return "admin/admin";		
	}
	@RequestMapping(value="adminLogout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
	
	@RequestMapping(value="adminMembers")
	public String adminMembers(Model model) {
		ArrayList<AdminMenu> members_menu = new ArrayList<AdminMenu>();
		members_menu.add(new AdminMenu("전체 회원 보기", "adminMembers.do", 0));
		members_menu.add(new AdminMenu("신고 회원 보기", "", 0));
		members_menu.add(new AdminMenu("처리 대기 목록", "", 1));
		members_menu.add(new AdminMenu("처리 완료 목록", "", 1));		
		model.addAttribute("page", "members");
		model.addAttribute("menu", members_menu);
		return "admin/members";
	}	
	
	@RequestMapping(value="adminContents", method=RequestMethod.GET)
	public String adminContents(Contents contents, Model model, String pageNum) {
		ArrayList<Category> category = (ArrayList<Category>) categoryService.categorySelect();
		model.addAttribute("cate", category);//category list from DB

		int total= contentsService.totalContents();
		Paging paging = new Paging(total, pageNum);
		contents.setStartRow(paging.getStartRow());
		contents.setEndRow(paging.getEndRow());		
		model.addAttribute("paging", paging);
		model.addAttribute("allCon", contentsService.allContentsList(contents));
		//paging for all contents list
		
		ArrayList<AdminMenu> contents_menu = new ArrayList<AdminMenu>();
		contents_menu.add(new AdminMenu("전체 컨텐츠 보기", "adminContents.do", 0));
		contents_menu.add(new AdminMenu("신고 컨텐츠 보기", "", 0));
		contents_menu.add(new AdminMenu("처리 대기 목록", "", 1));
		contents_menu.add(new AdminMenu("처리 완료 목록", "", 1));		
		model.addAttribute("page", "contents");
		model.addAttribute("menu", contents_menu);	
		//submenu list, page name setting
		
		return "admin/contents";
	}
	
	/*Ajax*/
	@RequestMapping(value="getContents", method=RequestMethod.GET)
	public String getContents(Model model, String con_num) {
		ArrayList<Category> category = (ArrayList<Category>) categoryService.categorySelect();
		Contents thecon= contentsService.getContents(con_num);
		model.addAttribute("thecon", thecon);
		model.addAttribute("cate", category);
		return "admin/getContents";
	}
	
	@RequestMapping(value="searchContents", method=RequestMethod.GET)
	public String searchContents(Model model, Contents searchWord, String pageNum) {
		System.out.println(searchWord.getSearchWord());
		ArrayList<Category> category = (ArrayList<Category>) categoryService.categorySelect();
		model.addAttribute("cate", category);
		int searchedConCnt=contentsService.searchedConCnt(searchWord);
		System.out.println("검색결과수"+searchedConCnt);
		Paging paging= new Paging(searchedConCnt, pageNum);
		searchWord.setStartRow(paging.getStartRow());
		searchWord.setEndRow(paging.getEndRow());
		System.out.println("startRow: "+paging.getStartRow()+"endRow: "+paging.getEndRow());
		model.addAttribute("paging", paging);
		model.addAttribute("searchedList", contentsService.searchContents(searchWord));
		model.addAttribute("searchWord",searchWord.getSearchWord());
		model.addAttribute("cate_num", searchWord.getCate_num());
		model.addAttribute("resultCnt", searchedConCnt);
		
		ArrayList<AdminMenu> contents_menu = new ArrayList<AdminMenu>();
		contents_menu.add(new AdminMenu("전체 컨텐츠 보기", "adminContents.do", 0));
		contents_menu.add(new AdminMenu("신고 컨텐츠 보기", "#", 0));
		contents_menu.add(new AdminMenu("처리 대기 목록", "#", 1));
		contents_menu.add(new AdminMenu("처리 완료 목록", "#", 1));		
		model.addAttribute("page", "contents");
		model.addAttribute("menu", contents_menu);	
		return "admin/searchResult_con2";
	}
	@RequestMapping(value="adminClaim",method=RequestMethod.GET)
	public String claimAllList(Model model,Claim claim,String pageNum) {
		Paging paging = new Paging(claimService.totalClaim(), pageNum);
		claim.setStartRow(paging.getStartRow());
		claim.setEndRow(paging.getEndRow());
		model.addAttribute("allClaim",claimService.claimAdminList(claim));
		ArrayList<AdminMenu> claim_menu = new ArrayList<AdminMenu>();
		claim_menu.add(new AdminMenu("전체 1:1 문의 보기","adminClaim.do",0));
		claim_menu.add(new AdminMenu("완료전 1:1 문의 보기","adminClaimBefore.do",0));
		claim_menu.add(new AdminMenu("완료후 1:1 문의 보기","adminClaimAfter.do",0));
		model.addAttribute("menu",claim_menu);
		model.addAttribute("page","claim");
		model.addAttribute("paging",paging);
		return "admin/claim";
	}
	@RequestMapping(value="adminClaimBefore",method=RequestMethod.GET)
	public String claimListBefore(Model model,Claim claim,String pageNum) {
		Paging paging = new Paging(claimService.totalClaimBefore(), pageNum);
		claim.setStartRow(paging.getStartRow());
		claim.setEndRow(paging.getEndRow());
		model.addAttribute("allClaim",claimService.claimAdminListBefore(claim));
		ArrayList<AdminMenu> claim_menu = new ArrayList<AdminMenu>();
		claim_menu.add(new AdminMenu("전체 1:1 문의 보기","adminClaim.do",0));
		claim_menu.add(new AdminMenu("완료전 1:1 문의 보기","adminClaimBefore.do",0));
		claim_menu.add(new AdminMenu("완료후 1:1 문의 보기","adminClaimAfter.do",0));
		model.addAttribute("menu",claim_menu);
		model.addAttribute("page","claim");
		model.addAttribute("paging",paging);
		return "admin/claimBefore";
	}
	@RequestMapping(value="adminClaimAfter",method=RequestMethod.GET)
	public String claimListAfter(Model model,Claim claim,String pageNum) {
		Paging paging = new Paging(claimService.totalClaimAfter(), pageNum);
		claim.setStartRow(paging.getStartRow());
		claim.setEndRow(paging.getEndRow());
		model.addAttribute("allClaim",claimService.claimAdminListAfter(claim));
		ArrayList<AdminMenu> claim_menu = new ArrayList<AdminMenu>();
		claim_menu.add(new AdminMenu("전체 1:1 문의 보기","adminClaim.do",0));
		claim_menu.add(new AdminMenu("완료전 1:1 문의 보기","adminClaimBefore.do",0));
		claim_menu.add(new AdminMenu("완료후 1:1 문의 보기","adminClaimAfter.do",0));
		model.addAttribute("menu",claim_menu);
		model.addAttribute("page","claim");
		model.addAttribute("paging",paging);
		return "admin/claimAfter";
	}
	@RequestMapping(value="adminClaimSearch",method=RequestMethod.GET)
	public String claimListSearch(Model model,Claim claim,String pageNum) {
		Paging paging = new Paging(claimService.totalClaimAdminSearchList(claim),pageNum);
		claim.setStartRow(paging.getStartRow());
		claim.setEndRow(paging.getEndRow());
		model.addAttribute("allClaim",claimService.claimAdminSearchList(claim));
		ArrayList<AdminMenu> claim_menu = new ArrayList<AdminMenu>();
		claim_menu.add(new AdminMenu("전체 1:1 문의 보기","adminClaim.do",0));
		claim_menu.add(new AdminMenu("완료전 1:1 문의 보기","adminClaimBefore.do",0));
		claim_menu.add(new AdminMenu("완료후 1:1 문의 보기","adminClaimAfter.do",0));
		model.addAttribute("menu",claim_menu);
		model.addAttribute("page","claim");
		model.addAttribute("paging",paging);
		model.addAttribute("searchWord",claim.getSearchWord());
		return "admin/claimSearch";
	}
	@RequestMapping(value="adminClaimBeforeSearch",method=RequestMethod.GET)
	public String claimListBeforeSearch(Model model,Claim claim,String pageNum) {
		Paging paging = new Paging(claimService.totalClaimAdminSearchListBefore(claim), pageNum);
		claim.setStartRow(paging.getStartRow());
		claim.setEndRow(paging.getEndRow());
		model.addAttribute("allClaim",claimService.claimAdminSearchListBefore(claim));
		ArrayList<AdminMenu> claim_menu = new ArrayList<AdminMenu>();
		claim_menu.add(new AdminMenu("전체 1:1 문의 보기","adminClaim.do",0));
		claim_menu.add(new AdminMenu("완료전 1:1 문의 보기","adminClaimBefore.do",0));
		claim_menu.add(new AdminMenu("완료후 1:1 문의 보기","adminClaimAfter.do",0));
		model.addAttribute("menu",claim_menu);
		model.addAttribute("page","claim");
		model.addAttribute("paging",paging);
		model.addAttribute("searchWord",claim.getSearchWord());
		return "admin/claimBeforeSearch";
	}
	@RequestMapping(value="adminClaimAfterSearch",method=RequestMethod.GET)
	public String claimListAfterSearch(Model model,Claim claim,String pageNum) {
		Paging paging = new Paging(claimService.totalClaimAdminSearchListAfter(claim), pageNum);
		claim.setStartRow(paging.getStartRow());
		claim.setEndRow(paging.getEndRow());
		model.addAttribute("allClaim",claimService.claimAdminSearchListAfter(claim));
		ArrayList<AdminMenu> claim_menu = new ArrayList<AdminMenu>();
		claim_menu.add(new AdminMenu("전체 1:1 문의 보기","adminClaim.do",0));
		claim_menu.add(new AdminMenu("완료전 1:1 문의 보기","adminClaimBefore.do",0));
		claim_menu.add(new AdminMenu("완료후 1:1 문의 보기","adminClaimAfter.do",0));
		model.addAttribute("menu",claim_menu);
		model.addAttribute("page","claim");
		model.addAttribute("paging",paging);
		model.addAttribute("searchWord",claim.getSearchWord());
		return "admin/claimAfterSearch";
	}
	@RequestMapping(value="getClaim",method=RequestMethod.GET)
	public String getClaim(Model model,String cl_num) {
		
		model.addAttribute("getClaim",claimService.getClaim(cl_num));
		return "admin/getClaim";
	}
	@RequestMapping(value="claimAnswerView",method=RequestMethod.POST)
	public String claimAnswerView(String cl_num,Model model) {
		System.out.println("여기 오냐?"+cl_num);
		model.addAttribute("getClaim",claimService.getClaim(cl_num));
		return "admin/claimAnswerView";
	}
	@RequestMapping(value="claimAnswer",method=RequestMethod.POST)
	public String claimAnswer(final Claim claim, Model model,final String claimAnswer){
		System.out.println("여기는 언제옴?");
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = 
					"  <h1>"+claim.getCl_nickname()+"님의 1:1문의 답변입니다.</h1>"+
					"  <div style=\"width:800px; border-top:1px solid #158CBA; \">" + 
					"  <p style=\" font-weight:bold; color:#158CBA; \">"+claimAnswer+"</p>"+
					"    <img src=\"http://cafefiles.naver.net/20121224_244/btn0807_13562762820491C5zI_JPEG/%BB%E7%B6%F7%BE%C6%C0%CC%C4%DC3.jpg \" />\n" +
					"  </div>" + 
					"    <div style=\"color:#158CBA; font-weight: bold; font-size: 1.2em;\">profinder관리자</div>\n" + 
					"    <div style=\"color:#158CBA;\">서울시 종로구 삼일대로 17길 51 스타골드BD 302호</div>";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(claim.getCl_email()));
				mimeMessage.setFrom(new InternetAddress("profinder@gmail.com"));
				mimeMessage.setSubject(claim.getCl_nickname()+"님의 1:1 문의 답변입니다.");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message);
		model.addAttribute("claimAnswer",claimService.claimAnswerComplete(claim.getCl_num()));
		return "admin/claimAnswer";
	}

}
