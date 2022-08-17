package com.lunchwb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.lunchwb.service.VisitedService;

@Controller
public class VisitedController {
	
	@Autowired
	private VisitedService visitedService;
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	/* 실험용메인2 - 리뷰 작성페이지*/
	@GetMapping("/genie/review")
	public String RevivewMain() {
		return "/main/visitedMain";
	}
	
	

}
