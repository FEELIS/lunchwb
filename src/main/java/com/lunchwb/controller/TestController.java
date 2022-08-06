package com.lunchwb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);

	@RequestMapping("/logger")
	public String root() {
		System.out.println("logger");
		
		logger.trace("/testApi");
		logger.debug("/testApi");
		logger.info("/testApi");
		logger.warn("/testApi");
		logger.error("/testApi");	

		
		return "";
	} 

	@GetMapping("/test")
	public String test() {
		logger.info("test()");
		return "main/test";
	}
}
