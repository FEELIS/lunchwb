package com.lunchwb.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lunchwb.service.VisitedService;
import com.lunchwb.vo.ReviewVo;
import com.lunchwb.vo.UserVo;

@RequestMapping("/visited")
@Controller
public class VisitedController {
	
	@Autowired
	private VisitedService visitedService;
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	/* 실험용메인2 - 리뷰 작성페이지*/
	/* 나중에 도메인 /review or /visited 로 바꿀 예정 */
	@GetMapping("/")
	public String visitedMain(Model model, HttpSession session) {
		logger.info("VisitedController > visitedMain()");
		
		//여기 온 것 자체가 이미 여기갈래요를 했다고 생각할거지만 주소로 들어온다면
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		if(authUser.getUserState() < 4 ) {
			return "redirect: /";
		}
		
		HashMap<String, Object> visitedMap = visitedService.visitedMain(authUser);	
		
		model.addAttribute("visitedMap", visitedMap);
		
		return "/main/visitedMain";
	}
	
	
	/* 리뷰 작성 */
	@PostMapping("/review/upload")
	public String addReview(HttpSession session, ReviewVo reviewVo) {
		logger.info("VisitedController > addReview()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		visitedService.addReview(authUser, reviewVo);
		
		return "redirect:/";
	}
	
	

}
