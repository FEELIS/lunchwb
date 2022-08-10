package com.lunchwb.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.StoreDao;
import com.lunchwb.vo.UserVo;

@Service
public class StoreService {

	@Autowired
	private StoreDao storeDao; 
	
	
	/* 가게 정보 받아오기 */
	public Map<String, Object> storeInfo(int storeNo, UserVo authUser){
		Map<String, Object> storeMap = new HashMap<>();
		
		storeDao.basicStoreInfo(storeNo);
		
		return storeMap;
	}
}
