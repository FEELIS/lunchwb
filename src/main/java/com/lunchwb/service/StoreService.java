package com.lunchwb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Map<String, Object> storeInfo(int storeNo, UserVo authUser, GPSVo gpsVo){
		Map<String, Object> storeMap = new HashMap<>();
		
		//기본정보
		StoreVo storeVo = storeDao.basicStoreInfo(storeNo);
		
		//영업시간 차후 //타입핸들러 할수있으면 할게요
		Map<String, String> map = storeDao.storeTime(storeNo);
		List<String> openingHours = new ArrayList<>();
		String str = map.get("openingHours");
		str.replace("[", "");		
		str.replace("]", "");
		String[] strA = str.split(",");
		for(int i=0; i<strA.length; i++) {
			openingHours.add(strA[i]);
		}
		storeVo.setOpeningHours(openingHours);
		
		//휴식시간
		List<String> breaktime = new ArrayList<>();
		String str2 = map.get("breaktime");
		str.replace("[", "");		
		str.replace("]", "");
		String[] str2A = str2.split(",");
		for(int i=0; i<str2A.length; i++) {
			breaktime.add(str2A[i]);
		}
		storeVo.setBreaktime(breaktime);
		
		storeMap.put("storeVo", storeVo);
		
		//거리 - storeinfo에 같이 잡아
		
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
	
}
