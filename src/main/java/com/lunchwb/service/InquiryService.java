package com.lunchwb.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lunchwb.dao.InquiryDao;
import com.lunchwb.vo.InquiryVo;

@Service
public class InquiryService {
	
	@Autowired
	private InquiryDao inquiryDao;
	
	public List<InquiryVo> userInqList(int userNo){
		List<InquiryVo> inqList = inquiryDao.userInqList(userNo);
		
		
		return inqList;
	};
	
	public int writeInquiry(InquiryVo inqVo,MultipartFile file) {
		
		int count = 0;
		
		String saveDir = "C:\\javaStudy\\upload";			//윈도우용
		//String saveDir = "/Users/choijungphil/javaStudy/upload";	//맥OS용
		String orgName = "";
		String saveName = "";

		if (file.getOriginalFilename().equals("")) {	//블로그 타이틀만 바꿀 경우 방지
			System.out.println("이미 미업로드시");
			inqVo.setInquiryFilePath(saveName);

			// (1)다오로 보내서 DB 업데이트
			count = inquiryDao.writeInquiry(inqVo);

		} else {	// 파일업로드 할 때 작용
			// 오리지널 파일명
			orgName = file.getOriginalFilename();
			System.out.println("orgName: " + orgName);

			// 확장자명 가져오기
			String exName = orgName.substring(orgName.lastIndexOf("."));

			// 드라이브에 저장할 파일명
			saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			System.out.println("saveName: " + saveName);

			// 파일경로(디렉토리+저장파일명)
			String filePath = saveDir + "\\" + saveName;			//윈도우용
			//String filePath = saveDir + "/" + saveName;			//맥OS용
			
			inqVo.setInquiryFilePath(saveName);

			// (1)다오로 보내서 DB 업데이트
			count = inquiryDao.writeInquiry(inqVo);

			// (2)파일저장
			try {
				byte[] fileData = file.getBytes();
				OutputStream os = new FileOutputStream(filePath);
				BufferedOutputStream bos = new BufferedOutputStream(os);

				bos.write(fileData);
				bos.close();

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		return count;
	};

}
