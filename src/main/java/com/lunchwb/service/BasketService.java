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
	
	
	public List<GroupVo> getBasketGroup(int userNo) {
		List<GroupVo> basketGroup = null;
		basketGroup = groupDao.selectBasketGroup(userNo);
		
		return basketGroup;
	}
	
	
	public Map<Integer, List<StoreVo>> makeNewbasket() {
		Map<Integer, List<StoreVo>> basket = new HashMap<>();	
		basket.put(0, new ArrayList<>());
		
		List<StoreVo> basketItems = basketDao.guestStoreRecommend();
		basket.put(0, addGuestBasket(basket.get(0), basketItems));
				
		return basket;
	}
	
	
	public List<StoreVo> addGuestBasket(List<StoreVo> basket, List<StoreVo> basketItem) {
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
