package com.lunchwb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.GroupDao;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.StoreVo;

@Service
public class BasketService {

	@Autowired
	private GroupDao groupDao;
	
	
	public List<GroupVo> getBasketGroup(int userNo) {
		List<GroupVo> basketGroup = null;
		basketGroup = groupDao.selectBasketGroup(userNo);
		
		return basketGroup;
	}
	
	
	public Map<Integer, List<StoreVo>> makeNewbasket() {
		Map<Integer, List<StoreVo>> basket = new HashMap<>();
		basket.put(0, new ArrayList<>());
		
		return basket;
	}
	
	
	public List<StoreVo> addGuestBasket(List<StoreVo> basket) {
		return basket;
	}
}
