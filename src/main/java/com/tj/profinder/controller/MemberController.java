package com.tj.profinder.controller;

import java.util.ArrayList;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.profinder.model.Favorite;
import com.tj.profinder.model.Findermembers;
import com.tj.profinder.model.Promembers;
import com.tj.profinder.service.FavoriteService;
import com.tj.profinder.service.FindermembersService;
import com.tj.profinder.service.ModifymemberService;
import com.tj.profinder.service.PromembersService;

@Controller
public class MemberController {
	@Autowired
	public FindermembersService finderservice;
	@Autowired
	public PromembersService proservice;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	public ModifymemberService modifyservice;
	@Autowired
	private FavoriteService favoriteService;
	
	/*@Autowired
	public FavoriteService jjimService;*/
	
	/* 회원가입 페이지 이동 */
	@RequestMapping(value="joinView", method=RequestMethod.GET)
	public String joinView(Model model) {
		model.addAttribute("cate", finderservice.categorySelect());
		return "member/join";
	}
	/* 파인더 회원가입 처리 */
	@RequestMapping(value="finderJoin", method=RequestMethod.POST)
	public String finderJoin(MultipartHttpServletRequest mRequest, Model model, HttpSession httpSession) {
			int result = finderservice.findermembersInsert(mRequest, httpSession);
			return "redirect:main.do?joinResult="+result;
	}
	/* 프로 회원가입 처리 */
	@RequestMapping(value="proJoin", method=RequestMethod.POST)
	public String proJoin(MultipartHttpServletRequest mRequest, Model model, HttpSession httpSession) {
			int result = proservice.promembersInsert(mRequest, httpSession);
			return "redirect:main.do?joinResult="+result;
	}
	/* 회원가입 이메일 중복체크 */
	@RequestMapping(value="conFirmEmail", method=RequestMethod.GET)
	public String finderConfirmEmail(String f_email, Model model, String p_email, HttpServletRequest request) {
		int result = finderservice.findermembersConfirmEmail(f_email);
		if(result == 0) {
			result = proservice.promembersConfirmEmail(p_email);
		}
		model.addAttribute("result", result);
		return "confirm/ConfirmEmail";
	}
	/* 회원가입 닉네임 중복체크 */
	@RequestMapping(value="confirmNickName", method=RequestMethod.GET)
	public String findermembersConfirmNickName(String f_nickname, Model model, String p_nickname) {
		int result = finderservice.findermembersConfirmNickName(f_nickname);
		if(result == 0) {
			result = proservice.promembersConfirmNickName(p_nickname);
		}
		model.addAttribute("result", result);
		return "confirm/confirmNickname";
	}
	
	
	/* 회원가입 이메일인증 발송 */
	@RequestMapping(value="confirmRequest")
	public String confirmRequest(final String e_email, final String e_name, Model model) {
		System.out.println(e_name+"님("+e_email+")께 메일을 발송하는 로직");
		final int su = (int) ((Math.random()*899999)+100000);
		MimeMessagePreparator message = new MimeMessagePreparator() {
			String content = "회원가입에 필요한 인증번호는 "+su+"입니다";
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(e_email));
				mimeMessage.setFrom(new InternetAddress("hyun133468@gmail.com"));
				mimeMessage.setSubject(e_name+"님이 요청하신 인증번호입니다");
				mimeMessage.setText(content, "utf-8", "html");
			}
		};
		mailSender.send(message);
		model.addAttribute("su", su);
		return "confirm/confirmMail";
	}
	@RequestMapping(value="memberLoginView")
	public String f_loginform() {
		return "member/memberLoginView";

	}

	
	
	
	/*세운오빠꺼 나중에 확인할것*/
	/*@RequestMapping(value = "memberLogin")
	public String f_login(Findermembers findermembers, String f_pw, Promembers promembers, HttpServletRequest request,
			String p_pw, HttpSession httpSession, Model model) {
		String jspFile = (String)httpSession.getAttribute("jspFile");
		String p_email = (String)httpSession.getAttribute("promemberPageEmail");
		String f_email = (String)httpSession.getAttribute("findermembersPageEmail");
		System.out.println(jspFile);
		String result = loginservice.f_loginCheck(request, httpSession);
		if (result.equals("Login!")) {
			model.addAttribute("f_email", request);
			model.addAttribute("result", result);
			return "redirect:"+jspFile+"?p_email="+p_email+"&f_email="+f_email;
		} else {
			result = loginservice.p_loginCheck(request, httpSession);
			if (result.equals("Login!")) {
				return "redirect:"+jspFile+"?p_email="+p_email+"&f_email="+f_email;
			} else {
				model.addAttribute("p_email", request);
				model.addAttribute("result", result);
				return "redirect:"+jspFile+"?p_email="+p_email+"&f_email="+f_email;
			}
		}
	}*/

	@RequestMapping(value = "memberLogout")
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:main.do";
	}

	@RequestMapping(value="promembersMainBanner",method=RequestMethod.POST)
	public String promembersMainBanner(Model model) {
		ArrayList<Favorite> favorites = (ArrayList<Favorite>)favoriteService.favoriteMainBannerPromembers();
		ArrayList<Promembers> promembersMainBanner = new ArrayList<Promembers>();
		for(int i=0;i<favorites.size();i++) {
			promembersMainBanner.add(proservice.getPromembers(favorites.get(i).getP_email()));
			promembersMainBanner.get(i).setCnt(favorites.get(i).getCnt());
		}
		model.addAttribute("promembersMainBanner",promembersMainBanner);
		return "member/promembersBanner";
	}
	@RequestMapping(value="promembersMainBannerAjax",method=RequestMethod.POST)
	public String promembersMainBannerAjax(Favorite favorite,Model model) {
		ArrayList<Favorite> favorites = (ArrayList<Favorite>)favoriteService.favoriteMainBannerPromembersAjax(favorite);
		ArrayList<Promembers> promembersMainBannerAjax = new ArrayList<Promembers>();
		for(int i=0;i<favorites.size();i++) {
			promembersMainBannerAjax.add(proservice.getPromembers(favorites.get(i).getP_email()));
			promembersMainBannerAjax.get(i).setCnt(favorites.get(i).getCnt());
		}
		model.addAttribute("promembersMainBannerAjax",promembersMainBannerAjax);
		return "member/promembersBannerAjax";
	}
	
	@RequestMapping(value="insert100Pros")
	public void insert100Pros() {
		proservice.insert100pros();
	}
	@RequestMapping(value="insert100Finders")
	public void insert100Finders() {
		finderservice.insert100Finders();
	}
	@RequestMapping(value="autoJjim")
	public void autoJjim() {
		favoriteService.autoInsertJjim();
	}
	@RequestMapping(value="sessionView")
	public String sessionView() {
		return "sessionView/sessionView";
	}
	
	/* 파인더, 프로 비밀번호/ 사진변경 */ 
	@RequestMapping(value = "fmembersPwModify", method=RequestMethod.POST)
	public String fmembersPwModify(MultipartHttpServletRequest mRequest, Model model, HttpSession httpSession, String f_email) {
		int cnt = modifyservice.finderModifyChk(f_email);
		System.out.println("비밀번호cnt : " + cnt);
		if(cnt == 1) {
			int result = modifyservice.findermembersPwModify(mRequest, httpSession);
			model.addAttribute("pwModifyResult", result);
			model.addAttribute("memberModify",result);
		}else if(cnt == 0) {
			int result = modifyservice.promembersPwModify(mRequest, httpSession);
			model.addAttribute("pwModifyResult", result);
			model.addAttribute("memberModify",result);
		}
		return "forward:main.do";

	}
	
	/* 파인더 , 프로 기본 정보 수정 */
	@RequestMapping(value = "nomalUpdate", method=RequestMethod.POST)
	public String pmembersPwModify(HttpServletRequest request, Model model, HttpSession session, String f_email) {
		int cnt = modifyservice.finderModifyChk(f_email);
		System.out.println("기본정보cnt : " + cnt);
		if(cnt == 1) {
			int result = modifyservice.finderNomalUpdate(request, session);
			model.addAttribute("pwModifyResult", result);
		}else {
			int result = modifyservice.proNomalUpdate(request, session);
			model.addAttribute("pwModifyResult", result);
		}
			return "forward:main.do";
	}
	
	/* 파인더 , 프로 부가 정보 수정 */
	@RequestMapping(value = "additionUpdate", method=RequestMethod.POST)
	public String additionUpdate(MultipartHttpServletRequest mRequest, HttpSession session, Model model, String f_email) {
		int cnt = modifyservice.finderModifyChk(f_email);
		System.out.println("부가정보cnt : " + cnt);
		if(cnt == 1) {
			int result = modifyservice.finderadditionUpdate(mRequest, session);
			model.addAttribute("pwModifyResult", result);
		}else if(cnt == 0) {
			int result = modifyservice.proadditionUpdate(mRequest, session);
			model.addAttribute("pwModifyResult", result);
		}
		
		return "account/account";
	}
	
	/* 파인더, 프로 회원탈퇴 */
	@RequestMapping(value = "dropUpdate")
	public String dropUpdate(Model model, String f_email, HttpServletRequest request, HttpSession session) {
		int cnt = modifyservice.finderModifyChk(f_email);
		System.out.println("삭제cnt : " + cnt);
		if(cnt == 1) {
			int result = modifyservice.finderDropUpdate(request, session);
			model.addAttribute("dropResult", result);
			session.invalidate();
		}else if(cnt == 0) {
			int result = modifyservice.proDropUpdate(request, session);
			model.addAttribute("dropResult", result);
			session.invalidate();
		}
		return "forward:main.do";
	}
	/* 아이디 / 비번찾기 페이지 이동 */
	@RequestMapping(value="searchMemberView")
	public String searchMemberView() {
		return "member/searchMember";
	}
	
	/* 아이디 찾기 */
	@RequestMapping(value="searchMemberId")
	public String searchMemberId(Findermembers findermembers, Promembers promembers, Model model) {
		Findermembers finderID = finderservice.finderSearchID(findermembers);
		Promembers proID = proservice.proSearchID(promembers);
		model.addAttribute("finderID", finderID);
		model.addAttribute("proID", proID);
		return "member/searchMemberID";
	}
	/* 비번 찾기 */
	@RequestMapping(value="searchMemberPw")
	public String searchMemberPw(Findermembers findermembers, Promembers promembers, Model model) {
		Findermembers finderPW = finderservice.finderSearchPW(findermembers);
		Promembers proPW = proservice.proSearchPW(promembers);
		model.addAttribute("finderPW", finderPW);
		model.addAttribute("proPW", proPW);
		return "member/searchMemberPW";
	}
	
	/* 로그인 체크 */
	@RequestMapping(value = "memberLoginChk", method=RequestMethod.POST)
	public String memberLoginChk(Findermembers findermembers, Promembers promembers, Model model) {
		int result = finderservice.getFinderIDChk(findermembers);
		System.out.println("콘트롤러 result = " + result);
		if(result == -1) {
			result = proservice.getProIDChk(promembers);
		}
		model.addAttribute("result", result);
		System.out.println("finresult = "+result);
		return "member/loginchk";
	}
	/* 로그인 처리 */
	@RequestMapping(value="memberLogin")
	public String memberLogin(Findermembers findermembers, Promembers promembers, Model model, HttpSession session, HttpServletRequest request) {
		Findermembers finder = finderservice.loginFinder(findermembers, request);
		System.out.println("finder : "+finder);
		Promembers pro = proservice.LoginPro(promembers, request);
		System.out.println("pro : "+pro);
		if(finder != null) {
			session.setAttribute("findermembers", finder);
			session.setAttribute("pw", finder.getF_pw());
			session.setAttribute("email",finder.getF_email());
			session.setAttribute("name",finder.getF_name());
			session.setAttribute("nickname",finder.getF_nickname());
			session.setAttribute("photo",finder.getF_photo1());
		}else if(pro != null) {
			session.setAttribute("promembers", pro);
			session.setAttribute("pw", pro.getP_pw());
			session.setAttribute("email",pro.getP_email());
			session.setAttribute("name",pro.getP_name());
			session.setAttribute("nickname",pro.getP_nickname());
			session.setAttribute("photo",pro.getP_photo1());
		}
		System.out.println("jspFile"+session.getAttribute("jspFile"));
		if(session.getAttribute("jspFile")!=null) {
		String jspFile = (String)session.getAttribute("jspFile");
		return "redirect:"+jspFile;
		}else {
			return "redirect:main.do";
		}
	}


}
