package com.lunchwb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@GetMapping("/login")
	public String loginForm() {
		/* test */
		return "user/loginForm";
	}
	
	@GetMapping("/join")
	public String joinForm() {
		/* test */
		return "user/joinForm";
	}


}
