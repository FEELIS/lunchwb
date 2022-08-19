package com.lunchwb.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lunchwb.vo.UserVo;


@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/* ----- 메인 접근 --------------------------------------------*/
	@RequestMapping("/")
	public String main(@PathVariable(required = false) Integer voteNo, HttpSession session) {
		logger.info("main");
		
		UserVo loginUser = (UserVo)session.getAttribute("authUser");
		
		
		return "main/index";
	}
	
	@RequestMapping("/404")
	public String error() {
		return "error/404";
	}
	
}
