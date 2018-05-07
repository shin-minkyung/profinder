package com.tj.profinder.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.profinder.dao.ModifymemberDao;
import com.tj.profinder.model.Findermembers;
import com.tj.profinder.model.Promembers;

@Service
public class ModifymemberServivImpl implements ModifymemberService {
	@Autowired
	private ModifymemberDao modifymemberDao;
	
	// 파인더 멤버 사진 / 비밀번호 수정 서비스 
	@Override
	public int findermembersPwModify(MultipartHttpServletRequest mRequest, HttpSession httpSession) {
		String uploadPath = mRequest.getRealPath("profile/");
		String savePath = "D:/teamSource/profinder/src/main/webapp/profile/";
		Iterator<String> iterator = mRequest.getFileNames();
		String[] photo = { "", "" };
		int idx = 0;
		while (iterator.hasNext()) {
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originFileName = mFile.getOriginalFilename();
			photo[idx] = originFileName;
			if (photo[idx] != null && !photo[idx].equals("")) {
				if (new File(uploadPath + photo[idx]).exists() || new File(savePath + photo[idx]).exists()) {
					photo[idx] = System.currentTimeMillis() + "_" + photo[idx];
				}
				try {
					System.out.println(idx + "번째 서버 : " + uploadPath + photo[idx]);
					System.out.println(idx + "번째 저장 : " + savePath + photo[idx]);
					mFile.transferTo(new File(uploadPath + photo[idx]));
					int result = copy(uploadPath + photo[idx], savePath + photo[idx]);
					System.out.println(result == 1 ? photo[idx] + "프로필 넣음" : photo[idx] + "프로필 못넣음");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				photo[0] = "";
			}
			idx++;
		} // while
		Findermembers findermembers = new Findermembers();
		findermembers = (Findermembers) httpSession.getAttribute("findermembers");
		findermembers.setF_email(mRequest.getParameter("f_email"));
		findermembers.setF_pw(mRequest.getParameter("f_pw"));
		if(photo[0] != "") {
			findermembers.setF_photo1(photo[0]);
		}
		System.out.println("서비스 : " + findermembers.toString());
		httpSession.setAttribute("findermembers", findermembers);
		httpSession.setAttribute("pw", findermembers.getF_pw());
		httpSession.setAttribute("email",findermembers.getF_email());
		httpSession.setAttribute("name",findermembers.getF_name());
		httpSession.setAttribute("nickname",findermembers.getF_nickname());
		httpSession.setAttribute("photo",findermembers.getF_photo1());
		return modifymemberDao.findermembersPwModify(findermembers);
	}
	// 프로멤버 비밀번호 / 사진 수정
	@Override
	public int promembersPwModify(MultipartHttpServletRequest mRequest, HttpSession httpSession) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("profile/");
		String savePath = "D:/teamSource/profinder/src/main/webapp/profile/";
		Iterator<String> iterator = mRequest.getFileNames();
		String[] photo = { "", "" };
		int idx = 0;
		while (iterator.hasNext()) {
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originFileName = mFile.getOriginalFilename();
			photo[idx] = originFileName;
			if (photo[idx] != null && !photo[idx].equals("")) {
				if (new File(uploadPath + photo[idx]).exists() || new File(savePath + photo[idx]).exists()) {
					photo[idx] = System.currentTimeMillis() + "_" + photo[idx];
				}
				try {
					System.out.println(idx + "번째 서버: " + uploadPath + photo[idx]);
					System.out.println(idx + "번째 저장 : " + savePath + photo[idx]);
					mFile.transferTo(new File(uploadPath + photo[idx]));
					int result = copy(uploadPath + photo[idx], savePath + photo[idx]);
					System.out.println(result == 1 ? photo[idx] + "프로필 넣음" : photo[idx] + "프로필 못넣음");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				photo[0] = "";
			}
			idx++;
		} // while
		Promembers promembers = new Promembers();
		promembers = (Promembers) httpSession.getAttribute("promembers");
		promembers.setP_email(mRequest.getParameter("f_email"));
		promembers.setP_pw(mRequest.getParameter("f_pw"));
		if(photo[0] != "") {
			promembers.setP_photo1(photo[0]);
		}
		System.out.println("서비스 : " + promembers.toString());
		httpSession.setAttribute("promembers", promembers);
		httpSession.setAttribute("pw", promembers.getP_pw());
		httpSession.setAttribute("email", promembers.getP_email());
		httpSession.setAttribute("name", promembers.getP_name());
		httpSession.setAttribute("nickname",promembers.getP_nickname());
		httpSession.setAttribute("photo",promembers.getP_photo1());
		return modifymemberDao.promembersPwModify(promembers);
	}
	
	/* 비교를 위한 메소드 */
	@Override
	public int finderModifyChk(String f_email) {
		return modifymemberDao.finderModifyChk(f_email);
	}
	
	/* 프로 멤버 기본 정보 변경 */
	@Override
	public int proNomalUpdate(HttpServletRequest request, HttpSession session) {
		Promembers promembers = new Promembers();
		promembers = (Promembers) session.getAttribute("promembers");
		promembers.setP_tel1(request.getParameter("f_tel1"));
		promembers.setP_tel2(request.getParameter("f_tel2"));
		promembers.setP_tel3(request.getParameter("f_tel3"));
		promembers.setP_bank(request.getParameter("f_bank"));
		promembers.setP_accountnum(request.getParameter("f_accountnum"));
		promembers.setP_area(request.getParameter("f_area"));
		promembers.setP_email(request.getParameter("f_email"));
		promembers.setP_name(request.getParameter("f_name"));
		session.setAttribute("promembers", promembers);
		session.setAttribute("pw", promembers.getP_pw());
		session.setAttribute("email", promembers.getP_email());
		session.setAttribute("name", promembers.getP_name());
		session.setAttribute("nickname",promembers.getP_nickname());
		session.setAttribute("photo",promembers.getP_photo1());
		return modifymemberDao.proNomalUpdate(promembers);
	}
	/* 파인더 멤버 기본 정보 변경 */
	@Override
	public int finderNomalUpdate(HttpServletRequest request, HttpSession session) {
		Findermembers findermembers = new Findermembers();
		findermembers = (Findermembers) session.getAttribute("findermembers");
		findermembers.setF_tel1(request.getParameter("f_tel1"));
		findermembers.setF_tel2(request.getParameter("f_tel2"));
		findermembers.setF_tel3(request.getParameter("f_tel3"));
		findermembers.setF_bank(request.getParameter("f_bank"));
		findermembers.setF_accountnum(request.getParameter("f_accountnum"));
		findermembers.setF_area(request.getParameter("f_area"));
		findermembers.setF_email(request.getParameter("f_email"));
		findermembers.setF_name(request.getParameter("f_name"));
		session.setAttribute("findermembers", findermembers);
		session.setAttribute("pw", findermembers.getF_pw());
		session.setAttribute("email",findermembers.getF_email());
		session.setAttribute("name",findermembers.getF_name());
		session.setAttribute("nickname",findermembers.getF_nickname());
		session.setAttribute("photo",findermembers.getF_photo1());
		return modifymemberDao.finderNomalUpdate(findermembers);
	}
	
	/* 파인더 멤버 부가 정보 변경 */
	@Override
	public int finderadditionUpdate(MultipartHttpServletRequest mRequest, HttpSession session) {
		String uploadPath = mRequest.getRealPath("profile/");
		String savePath = "D:/teamSource/profinder/src/main/webapp/profile/";
		Iterator<String> iterator = mRequest.getFileNames();
		String[] photo = { "", "" };
		int idx = 0;
		while (iterator.hasNext()) {
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originFileName = mFile.getOriginalFilename();
			photo[idx] = originFileName;
			if (photo[idx] != null && !photo[idx].equals("")) {
				if (new File(uploadPath + photo[idx]).exists() || new File(savePath + photo[idx]).exists()) {
					photo[idx] = System.currentTimeMillis() + "_" + photo[idx];
				}
				try {
					System.out.println(idx + "번째 서버 : " + uploadPath + photo[idx]);
					System.out.println(idx + "번째 저장 : " + savePath + photo[idx]);
					mFile.transferTo(new File(uploadPath + photo[idx]));
					int result = copy(uploadPath + photo[idx], savePath + photo[idx]);
					System.out.println(result == 1 ? photo[idx] + "프로필 넣음" : photo[idx] + "프로필 못넣음");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				photo[0] = "";
			}
			idx++;
		} // while
		Findermembers findermembers = new Findermembers();
		findermembers = (Findermembers) session.getAttribute("findermembers");
		findermembers.setF_email(mRequest.getParameter("f_email"));
		findermembers.setF_pw(mRequest.getParameter("hyunPw5"));
		findermembers.setF_message(mRequest.getParameter("f_message"));
		if(photo[0] != "") {
			findermembers.setF_photo2(photo[0]);
		}
		session.setAttribute("findermember", findermembers);
		session.setAttribute("pw", findermembers.getF_pw());
		session.setAttribute("email",findermembers.getF_email());
		session.setAttribute("name",findermembers.getF_name());
		session.setAttribute("nickname",findermembers.getF_nickname());
		session.setAttribute("photo",findermembers.getF_photo1());
		return modifymemberDao.finderadditionUpdate(findermembers);
	}
	
	/* 프로 멤버 부가 정보 변경 */
	@Override
	public int proadditionUpdate(MultipartHttpServletRequest mRequest, HttpSession session) {
		String uploadPath = mRequest.getRealPath("profile/");
		String savePath = "D:/teamSource/profinder/src/main/webapp/profile/";
		Iterator<String> iterator = mRequest.getFileNames();
		String[] photo = { "", "" };
		int idx = 0;
		while (iterator.hasNext()) {
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originFileName = mFile.getOriginalFilename();
			photo[idx] = originFileName;
			if (photo[idx] != null && !photo[idx].equals("")) {
				if (new File(uploadPath + photo[idx]).exists() || new File(savePath + photo[idx]).exists()) {
					photo[idx] = System.currentTimeMillis() + "_" + photo[idx];
				}
				try {
					System.out.println(idx + "번째 서버: " + uploadPath + photo[idx]);
					System.out.println(idx + "번째 저장 : " + savePath + photo[idx]);
					mFile.transferTo(new File(uploadPath + photo[idx]));
					int result = copy(uploadPath + photo[idx], savePath + photo[idx]);
					System.out.println(result == 1 ? photo[idx] + "프로필 넣음" : photo[idx] + "프로필 못넣음");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				photo[0] = "";
			}
			idx++;
		} // while
		Promembers promembers = new Promembers();
		promembers = (Promembers) session.getAttribute("promembers");
		promembers.setP_email(mRequest.getParameter("f_email"));
		promembers.setP_pw(mRequest.getParameter("hyunPw5"));
		promembers.setP_message(mRequest.getParameter("f_message"));
		if(photo[0] != "") {
			promembers.setP_photo2(photo[0]);
		}
		System.out.println("배경화면 수정 : " + promembers.toString());
		session.setAttribute("promembers", promembers);
		session.setAttribute("pw", promembers.getP_pw());
		session.setAttribute("email", promembers.getP_email());
		session.setAttribute("name", promembers.getP_name());
		session.setAttribute("nickname",promembers.getP_nickname());
		session.setAttribute("photo",promembers.getP_photo1());
		return modifymemberDao.proadditionUpdate(promembers);
		
	}
	
	/* 파인더 멤버 회원 탈퇴 */
	@Override
	public int finderDropUpdate(HttpServletRequest request, HttpSession session) {
		return modifymemberDao.finderDropUpdate(request.getParameter("f_email"));
	}
	
	/* 프로 멤버 회원 탈퇴 */
	@Override
	public int proDropUpdate(HttpServletRequest request, HttpSession session) {
		return modifymemberDao.proDropUpdate(request.getParameter("f_email"));
	}
	
	/* 파일 첨부 사진 카피 통합 */
	private int copy(String originalFile, String targetFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(originalFile);
			os = new FileOutputStream(targetFile);
			byte[] buff = new byte[1024 * 1024];
			int nRead;
			while ((nRead = is.read(buff)) != -1) {
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (is != null)
					is.close();
				if (os != null)
					os.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
}
