package com.lunchwb.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lunchwb.service.UserService;
import com.lunchwb.vo.UserVo;


@Controller
public class MainController {
	
	@Autowired
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/* ----- 메인 접근 --------------------------------------------*/
	@RequestMapping(value = {"/", "/{voteNo}"})
	public String main(@PathVariable(required = false) Integer voteNo, HttpSession session) {
		logger.info("MainController");
		
		int userState = 0;
		Integer userNo = null;
		
		if (session.getAttribute("authUser") != null) { // 회원 userState 다시 확인
			UserVo loginUser = (UserVo)session.getAttribute("authUser");
			userNo = loginUser.getUserNo();
			
			logger.info("회원: " + loginUser.getUserNo() + "번, " + loginUser.getUserName());
			int checkState = userService.checkUserState(userNo);
			
			if (checkState != loginUser.getUserState()) {
				loginUser.setUserState(checkState);
				session.setAttribute("authUser", loginUser);
			}
			userState = loginUser.getUserState();
			
		} else {
			logger.info("비회원");
			
		}
		
		// 어느 페이지 로드할 지 결정
		userState = userService.mainState(userState, userNo, voteNo);
		logger.info("userState: " + userState);
		
		switch (userState) {
			case 1:
				return "main/vote/voteProgress";
				
			case 2:
				return "main/vote/watingVote";
				
			case 3:
				return "main/vote/voteResult";
				
			case 4:
				return "redirect:/visited";
				
			case 403:
				return "error/403";
				
			case 404:
				return "error/404";
				
			default:
				return "main/index";
		}
	}
	
}
