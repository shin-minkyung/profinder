package com.tj.profinder.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.profinder.dao.ContentsDao;
import com.tj.profinder.model.Contents;
@Service
public class ContentsServiceImpl implements ContentsService {
	@Autowired
	private ContentsDao contentsDao;
	private String savePath = "D:/teamSource/profinder/src/main/webapp/profile/";
	@Override
	public int contentsInsert(MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("contentsFile/");
		Contents contents = new Contents();
		String[] con_file = {null,null,null};
		int idx = 0;
		Iterator<String> iterator = mRequest.getFileNames();
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);//실제파일 받는다
			String originFileName = mFile.getOriginalFilename();
			con_file[idx] = originFileName;
			if(con_file[idx]!=null && !con_file[idx].equals("")) {
				if(new File(uploadPath+con_file[idx]).exists()||new File(savePath+con_file[idx]).exists()) {
					con_file[idx] = System.currentTimeMillis()+"_"+con_file[idx];
				}
				try {
					System.out.println(idx+"번째 서버"+uploadPath+con_file[idx]);
					System.out.println(idx+"번째 저장"+savePath+con_file[idx]);
					mFile.transferTo(new File(uploadPath+con_file[idx]));
					copy(uploadPath+con_file[idx],savePath+con_file[idx]);
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}else {
				con_file[idx] = "파일없음";
			}
			idx++;
		}
		contents.setCate_num(Integer.parseInt(mRequest.getParameter("cate_num")));
		contents.setCon_title(mRequest.getParameter("con_title"));
		contents.setCon_content(mRequest.getParameter("con_content"));
		contents.setCon_file1(con_file[0]);
		contents.setCon_file2(con_file[1]);
		contents.setCon_file3(con_file[2]);
		int price1 = Integer.parseInt(mRequest.getParameter("con_price1"));
		int price2 = Integer.parseInt(mRequest.getParameter("con_price2"));
		int price3 = Integer.parseInt(mRequest.getParameter("con_price3"));
		int con_price = price1+price2+price3;
		contents.setCon_price(con_price);
		contents.setP_email(mRequest.getParameter("p_email"));
		System.out.println(contents);
		return contentsDao.contentsInsert(contents);
	}

	private int copy(String originalFile, String taragetFile) {
		// TODO Auto-generated method stub
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(originalFile);
			os = new FileOutputStream(taragetFile);
			byte[] buff = new byte[1024*1024];
			int nRead;
			while((nRead = is.read(buff))!=-1) {
				os.write(buff,0,nRead);
			}
			isCopy=1;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(is!=null) {
					is.close();
				}
				if(os!=null) {
					os.close();
				}
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

	@Override
	public List<Contents> contentsList(String p_email) {
		// TODO Auto-generated method stub
		return contentsDao.contentsList(p_email);
	}

	@Override
	public String contentsNowNum() {
		// TODO Auto-generated method stub
		return contentsDao.contentsNowNum();
	}

	@Override
	public void contentsAutoInsert() {
		// TODO Auto-generated method stub
		Contents contents = new Contents();
		for(int i=1; i<201; i++) {
			contents.setP_email("pro"+i+"@pro.com");
			contents.setCon_title("Contents"+i+"' Title");
			contents.setCon_content("Contents"+i+"' Content");
			switch(i%5) {
			case 0:
				contents.setCon_file1("contents"+i+".jpg");
				contents.setCon_file2("contents"+i+".png");
				contents.setCon_file3("contents"+i+".bmp");
				break;
			case 1:
				contents.setCon_file1("contents"+i+".hwp");
				contents.setCon_file1("contents"+i+".txt");
				break;
			case 2:
				contents.setCon_file1("contents"+i+".zip");
				break;
			case 3:
				contents.setCon_file1("contents"+i+".pdf");
				break;
			case 4:
				contents.setCon_file1("contents"+i+".docx");
				break;			
			}
			
			switch (i%3) {
			case 0:
				contents.setCon_price(10000);
				break;
			case 1:
				contents.setCon_price(8000);
				break;
			case 2:
				contents.setCon_price(6000);
				break;
			}
			
			switch (i%8) {
			case 0:
				contents.setCate_num(1);
				break;
			case 1:
				contents.setCate_num(2);
				break;
			case 2:
				contents.setCate_num(3);
				break;
			case 3:
				contents.setCate_num(4);
				break;
			case 4:
				contents.setCate_num(5);
				break;
			case 5:
				contents.setCate_num(6);
				break;
			case 6:
				contents.setCate_num(7);
				break;
			case 7:
				contents.setCate_num(8);
				break;
			}			
			contents.setCon_download(1000-i);
			contentsDao.contentsAutoInsert(contents);			
			System.out.println(i+"th Conetents Insert Success");			
		}		
	}

	@Override
	public List<Contents> eduContentsList(Contents rows) {
		// TODO Auto-generated method stub
		return contentsDao.eduContentsListforSearchmain(rows);
	}

	@Override
	public List<Contents> topEduCon6() {
		// TODO Auto-generated method stub
		return contentsDao.topEduCon6();
	}

	@Override
	public List<Contents> topBizCon(Contents rows) {
		// TODO Auto-generated method stub
		return contentsDao.topBizCon(rows);
	}

	@Override
	public List<Contents> topContents(Contents rowscate) {
		// TODO Auto-generated method stub
		return contentsDao.topContents(rowscate);
	}

	@Override
	public int totalContents() {
		// TODO Auto-generated method stub
		return contentsDao.totalContents();
	}

	@Override
	public List<Contents> allContentsList(Contents rows) {
		// TODO Auto-generated method stub
		return contentsDao.allContentslist(rows);
	}

	@Override
	public Contents getContents(String con_num) {
		// TODO Auto-generated method stub
		return contentsDao.getContents(con_num);
	}

	@Override
	public List<Contents> searchContents(Contents searchWord) {
		// TODO Auto-generated method stub
		return contentsDao.searchContents(searchWord);
	}

	@Override
	public int searchedConCnt(Contents searchWord) {
		// TODO Auto-generated method stub
		return contentsDao.searchConCnt(searchWord);
	}

	@Override
	public Contents contentsMainBanner(String con_num) {
		// TODO Auto-generated method stub
		return contentsDao.contentsMainBanner(con_num);
	}

	@Override
	public int contentsLikeCnt(String con_num) {
		// TODO Auto-generated method stub
		return contentsDao.contentsLikeCnt(con_num);
	}

	@Override
	public int contentsDownloadUp(String con_num) {
		// TODO Auto-generated method stub
		return contentsDao.contentsDownloadUp(con_num);
	}

}
