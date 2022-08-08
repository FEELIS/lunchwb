package com.lunchwb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/* ----- 메인 접근 --------------------------------------------*/
	@GetMapping("/")
	public String Main() {
		logger.info("main");
		
		return "main/index";
	}
	
}
