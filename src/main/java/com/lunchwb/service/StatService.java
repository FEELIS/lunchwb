package com.lunchwb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.StatDao;
import com.lunchwb.vo.StatVo;

@Service
public class StatService {
	
	@Autowired
	private StatDao statDao;
	
	private static final Logger logger = LoggerFactory.getLogger(StatService.class);
	
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
