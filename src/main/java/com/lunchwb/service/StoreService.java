package com.lunchwb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.StoreDao;
import com.lunchwb.dao.VisitedDao;
import com.lunchwb.vo.GPSVo;
import com.lunchwb.vo.StoreVo;
import com.lunchwb.vo.UserVo;
import com.lunchwb.vo.VisitedVo;

@Service
public class StoreService {

	@Autowired
	private StoreDao storeDao; 
	@Autowired
	private VisitedDao visitedDao; 
	
	
	/* 가게 정보 받아오기 */
	public Map<String, Object> storeInfo(int storeNo, UserVo authUser, GPSVo gpsVo){
		Map<String, Object> storeMap = new HashMap<>();
		
		//기본정보
		StoreVo storeVo = storeDao.basicStoreInfo(storeNo);
		
		//영업시간 차후 //타입핸들러 건드리겠습니다 
		Map<String, String> map = storeDao.storeTime(storeNo);
		List<String> storeOpeningHours = new ArrayList<>();
		String str = map.get("storeOpeningHours");
		str.replace("[", "");		
		str.replace("]", "");
		String[] strA = str.split(",");
		for(int i=0; i<strA.length; i++) {
			storeOpeningHours.add(strA[i]);
		}
		storeVo.setStoreOpeningHours(storeOpeningHours);
		
		//휴식시간
		List<String> storeBreaktime = new ArrayList<>();
		String str2 = map.get("storeBreaktime");
		str.replace("[", "");		
		str.replace("]", "");
		String[] str2A = str2.split(",");
		for(int i=0; i<str2A.length; i++) {
			storeBreaktime.add(str2A[i]);
		}
		storeVo.setStoreBreaktime(storeBreaktime);
		
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
		
		
		
		
		return storeMap;
	}
	
}
