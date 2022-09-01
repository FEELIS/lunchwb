package com.lunchwb.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lunchwb.dao.AloneDao;
import com.lunchwb.dao.StatDao;
import com.lunchwb.vo.AloneVo;
import com.lunchwb.vo.StatVo;

@Service
public class StatService {
	
	@Autowired
	private StatDao statDao;
	
	@Autowired
	private AloneDao aloneDao;
	
	private static final Logger logger = LoggerFactory.getLogger(StatService.class);
	
	
	// =============================================== 리뷰관련 ===============================================
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
	
	
	// =============================================== 차트 ===============================================
	// 지난 한달간 음식별 여기갈래요 수 조회
	public Map<String,List<String>> getStatChart(StatVo statVo){
		List<String> menu1stCateNameList = new ArrayList<String>();
		menu1stCateNameList.add(statVo.getMenu1stCateName());
		
		
		
		// 지난 한달간 음식별 여기갈래요 수 조회
		List<StatVo> lastMonthList = statDao.lastMonth();
		// 로그인 한 유저의 그룹간 식사수
		List<StatVo> withGroupList = statDao.withGroup(statVo.getUserNo());
		// 지난 6개월 간 선택한 음식의 인기 조회
		List<StatVo> getFoodHitList = statDao.getFoodHit(statVo.getMenu1stCateName());
		// 지난 6개월 간 선택한 음식의 인기 조회
		List<StatVo> getAgeHitList = statDao.getAgeHit(statVo.getMenu1stCateName());
		
		
		List<String> barLabels = new ArrayList<String>();
		List<String> barData = new ArrayList<String>();
		
		List<String> doughnutLabels = new ArrayList<String>();
		List<String> doughnutData = new ArrayList<String>();
		
		List<String> lineLabels = new ArrayList<String>();
		List<String> lineData = new ArrayList<String>();
		
		List<String> pieLabels = new ArrayList<String>();
		List<String> pieData = new ArrayList<String>();
		
		Map<String,List<String>> lmMap = new HashMap<String,List<String>>();
		
		// JSON.parse() 위해 "\"" 양끝 추가
		// 최근 한 달 음식별 인기
		for (int i = 0; i < lastMonthList.size(); i++) {
			barLabels.add("\""+lastMonthList.get(i).getMenu1stCateName()+"\"");
			barData.add("\""+lastMonthList.get(i).getVisitCount()+"\"");
		}
		
		// 그룹간 식사횟수
		for (int i = 0; i < withGroupList.size(); i++) {
			doughnutLabels.add("\""+withGroupList.get(i).getGroupName()+"\"");
			doughnutData.add("\""+withGroupList.get(i).getVisitCount()+"\"");
		}
		
		// 선택한 음식 6개월간 인기
		for (int i = 0; i < getFoodHitList.size(); i++) {
			if (Integer.parseInt(getFoodHitList.get(i).getVisitedDate())<10) {
				lineLabels.add("\""+getFoodHitList.get(i).getVisitedDate().substring(1)+"월\"");
			} else {
				lineLabels.add("\""+getFoodHitList.get(i).getVisitedDate()+"월\"");
			}
			lineData.add("\""+getFoodHitList.get(i).getVisitCount()+"\"");
		}
		
		// 연령별 인기
		for (int i = 0; i < getAgeHitList.size(); i++) {
			pieLabels.add("\""+getAgeHitList.get(i).getAgeGroup()+"\"");
			logger.info(getAgeHitList.get(i).getAgeGroup());
			pieData.add("\""+getAgeHitList.get(i).getVisitCount()+"\"");
		}
		
		
		
		lmMap.put("menu1stCateName", menu1stCateNameList);
		lmMap.put("barLabels", barLabels);
		lmMap.put("barData", barData);
		lmMap.put("doughnutLabels", doughnutLabels);
		lmMap.put("doughnutData", doughnutData);
		lmMap.put("lineLabels", lineLabels);
		lmMap.put("lineData", lineData);
		lmMap.put("pieLabels", pieLabels);
		lmMap.put("pieData", pieData);
		
		
		logger.info(lmMap.toString());
		
		return lmMap;
	};
	
}
