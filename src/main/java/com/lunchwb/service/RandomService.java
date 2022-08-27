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
	
	public int makeResult(String countbas, String basket, String stopAtValue, String currBasketGroup) {
		System.out.println("랜덤 결과 만들기");
		
		RandomVo randomVo = new RandomVo();
		
		// 장바구니에 담긴 가게 갯수 ---> 없어도 될듯 basDat.length()에서 해결되는 듯
		int basCount = Integer.parseInt(countbas);
		
		// 그룹명 알아내기
		int currBasket = Integer.parseInt(currBasketGroup);
		GroupVo groupName = testDao.getGroupName(currBasket);
		randomVo.setGroupName(groupName.getGroupName());
		
		// 각도 int화
		int stopAt = Integer.parseInt(stopAtValue);
		randomVo.setStopAtValue(stopAt);
		
		
		// 장바구니에 담긴 가게
		
		JSONArray basketArray = new JSONArray(basket);
		System.out.println(basketArray.toString());
		/*
		 * for(int i=0; i<basDat.length(); i++){ basData = basDat.getJSONObject(i);
		 * String value = basData.getString("storeName");
		 * 
		 * System.out.println("가게 이름 = " + value);
		 * 
		 * storeInfo.add(value); }
		 */
		
//		randomVo.setStoreInfo(storeInfo);
//		
//		System.out.println("basDat = " + basDat);
		System.out.println("basCount = " + basCount);
		System.out.println("currBasket = " + currBasket);
		System.out.println("stopAt = " + stopAt);
		
		int randomNo = randomDao.insertRandomResult(randomVo);
		
		System.out.println("randomNo = " + randomNo);
		
		
		return randomNo;
	}
}
