package com.lunchwb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RandomController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@GetMapping("/roulette")
	public String roulette() {
		logger.info("/roulette");
		return "main/random/randomRoulette";
	}
	
	
	
}