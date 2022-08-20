package com.lunchwb.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lunchwb.service.UserService;
import com.lunchwb.service.VisitedService;
import com.lunchwb.service.VoteService;
import com.lunchwb.vo.UserVo;


@Controller
public class MainController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private VisitedService visitedService;
	@Autowired
	private VoteService voteService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/* ----- 메인 접근 --------------------------------------------*/
	@RequestMapping(value = {"/", "/{voteNo}"})
	public String main(@PathVariable(required = false) Integer voteNo, HttpSession session, Model model) {
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
		Integer[] stateInfo = userService.mainState(userState, userNo, voteNo);
		userState = stateInfo[0];
		voteNo = stateInfo[1];
		logger.info("userState: " + userState);
		
		Map<String, Object> voteAsideData;
		
		switch (userState) {
			case 1:
				voteAsideData = voteService.getVoteAsideData(voteNo);
				model.addAllAttributes(voteAsideData);
				
				return "main/vote/voteProgress";
				
			case 2:
				voteAsideData = voteService.getVoteAsideData(voteNo);
				model.addAllAttributes(voteAsideData);
				
				return "main/vote/watingVote";
				
			case 3:
				voteAsideData = voteService.getVoteAsideData(voteNo);
				model.addAllAttributes(voteAsideData);
				
				return "main/vote/voteResult";
				
			case 4:
				HashMap<String, Object> visitedMap = visitedService.visitedMain((UserVo)session.getAttribute("authUser"));	
				model.addAttribute("visitedMap", visitedMap);
				return "main/visitedMain";
				
			case 403:
				return "error/403";
				
			case 404:
				return "error/404";
				
			default:
				return "main/index";
		}
	}
	
}
