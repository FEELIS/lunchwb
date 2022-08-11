package com.lunchwb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.VisitedDao;
import com.lunchwb.vo.VisitedVo;

@Service
public class VisitedService {
	
	@Autowired
	private VisitedDao vstDao;
	
	public List<VisitedVo> showCalendar(VisitedVo vstVo){
		
		String thisYear = vstVo.getSelectMonth().substring(2,4);
		int thisMonth = Integer.parseInt(vstVo.getSelectMonth().substring(4).replaceAll(" ",""));
		
		String getDate = "";
		getDate += thisYear;
		
		if (thisMonth < 10) {
			getDate += "0";
			getDate += Integer.toString(thisMonth);
			
		} else {
			getDate += Integer.toString(thisMonth);
		}
		
		vstVo.setSelectMonth(getDate);
		
		List<VisitedVo> calendarList = vstDao.getCalendar(vstVo);
		
		
		return calendarList;
	};


}
