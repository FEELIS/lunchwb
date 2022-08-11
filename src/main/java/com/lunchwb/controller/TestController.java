package com.lunchwb.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.lunchwb.api.NaverLoginBo;
import com.lunchwb.service.UserService;
import com.lunchwb.vo.UserVo;

@Controller
public class TestController {
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);

	@Autowired
	private UserService userService;
	@Autowired
	NaverLoginBo naverLoginBo;
	
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
	
	
	/* SNS 로그인 네이버 */
	@RequestMapping(value="/loginNaver",  method = {RequestMethod.GET,RequestMethod.POST})
	public String userNaverLoginPro(Model model,@RequestParam Map<String,Object> paramMap, @RequestParam String code, @RequestParam String state,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBo.getAccessToken(session, code, state);
		//로그인 사용자 정보를 읽어온다.
		String apiResult = naverLoginBo.getUserProfile(oauthToken);
		ObjectMapper objectMapper =new ObjectMapper();
		
		Map<String, Object> apiJson = (Map<String, Object>) objectMapper.readValue(apiResult, Map.class).get("response");
		System.out.println("apiJson =>"+apiJson);
		
		UserVo naverConnectionCheck = userService.naverConnectionCheck(apiJson.get("email"));
		
		if(naverConnectionCheck == null) { //일치하는 이메일 없으면 가입
			model.addAttribute("userEmail",apiJson.get("email"));
			model.addAttribute("snsLogin",apiJson.get("id"));
			return "user/joinFormSNS";
		}else if(naverConnectionCheck.getSnsLogin() == null && naverConnectionCheck.getUserEmail() != null) { //이메일 가입 되어있고 네이버 연동 안되어 있을시
			userService.setNaverConnection(apiJson);
			UserVo loginCheck = userService.naverLogin(apiJson);
			session.setAttribute("authUser", loginCheck);
		}else { //모두 연동 되어있을시
			UserVo loginCheck = userService.naverLogin(apiJson);
			session.setAttribute("authUser", loginCheck);
		}
		
		return "redirect:./";
	}
	
	
	@RequestMapping(value="/joinNaver", method=RequestMethod.POST)
	public String joinNaver(@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
		System.out.println("paramMap:" + paramMap);
		Integer registerCheck = userService.userNaverRegisterPro(paramMap);
		System.out.println(registerCheck);
		
		if(registerCheck != null && registerCheck > 0) {
			UserVo loginCheck = userService.naverLogin(paramMap);
			session.setAttribute("authUser", loginCheck);
		}else {
		}
		return "redirect:./";
	}
	
	
	
	
	
	
}
