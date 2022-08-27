package com.lunchwb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.RandomDao;

@Service
public class RandomService {

	@Autowired
	RandomDao randomDao;
	
	
	public int makeResult(String countbas, String basket, String stopAtValue) {
		System.out.println("랜덤 결과 만들기");
		
		
		int randomNo = 0;
		
		
		
		return randomNo;
	}
}
