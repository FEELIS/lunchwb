package com.lunchwb.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.BasketDao;
import com.lunchwb.dao.GroupDao;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.StoreVo;

@Service
public class BasketService {

	@Autowired
	private GroupDao groupDao;
	
	@Autowired
	private BasketDao basketDao;
	
	
	// 초기 로드 시 장바구니 그룹 선택
	public List<GroupVo> getBasketGroup(int userNo) {
		List<GroupVo> basketGroup = null;
		basketGroup = groupDao.selectBasketGroup(userNo);
		
		return basketGroup;
	}
	
	
	// 비회원 새 장바구니 만들기
	public Map<Integer, List<StoreVo>> makeNewbasket() {
		Map<Integer, List<StoreVo>> basket = new HashMap<>();	
		basket.put(0, new ArrayList<>());
						
		return basket;
	}
	
	
	// 비회원 장바구니에 아이템 3개 추가하기
	public List<StoreVo> addGuestBasket(List<StoreVo> basket) {
		List<StoreVo> basketItem = basketDao.guestStoreRecommend();
		
		Calendar cal = Calendar.getInstance();
		int day = (cal.get(Calendar.DAY_OF_WEEK)+5) % 7;
		
		int i = 0;
		
		for (StoreVo store: basketItem) {
			System.out.println(store);
			System.out.println(store.getStoreOpeningHours().get(day).toString());
			if (!basket.contains(store) && !store.getStoreOpeningHours().get(day).toString().equals("휴무일")) {
				basket.add(store);
				i++;
			}
			
			if (i >= 3) break;
		}
		
		return basket;
	}
}
