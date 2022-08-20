package com.lunchwb.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lunchwb.dao.GroupDao;
import com.lunchwb.dao.MenuDao;
import com.lunchwb.dao.ReviewDao;
import com.lunchwb.dao.VisitedDao;
import com.lunchwb.vo.MenuVo;
import com.lunchwb.vo.ReviewVo;
import com.lunchwb.vo.UserVo;
import com.lunchwb.vo.VisitedVo;

@Service
public class VisitedService {
	
	@Autowired
	private VisitedDao vstDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private GroupDao groupDao;
	
	private static final Logger logger = LoggerFactory.getLogger(VisitedService.class);
	
	// ================== 달력에 가게라벨 띄우기 ==================
	public List<VisitedVo> showCalendar(VisitedVo vstVo){
		
		// 현재 연도 가져오기
		String thisYear = vstVo.getSelectMonth().substring(2,4);
		// 현재 몇월인지 가져오기
		int thisMonth = Integer.parseInt(vstVo.getSelectMonth().substring(4).replaceAll(" ",""));
		
		// 연도와 월 합치기용 getDate
		String getDate = "";
		getDate += thisYear;
		
		// 9월 이하 달 앞 '0' 추가 228 => 2208
		if (thisMonth < 10) {
			getDate += "0";
			getDate += Integer.toString(thisMonth);
		} else {
			getDate += Integer.toString(thisMonth);
		}
		// vstVo 연월 자바에서 바꾼 형식으로 넣기(getDate)
		vstVo.setSelectMonth(getDate);
		
		// 오라클 sql문으로 visited 테이블 조회
		List<VisitedVo> calendarList = vstDao.getCalendar(vstVo);
		
		
		
		return calendarList;
	};
	
	
	
	/********************* 여기갈래요 후 리뷰 작성 메인페이지 ***************************/
	public HashMap<String, Object> visitedMain(UserVo authUser) {
		HashMap<String, Object> visitedMap = new HashMap<>();
		
		int userNo = authUser.getUserNo();
		
		//오늘 내가 다녀온 곳의 정보
		VisitedVo visitedVo = vstDao.todayStoreInfo(userNo);
		visitedMap.put("visitedVo", visitedVo);
		
		//가게 최근 리뷰 2건
		int storeNo = visitedVo.getStoreNo();
		List<ReviewVo> reviewList = reviewDao.recentReview(storeNo); 
		visitedMap.put("reviewList", reviewList);
		
		//그룹장 여부 체크
		int groupLeader = groupDao.groupLeader(visitedVo.getGroupNo());
		visitedMap.put("groupLeader", groupLeader);
		
		//나의 방문 정보
		VisitedVo vstVo = new VisitedVo();
		vstVo.setUserNo(userNo);
		vstVo.setStoreNo(storeNo);
		
		VisitedVo relVo = vstDao.storeAndMe(vstVo);
		visitedMap.put("relVo", relVo);
		
		//오늘 리뷰를 했나?
		ReviewVo reviewVo = reviewDao.todayReview(userNo);
		if(reviewVo != null) {
			visitedMap.put("reviewVo", reviewVo);
		}
		
		//리뷰 메뉴리스트
		List<MenuVo> menuList = menuDao.menuList(storeNo);
		visitedMap.put("menuList", menuList);
		
		return visitedMap;
	}
	
	
	/********************** 사진 파일 미리보기 *********************************/
	public String fileUpload(MultipartFile file) {
		
		String saveDir = "C:\\javaStudy\\upload";
		String orgName = file.getOriginalFilename();
		String exName = orgName.substring(orgName.lastIndexOf("."));
		String saveName = System.currentTimeMillis()+UUID.randomUUID().toString()+exName;
		String filePath = saveDir + "\\" + saveName;
		
		try {
			byte[] fileData = file.getBytes();
			OutputStream os = new FileOutputStream(filePath);
			BufferedOutputStream bos = new BufferedOutputStream(os);
			
			bos.write(fileData);
			bos.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return saveName;
	}
	
	
	/********************* 오늘 다녀온 가게 리뷰 작성 ***************************/
	public void addReview(UserVo authUser, ReviewVo reviewVo) {
		//////////////////// visited > 메뉴 기록 /////////////////////////////
		VisitedVo visitedVo = new VisitedVo();
		visitedVo.setVisitedNo(reviewVo.getVisitedNo());
		visitedVo.setMenuNo(reviewVo.getMenuNo());
		
		vstDao.todayMenu(visitedVo);
		
		//////////////////// 리뷰 사진 파일 정리 > 경로 /////////////////////////
		reviewVo.setUserNo(authUser.getUserNo());
		MultipartFile file = reviewVo.getFile();
		
		//다음에 저장 경로 교체 하기
		String saveDir = "C:\\javaStudy\\upload";
		String orgName = file.getOriginalFilename();
		String exName = orgName.substring(orgName.lastIndexOf("."));
		String saveName = System.currentTimeMillis()+UUID.randomUUID().toString()+exName;
		String filePath = saveDir + "\\" + saveName;
		
		reviewVo.setReviewFileName(saveName);
		reviewDao.addReview(reviewVo);
		
	}



}
