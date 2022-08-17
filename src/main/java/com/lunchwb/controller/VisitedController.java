package com.lunchwb.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.lunchwb.service.VisitedService;
import com.lunchwb.vo.UserVo;

@Controller
public class VisitedController {
	
	@Autowired
	private VisitedService visitedService;
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	/* 실험용메인2 - 리뷰 작성페이지*/
	@GetMapping("/genie/review")
	public String visitedMain(Model model, HttpSession session) {
		logger.info("VisitedController > visitedMain()");
		
		//여기 온 것 자체가 이미 여기갈래요를 했다고 생각할거에요
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		HashMap<String, Object> visitedMap = visitedService.visitedMain(authUser);	
		
		model.addAttribute("visitedMap", visitedMap);
		
		return "/main/visitedMain";
	}
	
	

}
