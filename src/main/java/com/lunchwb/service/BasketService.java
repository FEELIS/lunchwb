package com.lunchwb.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.BasketDao;
import com.lunchwb.dao.GroupDao;
import com.lunchwb.vo.GPSVo;
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
	
	// 회원 새 장바구니 만들기
		public Map<Integer, List<StoreVo>> makeNewbasket(List<Integer> basketGroup) {
			Map<Integer, List<StoreVo>> basket = new HashMap<>();	
			
			for (Integer groupNo: basketGroup) {
				basket.put(groupNo, new ArrayList<>());
			}
			
			return basket;
		}
	
	
	// 장바구니에 아이템 3개 추가하기
	public List<StoreVo> addItemsToBasket(List<StoreVo> basket, Integer groupNo, GPSVo curr_location, List<Integer> filter_excluded, boolean firstTime, boolean user) {
		Map<String, Object> basketInput = new HashMap<>();
		basketInput.put("basket", basket);
		basketInput.put("curr_location", curr_location);
		//basketInput.put("curr_location", new GPSVo(126.9520316, 37.4810793, ""));
		basketInput.put("filter_excluded", filter_excluded);
		basketInput.put("groupNo", groupNo);
		
		List<StoreVo> basketItem = null;
		if (user) {
			if (groupNo == 0) {
				// 바꿔야함
				basketItem = basketDao.guestStoreRecommend(basketInput);
				
			} else {
				basketItem = basketDao.groupStoreRecommend(basketInput);
			}
			
		} else {
			basketItem = basketDao.guestStoreRecommend(basketInput);
		}
		
		Calendar cal = Calendar.getInstance();
		int day = (cal.get(Calendar.DAY_OF_WEEK)+5) % 7;
		
		int i = 0;
		
		for (StoreVo store: basketItem) {
			ArrayList<String> opening = new ArrayList<String>();   
			JSONArray jsonArray = new JSONArray(store.getStoreOpeningHours());
			if (jsonArray != null) { 
			    int len = jsonArray.length();
				for (int j = 0; j < len; j++){ 
					opening.add(jsonArray.get(j).toString());
				} 
			} 
			
			ArrayList<String> breakTime = new ArrayList<String>();   
			jsonArray = new JSONArray(store.getStoreOpeningHours());
			if (jsonArray != null) { 
			    int len = jsonArray.length();
				for (int j = 0; j < len; j++){ 
					breakTime.add(jsonArray.get(j).toString());
				} 
			}

			store.setOpeningHours(opening);
			store.setBreaktime(breakTime);
			store.setStoreBreaktime(null);
			store.setStoreOpeningHours(null);
			
			String today = jsonArray.get(day).toString();
			System.out.println(store.getStoreName() + " 가게 오늘 영업시간: " + today);
			
			String time = "00";
			if (today.contains("~")) {
				time = today.substring(0, today.indexOf(":"));
			}
						
			if (!today.equals("휴무일") && Integer.parseInt(time) <= 12) {
				if (firstTime) {
					store.setStored(true);
				} else {
					store.setStored(false);
				}
				basket.add(store);
				System.out.print("장바구니 담음 ");
				System.out.println(store);
				i++;
			}
			if (i >= 3 || basket.size() >= 15) break;
		}
		
		return basket;
	}
	
	
	// 장바구니에서 아이템 삭제
	public List<StoreVo> deleteBasket(List<StoreVo> basketItems, Integer storeNo) {
		for (StoreVo store: basketItems) {
			if (store.getStoreNo() == storeNo) {
				store.setStored(false);
				break;
			}
		}

		return basketItems;
	}
	
	
	// 장바구니에 아이템 추가
	public List<StoreVo> addBasket(List<StoreVo> basketItems, Integer storeNo) {
		for (StoreVo store: basketItems) {
			if (store.getStoreNo() == storeNo) {
				store.setStored(true);
				break;
			}
		}

		return basketItems;
	}
}