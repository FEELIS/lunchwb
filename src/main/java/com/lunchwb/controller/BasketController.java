package com.lunchwb.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.service.BasketService;
import com.lunchwb.vo.GroupVo;

@Controller
public class BasketController {
	
	@Autowired
	private BasketService basketService;
	
	private static final Logger logger = LoggerFactory.getLogger(BasketController.class);

	@ResponseBody
	@PostMapping("/basket/getBasketGroup")
	public List<GroupVo> getBasketGroup(@RequestBody int userNo) {
		logger.info("basket group 불러오기");
		
		List<GroupVo> basketGroup = basketService.getBasketGroup(userNo);
		
		return basketGroup;
	}

}
