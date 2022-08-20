package com.lunchwb.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
	public String main(@PathVariable(required = false) Integer voteNo, HttpSession session, HttpServletRequest request, Model model) throws UnknownHostException {
		logger.info("MainController");
		
		// 클라이언트 ip 호출
		String clientIp = getClientIp(request);
		logger.info("클라이언트 IP: " + clientIp);
		
		int userState = 0;
		Integer userNo = null;
		
		// 회원 userState 다시 확인
		if (session.getAttribute("authUser") != null) { 
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
		Integer[] stateInfo = userService.mainState(userState, userNo, voteNo, clientIp);
		userState = stateInfo[0];
		voteNo = stateInfo[1];
		logger.info("userState: " + userState);
		
		Map<String, Object> voteAsideData;
		
		switch (userState) {
			case 1:
				voteAsideData = voteService.getVoteAsideData(voteNo);
				model.addAllAttributes(voteAsideData);
				model.addAttribute("clientIp", clientIp);
				
				return "main/vote/voteProgress";
				
			case 2:
				voteAsideData = voteService.getVoteAsideData(voteNo);
				model.addAllAttributes(voteAsideData);
				model.addAttribute("clientIp", clientIp);
				
				return "main/vote/watingVote";
				
			case 3:
				voteAsideData = voteService.getVoteAsideData(voteNo);
				model.addAllAttributes(voteAsideData);
				model.addAttribute("clientIp", clientIp);
				
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
	
	
	// 클라이언트 ip 주소 가져오기
	public static String getClientIp(HttpServletRequest request) throws UnknownHostException {
	    String clientIp = null;
	    boolean isIpInHeader = false;
	    
	    List<String> headerList = new ArrayList<>();
	    headerList.add("X-Forwarded-For");
	    headerList.add("HTTP_CLIENT_IP");
	    headerList.add("HTTP_X_FORWARDED_FOR");
	    headerList.add("HTTP_X_FORWARDED");
	    headerList.add("HTTP_FORWARDED_FOR");
	    headerList.add("HTTP_FORWARDED");
	    headerList.add("Proxy-Client-IP");
	    headerList.add("WL-Proxy-Client-IP");
	    headerList.add("HTTP_VIA");    
	    headerList.add("IPV6_ADR");

	    for (String header : headerList) {
	        clientIp = request.getHeader(header);
	        if (StringUtils.hasText(clientIp) && !clientIp.equals("unknown")) {
	            isIpInHeader = true;
	            break;
	        }
	    }

	    if (!isIpInHeader) {
	        clientIp = request.getRemoteAddr();
	    }
	    
	    if(clientIp.equalsIgnoreCase("0:0:0:0:0:0:0:1")){
	        InetAddress inetAddress = InetAddress.getLocalHost();
	        clientIp = inetAddress.getHostAddress();
	    }

	    return clientIp;
	}
	
}
