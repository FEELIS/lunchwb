package com.lunchwb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.AloneDao;
import com.lunchwb.vo.AloneVo;

@Service
public class AloneService {
	
	@Autowired
	private AloneDao aloneDao;
	
	public List<AloneVo> reviewList(int userNo) {
		List<AloneVo> reviewList = aloneDao.reviewList(userNo);
		
		return reviewList;
	};
	
	public String delReviewResult(int reviewNo) {
		System.out.println("service: "+ reviewNo);
		
		int count = aloneDao.delReview(reviewNo);
		String result = "";
		
		if (count>0) {
			result = "true";
			
		} else {
			result = "fail";
		}
		
		return result;
	};
	
	

}
