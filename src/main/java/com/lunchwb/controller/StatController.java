package com.lunchwb.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.service.VisitedService;
import com.lunchwb.vo.VisitedVo;

@Controller
@RequestMapping(value="/stat")
public class StatController {
	
	@Autowired
	private VisitedService vstService;
	
	private static final Logger logger = LoggerFactory.getLogger(StatController.class);

	
	// ============================================ 캘린더 ============================================
	// =============== 달력폼 ===============
	@GetMapping("/statCalendar")
	public String statCalendarForm() {
		logger.info("StatController > statCalendarForm()");
		
		return "stat/statCalendar";
	};
	
	
	// =============== 달력폼에 방문한 곳 정보가져오기(ajax + json) ===============
	@ResponseBody
	@RequestMapping(value = "/showVstList",method = {RequestMethod.GET,RequestMethod.POST})
	public List<VisitedVo> showVstList(@RequestBody VisitedVo vstVo){
		logger.info("StatController > showVstList()");
		logger.info(vstVo.toString());
		
		List<VisitedVo> vstList = vstService.showCalendar(vstVo);
		logger.info(vstList.toString());
	
		return vstList;
	};
	
	
	
	
	
	// ============================================ 리뷰 ============================================
	
	// =============== 리뷰내역폼 ===============
	@GetMapping("/reviewList")
	public String reviewListForm() {
		logger.info("StatController > reviewListForm()");
		
		
		
		
		
		
		return "stat/reviewList";
	};
	
	
	
	
	
	
	
	
	
	

	// ============================================ 통계 ============================================
	// =============== 통계폼 ===============
	@GetMapping("/statChart")
	public String statChartForm() {
		logger.info("StatController > statChartForm()");
		
		
		
		
		
		return "stat/statChart";
	};
	
	
	
	
}

