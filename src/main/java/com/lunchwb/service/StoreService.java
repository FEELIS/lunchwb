package com.lunchwb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.ReportDao;
import com.lunchwb.dao.ReviewDao;
import com.lunchwb.dao.StoreDao;
import com.lunchwb.dao.VisitedDao;
import com.lunchwb.vo.GPSVo;
import com.lunchwb.vo.ReportVo;
import com.lunchwb.vo.ReviewVo;
import com.lunchwb.vo.StoreVo;
import com.lunchwb.vo.UserVo;
import com.lunchwb.vo.VisitedVo;

@Service
public class StoreService {

	@Autowired
	private StoreDao storeDao; 
	@Autowired
	private VisitedDao visitedDao; 
	@Autowired
	private ReviewDao reviewDao; 
	@Autowired
	private ReportDao reportDao;
	
	
	/* 가게 정보 받아오기 */
	public Map<String, Object> storeInfo(int storeNo, UserVo authUser){
		Map<String, Object> storeMap = new HashMap<>();
		
		///////// 기본 정보 //////////////////////////////////////
		StoreVo storeVo = storeDao.basicStoreInfo(storeNo);
		
		//영업시간
		ArrayList<String> openingHours = new ArrayList<String>();   
		JSONArray jsonArray = new JSONArray(storeVo.getStoreOpeningHours());
		if (jsonArray != null) { 
		    int len = jsonArray.length();
			for (int j = 0; j < len; j++){ 
				openingHours.add(jsonArray.get(j).toString());
			} 
		} 

		storeVo.setOpeningHours(openingHours);
		storeVo.setStoreOpeningHours(null);
		
		//휴식시간
		ArrayList<String> breaktime = new ArrayList<String>();   
		jsonArray = new JSONArray(storeVo.getStoreBreaktime());
		if (jsonArray != null) { 
		    int len = jsonArray.length();
			for (int j = 0; j < len; j++){ 
				breaktime.add(jsonArray.get(j).toString());
			} 
		}

		storeVo.setBreaktime(breaktime);
		storeVo.setStoreBreaktime(null);
		
		storeMap.put("storeVo", storeVo);
		
		//////// 가게 선호 정보 ////////////////////////////////////////////
		
		
		/////// 나와 이곳 : visit (방문횟수/최근 방문날짜 그룹) /////////////////
		if(authUser != null) {
			int userNo = authUser.getUserNo();
			
			VisitedVo visitedVo = new VisitedVo();
			visitedVo.setUserNo(userNo);
			visitedVo.setStoreNo(storeNo);
			
			visitedVo = visitedDao.recentVisit(visitedVo);
			storeMap.put("visitedVo", visitedVo);
			System.out.println("visitedVo: " + visitedVo);
		}
		
		//////////////// 최근 리뷰 3건 ///////////////////////////////////
		List<ReviewVo> reviewList = reviewDao.recentReviews(storeNo);
		storeMap.put("reviewList", reviewList);
		
		//최근 리뷰 사진(null 가능이라 따로 최근 3개? - 이거는 리뷰 작성부터.............)
		
		return storeMap;
	}
	
	
	/* 가게와의 거리 표기 */
	public int storeDistance(int storeNo, GPSVo gpsVo) {
		Map<String, Object> map = new HashMap<>();
		map.put("storeNo", storeNo);
		map.put("gpsVo", gpsVo);
		
		int distance = storeDao.storeDistance(map);
		
		return distance;
	}
	
	
	/* 리뷰 신고 */
	public String reviewReport(ReportVo reportVo, UserVo authUser) {
		String result = "fail";

		int userNo = authUser.getUserNo();
		reportVo.setUserNo(userNo);
		
		int count = reportDao.reviewReport(reportVo);
		if(count > 0) {
			result = "success";
		}
		
		return result;
	}
}
