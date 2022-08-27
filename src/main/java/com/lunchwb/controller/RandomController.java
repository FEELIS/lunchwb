package com.lunchwb.controller;

import java.util.Map;

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

import com.lunchwb.service.RandomService;
import com.lunchwb.service.TestService;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.UserVo;

@RequestMapping("/random")
@Controller
public class RandomController {
	
	@Autowired
	TestService testService;
	@Autowired
	RandomService randomService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@GetMapping("/roulette")
	public String roulette(Model model) {
		
		logger.info("/roulette");
		return "main/random/randomRouletteTest";
	}
	
	@RequestMapping(value = {"", "/{randomNo}"})
	public String randomMain(Model model,
							@PathVariable(required = false, name = "randomNo") Integer randomNo) {
		logger.info("/randomMain");
		
		if(randomNo == null) {
			return "main/random/randomMain";
		}else {
			return "redirect:/random/" + randomNo;
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
	
	@ResponseBody
	@RequestMapping("/makeRandomResult")
	public int randomResult(@RequestBody Map<String, String> randomData, HttpSession session) {
		System.out.println("랜덤 정보 = " + randomData);
		
		String countbas = randomData.get("countbas");
		String basket = randomData.get("basket");
		String stopAtValue = randomData.get("stopAt");
		String currBasketGroup = randomData.get("currBasket");
		// + groupNO 보내야함. 그룹 이름 따야함.
		
		
		System.out.println("장바구시 가게 숫자 = " + countbas);
		System.out.println("가게정보 = " + basket);
		System.out.println("룰렛 각도 = " + stopAtValue);
		System.out.println("현재 장바구니 그룹 = " + currBasketGroup);
		
		UserVo loginUser = (UserVo)session.getAttribute("authUser");
		
		int randomNo = 0;
		if (loginUser != null) {
			randomNo = randomService.makeResult(countbas, basket, stopAtValue, currBasketGroup);
		}
		
		
		return randomNo;
	}
	
}