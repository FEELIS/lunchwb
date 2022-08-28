package com.lunchwb.service;

import org.json.JSONArray;
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
	
	// 랜덤 결과 저장하기
	public int makeResult(int stopAtValue, String currBasket, int currBasketGroup, int creatorUserNo) {
		System.out.println("**********************************************************************************************************************************************************");
		System.out.println("랜덤 결과 저장하기");
		///////////////////////////////////////// 조회 /////////////////////////////////////////

		RandomVo checkRandomVo = randomDao.checkRandomResult(creatorUserNo);
		System.out.println("기존의 랜덤 결과를 조회합니다 : " + checkRandomVo);
		
		///////////////////////////////////////// 삭제 /////////////////////////////////////////
		if(checkRandomVo != null) {
			randomDao.deleteRandomResult(creatorUserNo);
		}
		
		///////////////////////////////////////// 생성 /////////////////////////////////////////		
		RandomVo randomVo = new RandomVo();
		
		// 룰렛을 진행한 그룹명 알아내기
		GroupVo groupName = testDao.getGroupName(currBasketGroup);
		randomVo.setGroupName(groupName.getGroupName());
		
		// 결과 각도
		randomVo.setStopAtValue(stopAtValue);
		

		// 장바구니에 담긴 가게
		JSONArray basketArray = new JSONArray(currBasket);
		randomVo.setStoreInfo(basketArray.toString());
		
		// 랜덤 돌린 유저
		randomVo.setUserNo(creatorUserNo);
		
		System.out.println(randomVo.toString());
		
		int randomNo = randomDao.insertRandomResult(randomVo);
		
		System.out.println("randomNo = " + randomNo);
		
		
		return randomNo;
	}
	
	// 랜덤 결과 조회 (저장된 랜덤 정보가 있는지 randomNo로 확인)
	public RandomVo checkRandomResult(int userNo) {
		RandomVo randomVo = randomDao.checkRandomResult(userNo);
		return randomVo;
	}
	
	// 랜덤 정보 조회 (jsp사용을 위한 정보 추출)
	public RandomVo checkAllRandomResult(int randomNo) {
		RandomVo checkAllRandomResult = randomDao.checkAllRandomResult(randomNo);
		return checkAllRandomResult;
	}
}
