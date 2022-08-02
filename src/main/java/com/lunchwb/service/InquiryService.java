package com.lunchwb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.InquiryDao;
import com.lunchwb.vo.InquiryVo;

@Service
public class InquiryService {
	
	@Autowired
	private InquiryDao inquiryDao;
	
	public List<InquiryVo> userInqList(int userNo){
		List<InquiryVo> inqList = inquiryDao.userInqList(userNo);
		
		
		return inqList;
	};
	
	public int writeInquiry(InquiryVo inqVo) {
		int count = inquiryDao.writeInquiry(inqVo);
		
		return count;
	};

}
