package com.lunchwb.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.vo.UserVo;

@Controller
public class RandomController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@GetMapping("/roulette")
	public String roulette() {
		logger.info("/roulette");
		return "main/random/randomRoulette";
	}
	
	@ResponseBody
	@RequestMapping("/randomResult")
	public void randomResult(@RequestBody HashMap<String, Object> storeInfo, HttpSession session) {
		logger.info("/roulette");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		System.out.println("storeInfo = " + storeInfo);
		
		
		
	}
	
}