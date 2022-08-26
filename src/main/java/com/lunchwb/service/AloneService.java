package com.lunchwb.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lunchwb.dao.AloneDao;
import com.lunchwb.vo.AloneVo;

@Service
public class AloneService {
	
	@Autowired
	private AloneDao aloneDao;
	
	public List<AloneVo> reviewList(int userNo) {
		List<AloneVo> reviewList = aloneDao.reviewList(userNo);
		
		return reviewList;
	};
	
	public AloneVo getReview(int reviewNo) {
		AloneVo aloneVo = aloneDao.getReview(reviewNo);
		
		return aloneVo;
	};
	
	public int modifyReview(AloneVo aloneVo,MultipartFile file) {
		
		int count = 0;
		
		String saveDir = "C:\\javaStudy\\upload";				//윈도우용
		//String saveDir = "/Users/choijungphil/javaStudy/upload";	//맥OS용
		String orgName = "";
		String saveName = "";

		if (file.getOriginalFilename().equals("")) {	// 파일 없을 경우
			System.out.println("이미 미업로드시");
			// (1)다오로 보내서 DB 업데이트
			count = aloneDao.updateReview(aloneVo);
			
	
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
			
			aloneVo.setReviewFileName(saveName);
			
			int reviewNo = aloneVo.getReviewNo();
			
			//이전 파일
			String prevFile = saveDir + "\\" + aloneDao.getReview(reviewNo).getReviewFileName();	//윈도우용
			//String prevFile = saveDir + "/" + aloneDao.getReview(reviewNo).getReviewFileName();	//맥OS용
			File deleteFile = new File(prevFile);
			
			// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
			if (deleteFile.exists()) {
				// 파일을 삭제합니다.
				deleteFile.delete();
				System.out.println("파일을 삭제하였습니다.");
			} else {
				System.out.println("파일이 존재하지 않습니다.");
			}
			
	
			// (1)다오로 보내서 DB 업데이트
			count = aloneDao.updateReview(aloneVo);
	
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
	
	
	
	public String delReviewResult(int reviewNo) {
		System.out.println("service: "+ reviewNo);
		
		int count = aloneDao.delReview(reviewNo);
		String result = "";
		
		if (count>0) {
			result = "true";
			
		} else {
			result = "fail";
		}
		
		return result;
	};

}
