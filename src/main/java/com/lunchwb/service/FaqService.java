package com.lunchwb.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.dao.FaqDao;
import com.lunchwb.vo.FaqVo;

@Repository
public class FaqService {
	
	@Autowired
	private FaqDao faqDao;
	
	public Map<String,Object> divFaqList(){
		
		List<FaqVo> faqList = faqDao.faqList();
		
		
		List<FaqVo> faqQuestList = new ArrayList<FaqVo>();
		List<FaqVo> faqHelpList = new ArrayList<FaqVo>();
		
		
		for (int i = 0; i < faqList.size(); i++) {
			if (faqList.get(i).getFaqStatus().equals("help")) {
				faqHelpList.add(faqList.get(i));
			} else if(faqList.get(i).getFaqStatus().equals("quest")){
				faqQuestList.add(faqList.get(i));
			}
		};
		
		Map<String, Object> fMap = new HashMap<String,Object>();
		fMap.put("qList", faqQuestList);
		fMap.put("hList", faqHelpList);
		
		return fMap;
	};

}
