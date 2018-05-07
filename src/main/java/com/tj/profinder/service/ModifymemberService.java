package com.tj.profinder.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.profinder.model.Findermembers;
import com.tj.profinder.model.Promembers;

public interface ModifymemberService {
		/* 이메일 비교를 위한 서비스 */
		public int finderModifyChk(String f_email);
		/* 파인더 멤버 사진 / 비밀번호 변경 */
		public int findermembersPwModify(MultipartHttpServletRequest mRequest,HttpSession httpSession);
		/* 파인더 멤버 회원 탈퇴 */
		public int  finderDropUpdate(HttpServletRequest request, HttpSession session);
		/* 파인더 멤버  기본정보 변경 */
		public int finderNomalUpdate(HttpServletRequest request, HttpSession session);
		/* 파인더 멤버 부가정보 변경  */
		public int finderadditionUpdate(MultipartHttpServletRequest mRequset, HttpSession session);
		/* 프로 멤버 부가 정보 변경 */
		public int proadditionUpdate(MultipartHttpServletRequest mRequest, HttpSession session);
		/* 프로 멤버 사진 / 비밀번호 변경 */
		public int promembersPwModify(MultipartHttpServletRequest mRequest,HttpSession httpSession);
		/* 프로 멤버 회원 탈퇴  */
		public int  proDropUpdate(HttpServletRequest request, HttpSession session);
		/* 프로 멤버 기본 정보 변경 */
		public int proNomalUpdate(HttpServletRequest request, HttpSession session);
		

}