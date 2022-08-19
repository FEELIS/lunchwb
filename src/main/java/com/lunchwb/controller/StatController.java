package com.lunchwb.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.service.StatService;
import com.lunchwb.service.VisitedService;
import com.lunchwb.vo.StatVo;
import com.lunchwb.vo.VisitedVo;

@Controller
@RequestMapping(value="/stat")
public class StatController {
	
	@Autowired
	private VisitedService vstService;
	
	@Autowired
	private StatService statService;
	

	
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
	
	@PostMapping("/reviewList")
	public String reviewList() {
		logger.info("StatController > reviewList()");
		
		
		
		
		
		
		return "stat/reviewList";
	};
	// =============== 따로갔어요폼 ===============
	@GetMapping("/addAlone")
	public String addAloneForm() {
		logger.info("StatController > addAloneForm()");
		
		
		
		
		
		
		return "stat/addReview";
	};
	
	@PostMapping("/addAlone")
	public String addAlone() {
		logger.info("StatController > addAlone()");
		
		
		
		
		
		
		return "stat/reviewList";
	};
	
	
	
	
	
	
	
	
	
	

	// ============================================ 통계 ============================================
	// =============== 통계폼 ===============
	@GetMapping("/statChart")
	public String statChartForm() {
		logger.info("StatController > statChartForm()");
		
		
		
		return "stat/statChart";
	};
	
	@ResponseBody
	@RequestMapping(value = "/getStatChart", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,List<String>> getStatChart(@RequestBody StatVo statVo){
		logger.info("StatController > getStatChart()");
		Map<String,List<String>> chartMap = statService.getStatChart(statVo.getMenu1stCateName());
		logger.info(chartMap.toString());
		
		
		return chartMap;
	};
	
	
	
	
}

