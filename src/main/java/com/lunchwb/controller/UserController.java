package com.lunchwb.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.lunchwb.service.UserService;
import com.lunchwb.vo.UserVo;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@GetMapping("/login")
	public String loginForm() {
		logger.info("user > loginForm()");
		return "user/loginForm";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute UserVo userVo, HttpSession session) {
		logger.info("user > login()");
		UserVo authUser = userService.login(userVo);
		
		if(authUser != null) {
			session.setAttribute("authUser", authUser);
			return "redirect:./";
		}else {
			return "redirect:./login?result=fail";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("user > logout()");
		session.removeAttribute("authUser");
		session.invalidate();
		return "redirect:./";
		
	}
	
	@GetMapping("/join")
	public String joinForm() {
		logger.info("user > joinForm()");
		
		return "user/joinForm";
	}


}
