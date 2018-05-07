package com.tj.profinder.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.profinder.dao.CategoryDao;
import com.tj.profinder.dao.FindermembersDao;
import com.tj.profinder.model.Category;
import com.tj.profinder.model.Findermembers;
@Service
public class FindermembersServiceImpl implements FindermembersService {
	@Autowired
	private CategoryDao cDao;
	@Autowired
	private FindermembersDao eDao;
	@Override
	public List<Category> categorySelect() {
		return cDao.categorySelect();
	}
	@Override
	public int findermembersConfirmEmail(String f_email) {
		return eDao.findermembersConfirmEmail(f_email);
	}
	
	@Override
	public int findermembersConfirmNickName(String f_nickname) {
		return eDao.findermembersConfirmNickName(f_nickname);
	}
	@Override
	public int findermembersInsert(MultipartHttpServletRequest mRequest, HttpSession httpSession) {
		String uploadPath = mRequest.getRealPath("profile/");
		String savePath = "D:/teamSource/profinder/src/main/webapp/profile/";
		Iterator<String> iterator = mRequest.getFileNames();
		String[] photo = {"",""};
		int idx = 0;
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originFileName = mFile.getOriginalFilename();
			photo[idx] = originFileName;
			if(photo[idx] != null && !photo[idx].equals("")) {
				if(new File(uploadPath+photo[idx]).exists() || new File(savePath+photo[idx]).exists()){
					photo[idx] = System.currentTimeMillis() + "_" + photo[idx];
				}
				try {
					System.out.println(idx+"서버 저장 : "+uploadPath+photo[idx]);
					System.out.println(idx+" : "+savePath+photo[idx]);
					mFile.transferTo(new File(uploadPath+photo[idx]));
					int result = copy(uploadPath+photo[idx], savePath+photo[idx]);
					System.out.println(result==1? photo[idx]+"占쎈늄嚥≪��釉� 占쎄�占쎌��":photo[idx]+"占쎈늄嚥≪��釉� 筌��녠�占쎌��");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				}catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				photo[0] = "noimg_finder.png";
			}
			idx++;
		} // while
		Findermembers findermembers = new Findermembers();
		findermembers.setF_email(mRequest.getParameter("f_email"));
		findermembers.setF_pw(mRequest.getParameter("f_pw"));
		findermembers.setF_name(mRequest.getParameter("f_name"));
		findermembers.setF_tel1(mRequest.getParameter("f_tel1"));
		findermembers.setF_tel2(mRequest.getParameter("f_tel2"));
		findermembers.setF_tel3(mRequest.getParameter("f_tel3"));
		findermembers.setF_accountnum(mRequest.getParameter("f_accountnum"));
		findermembers.setF_nickname(mRequest.getParameter("f_nickname"));
		findermembers.setF_bank(mRequest.getParameter("f_bank"));
		findermembers.setF_area(mRequest.getParameter("f_area"));
		findermembers.setF_photo1(photo[0]);
		findermembers.setF_message(mRequest.getParameter("f_message"));
		findermembers.setF_photo2(photo[1]);
		httpSession.getAttribute(findermembers.getF_email());
		return eDao.findermembersInsert(findermembers);
	}
	
	
	private int copy(String originalFile, String targetFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os =null;
		try{
			is = new FileInputStream(originalFile);
			os = new FileOutputStream(targetFile);
			byte[] buff = new byte[1024*1024];
			int nRead;
			while((nRead = is.read(buff))!=-1){
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		}catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try{
				if(is!=null) is.close();
				if(os!=null) os.close();
			}catch(IOException e){
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
	@Override
	public void insert100Finders() {
		// TODO Auto-generated method stub
		Findermembers finder = new Findermembers();
		for(int i=1; i<201; i++) {
			finder.setF_email("finder"+i+"@finder.com");
			finder.setF_pw("pw");
			finder.setF_name("FINDER"+i);
			finder.setF_nickname("FINDER"+i+"Nick");
			finder.setF_tel1("010");
			finder.setF_tel2("1234");
			finder.setF_tel3("5678");
			if(i%5==0)
				finder.setF_area("서울");
			else if(i%5==1)
				finder.setF_area("경기도");
			else if(i%5==2)
				finder.setF_area("충청도");
			else if(i%5==3)
				finder.setF_area("전라도");
			else if(i%5==4)
				finder.setF_area("경상도");
			eDao.finderInsert(finder);
			System.out.println(i+"th Finder insert success");
		}
	}	
	@Override
	public Findermembers getFindermember(String f_email) {
		return eDao.getFindermember(f_email);
	}
	@Override
	public int pointUp(Findermembers upPoint) {
		System.out.println("this is FindermemberServiceImpl: "+upPoint);
		return eDao.pointUp(upPoint);
	}
	@Override
	public int getFinderIDChk(Findermembers findermembers) {
		int result = 0;
		String pw = findermembers.getF_pw();
		int idCnt = eDao.getFinderIDChk(findermembers);
		System.out.println("idCnt : "+findermembers);
		System.out.println("idCnt : "+idCnt);
		if(idCnt == 1) {
			Findermembers temp = eDao.loginFinder(findermembers);
			System.out.println("db비번 : "+temp.getF_pw());
			System.out.println("입력비번 : "+pw);
			if(pw.equals(temp.getF_pw()) || pw == temp.getF_pw()) {
				result = 1;
			}else if(!pw.equals(temp.getF_pw()) || pw != temp.getF_pw()) {
				result = 0;
			}
		}else if(idCnt == 0) {
			result = -1;
		}
		return result;
	}
	@Override
	public Findermembers loginFinder(Findermembers findermembers, HttpServletRequest request) {
		findermembers.setF_email(request.getParameter("memberid"));
		return eDao.loginFinder(findermembers);
	}
	@Override
	public Findermembers finderSearchID(Findermembers findermembers) {
		return eDao.finderSearchID(findermembers);
	}
	@Override
	public Findermembers finderSearchPW(Findermembers findermembers) {
		return eDao.finderSearchPW(findermembers);
	}	
	@Override
	public int cotnentsDownload(Findermembers findermembers) {
		// TODO Auto-generated method stub
		return eDao.cotnentsDownload(findermembers);
	}

}
