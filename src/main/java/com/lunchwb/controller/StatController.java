package com.lunchwb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/stat")
public class StatController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	
	// ============================================ 캘린더 ============================================
	// -------------------- 달력폼 --------------------
	@GetMapping("/statCalendar")
	public String statCalendarForm() {
		logger.info("StatController > statCalendarForm()");
		
		
		
		
		
		
		
		
	
		return "stat/statCalendar";
	};
	
	
	
	
	// ============================================ 리뷰 ============================================
	// -------------------- 리뷰내역폼 --------------------
	@GetMapping("/reviewList")
	public String reviewListForm() {
		logger.info("StatController > reviewListForm()");
		
		
		
		
		
		
		return "stat/reviewList";
	};
	
	
	
	
	
	
	
	
	
	

	// ============================================ 통계 ============================================
	// -------------------- 통계폼 --------------------
	@GetMapping("/statChart")
	public String statChartForm() {
		logger.info("StatController > statChartForm()");
		
		
		
		
		
		return "stat/statChart";
	};
	
	
	
	
}

