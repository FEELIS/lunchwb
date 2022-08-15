package com.lunchwb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.ReviewDao;
import com.lunchwb.dao.StoreDao;
import com.lunchwb.dao.VisitedDao;
import com.lunchwb.vo.GPSVo;
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
	
	
	/* 가게 정보 받아오기 */
	public Map<String, Object> storeInfo(int storeNo, UserVo authUser){
		Map<String, Object> storeMap = new HashMap<>();
		
		//기본정보
		StoreVo storeVo = storeDao.basicStoreInfo(storeNo);
		
		//영업시간
		/*
		 * List<String> openingHours = new ArrayList<>(); String storeOpeingHours =
		 * storeVo.getStoreOpeningHours(); storeOpeingHours.replace("[", "");
		 * storeOpeingHours.replace("]", ""); String[] strA =
		 * storeOpeingHours.split(","); for(int i=0; i<strA.length; i++) {
		 * openingHours.add(strA[i]); }
		 */
		ArrayList<String> openingHours = new ArrayList<String>();   
		JSONArray jsonArray = new JSONArray(storeVo.getStoreOpeningHours());
		if (jsonArray != null) { 
		    int len = jsonArray.length();
			for (int j = 0; j < len; j++){ 
				openingHours.add(jsonArray.get(j).toString());
			} 
		} 
		//리스트 저장
		storeVo.setOpeningHours(openingHours);
		storeVo.setStoreOpeningHours(null);
		
		//휴식시간
		/*
		List<String> breaktime = new ArrayList<>();
		String storeBreaktime = storeVo.getStoreBreaktime();
		storeBreaktime.replace("[", "");		
		storeBreaktime.replace("]", "");
		System.out.println(storeBreaktime);
		String[] str2A = storeBreaktime.split(",");
		for(int i=0; i<str2A.length; i++) {
			breaktime.add(str2A[i]);
		}
		*/
		ArrayList<String> breaktime = new ArrayList<String>();   
		jsonArray = new JSONArray(storeVo.getStoreBreaktime());
		if (jsonArray != null) { 
		    int len = jsonArray.length();
			for (int j = 0; j < len; j++){ 
				breaktime.add(jsonArray.get(j).toString());
			} 
		}
		//리스트 저장
		storeVo.setBreaktime(breaktime);
		storeVo.setStoreBreaktime(null);
		
		storeMap.put("storeVo", storeVo);
		
		//거리 - storeinfo에 같이 잡아 > 또 까먹었네 stat에서 열어야하니까 추천할때만 거리 보여주기로 했자너.. 바보야
		
		//나와 이곳 : visit (방문횟수/최근 방문날짜 그룹)
		if(authUser != null) {
			int userNo = authUser.getUserNo();
			
			VisitedVo visitedVo = new VisitedVo();
			visitedVo.setUserNo(userNo);
			visitedVo.setUserNo(storeNo);
			
			visitedVo = visitedDao.recentVisit(visitedVo);
			storeMap.put("visitedVo", visitedVo);
		}
		
		//최근 리뷰 3건
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
	
}
