package com.tj.profinder.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.profinder.dao.CategoryDao;
import com.tj.profinder.dao.PromembersDao;
import com.tj.profinder.model.Category;
import com.tj.profinder.model.Promembers;
import com.tj.profinder.model.SearchPro;
@Service
public class PromembersServiceImpl implements PromembersService {
	@Autowired
	private CategoryDao cDao;
	@Autowired
	private PromembersDao pDao;

	@Override
	public List<Category> categorySelect() {
		return cDao.categorySelect();
	}

	@Override
	public int promembersConfirmEmail(String p_email) {
		return pDao.promembersConfirmEmail(p_email);
	}
	
	@Override
	public int promembersConfirmNickName(String p_nickname) {
		return pDao.promembersConfirmNickName(p_nickname);
	}
	@Override
	public int promembersInsert(MultipartHttpServletRequest mRequest, HttpSession httpSession) {
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
					System.out.println(idx+"甕곕���� 占쎄�甕곤옙 : "+uploadPath+photo[idx]);
					System.out.println(idx+"甕곕���� 占쏙옙占쎌�� : "+savePath+photo[idx]);
					mFile.transferTo(new File(uploadPath+photo[idx]));
					int result = copy(uploadPath+photo[idx], savePath+photo[idx]);
					System.out.println(result==1? photo[idx]+"占쎈늄嚥≪��釉� 占쎄�占쎌��":photo[idx]+"占쎈늄嚥≪��釉� 筌��녠�占쎌��");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				}catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				photo[0] = "noimg.png";
			}
			idx++;
		} // while
		Promembers promembers = new Promembers();
		promembers.setP_email(mRequest.getParameter("e_email"));
		promembers.setP_pw(mRequest.getParameter("e_pw"));
		promembers.setP_name(mRequest.getParameter("e_name"));
		promembers.setP_tel1(mRequest.getParameter("e_tel1"));
		promembers.setP_tel2(mRequest.getParameter("e_tel2"));
		promembers.setP_tel3(mRequest.getParameter("e_tel3"));
		promembers.setP_accountnum(mRequest.getParameter("e_accountnum"));
		promembers.setP_nickname(mRequest.getParameter("e_nickname"));
		promembers.setP_bank(mRequest.getParameter("e_bank"));
		promembers.setP_area(mRequest.getParameter("e_area"));
		promembers.setP_photo1(photo[0]);
		promembers.setP_message(mRequest.getParameter("e_message"));
		promembers.setP_photo2(photo[1]);
		promembers.setCate_num(Integer.parseInt(mRequest.getParameter("cate_num")));
		httpSession.getAttribute(promembers.getP_email());
		return pDao.promembersInsert(promembers);
	}

	@Override
	public Promembers getPromembers(String p_email) {
		return pDao.getPromembers(p_email);
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
	public void insert100pros() {
		// TODO Auto-generated method stub
		Promembers pro = new Promembers();
		for(int i=1; i<201; i++) {
			pro.setP_email("pro"+i+"@pro.com");
			pro.setP_pw("pw");
			pro.setP_name("PRO"+i);
			pro.setP_nickname("PRO"+i+"Nick");
			pro.setP_tel1("010");
			pro.setP_tel2("1111");
			pro.setP_tel3("1111");
			if(i%5==0)
				pro.setP_area("서울");
			else if(i%5==1)
				pro.setP_area("경기도");
			else if(i%5==2)
				pro.setP_area("충청도");
			else if(i%5==3)
				pro.setP_area("전라도");
			else if(i%5==4)
				pro.setP_area("경상도");
			if(i%8==0)
				pro.setCate_num(1);
			else if(i%8==1)
				pro.setCate_num(2);
			else if(i%8==2)
				pro.setCate_num(3);
			else if(i%8==3)
				pro.setCate_num(4);
			else if(i%8==4)
				pro.setCate_num(5);
			else if(i%8==5)
				pro.setCate_num(6);
			else if(i%8==6)
				pro.setCate_num(7);
			else if(i%8==7)
				pro.setCate_num(8);
			pDao.proInsert(pro);
			System.out.println(i+"th Pro insert success");
		}
	}

	@Override
	public List<Promembers> searchProforSM(SearchPro searchPro) {
		// TODO Auto-generated method stub
		return pDao.searchProforSM(searchPro);
	}

	@Override
	public int searchProforSMCnt(SearchPro searchPro) {
		// TODO Auto-generated method stub
		return pDao.searchProforSMCnt(searchPro);
	}
	
	@Override
	public int getProIDChk(Promembers promembers) {
		int result = 0;
		String pw = promembers.getP_pw();
		int idCnt = pDao.getProIDChk(promembers);
		if(idCnt == 1) {
			Promembers temp = pDao.LoginPro(promembers);
			System.out.println("db비번 : "+temp.getP_pw());
			System.out.println("입력비번 : "+pw);
			if(pw.equals(temp.getP_pw()) || pw == temp.getP_pw()) {
				result = 1;
			}else if(!pw.equals(temp.getP_pw()) || pw != temp.getP_pw()) {
				result = 0;
			}
		}else if(idCnt == 0) {
			result = -1;
		}
		return result;
	}

	@Override
	public Promembers LoginPro(Promembers promembers, HttpServletRequest request) {
		promembers.setP_email(request.getParameter("memberid"));
		return pDao.LoginPro(promembers);
	}

	@Override
	public Promembers proSearchID(Promembers promembers) {
		return pDao.proSearchID(promembers);
	}

	@Override
	public Promembers proSearchPW(Promembers promembers) {
		return pDao.proSearchPW(promembers);
	}

	@Override
	public int contentsPointUp(Promembers promembers) {
		// TODO Auto-generated method stub
		return pDao.contentsPointUp(promembers);
	}



	
	
}
