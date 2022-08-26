package com.lunchwb.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.service.TestService;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.UserVo;

@RequestMapping("/random")
@Controller
public class RandomController {
	
	@Autowired
	TestService testService;
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@GetMapping("/roulette")
	public String roulette(Model model) {
		
		logger.info("/roulette");
		return "main/random/randomRouletteTest";
	}
	
	@GetMapping(value = {"/", "/{randomNo}"})
	public String randomMain(Model model,
							@PathVariable(required = false) Integer randomeNo) {
		logger.info("/randomMain");
		
		if(randomeNo == null) {
			return "main/random/randomMain";
		}else {
			return "redirect:/lunchwb/random/" + randomeNo;
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/getGroupName")
	public String getGroupName(@RequestBody String groupNo, HttpSession session) {
		logger.info("/getGroupName");
		System.out.println("groupNo = " + groupNo);
		int intGroupNo = Integer.parseInt(groupNo);
		
		System.out.println(intGroupNo);
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		GroupVo nowGroup = testService.getGroupName(intGroupNo);
		
		String groupName = nowGroup.getGroupName();
		System.out.println("groupName = " + groupName);
		return groupName;
	}
	
	@ResponseBody
	@RequestMapping("/randomResult")
	public String randomResult(@RequestBody String groupNo, HttpSession session) {
		logger.info("/randomResult");
		
		int intGroupNo = Integer.parseInt(groupNo);
		System.out.println(intGroupNo);
		
		String result = testService.updateRandomState3(intGroupNo);
		System.out.println("groupNo = " + groupNo);
		System.out.println("result = " + result);
		
		return result;
	}
	
}