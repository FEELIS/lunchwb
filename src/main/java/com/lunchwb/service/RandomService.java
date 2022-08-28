package com.lunchwb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.RandomDao;
import com.lunchwb.dao.TestDao;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.RandomVo;

@Service
public class RandomService {

	@Autowired
	RandomDao randomDao;
	@Autowired
	TestDao testDao;
	
	public int makeResult(String stopAtValue, String currBasket, String currBasketGroup) {
		System.out.println("**********************************************************************************************************************************************************");
		System.out.println("랜덤 결과 만들기");
		
		RandomVo randomVo = new RandomVo();
		
		
		// 룰렛을 진행한 그룹명 알아내기
		int BasketGroupNo = Integer.parseInt(currBasketGroup);
		GroupVo groupName = testDao.getGroupName(BasketGroupNo);
		randomVo.setGroupName(groupName.getGroupName());
		
		// 결과 각도
		int stopAt = Integer.parseInt(stopAtValue);
		randomVo.setStopAtValue(stopAt);
		

		// 장바구니에 담긴 가게
		JSONArray basketArray = new JSONArray(currBasket);
		randomVo.setStoreInfo(basketArray.toString());
		
		System.out.println(randomVo.toString());
		
		int randomNo = randomDao.insertRandomResult(randomVo);
		
		System.out.println("randomNo = " + randomNo);
		
		
		return randomNo;
	}
}
