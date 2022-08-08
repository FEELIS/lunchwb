package com.lunchwb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.GroupDao;
import com.lunchwb.vo.GroupVo;

@Service
public class BasketService {

	@Autowired
	private GroupDao groupDao;
	
	
	public List<GroupVo> getBasketGroup(int userNo) {
		List<GroupVo> basketGroup = null;
		basketGroup = groupDao.selectBasketGroup(userNo);
		
		return basketGroup;
	}
}
