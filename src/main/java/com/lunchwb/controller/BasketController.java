package com.lunchwb.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.service.BasketService;
import com.lunchwb.vo.GPSVo;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.StoreVo;

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
	                                                                                                                                                                                                                                                                                          
	
	@ResponseBody
	@PostMapping("/basket/guestMakeBasket")
	public List<StoreVo> guestBasket(HttpSession session) {
		logger.info("비회원 장바구니 생성하기");
		
		List<StoreVo> basket = new ArrayList<>();
		basket = basketService.addGuestBasket(basket);
		
		session.setAttribute("basket", basket);
		
		return basket;
	}
	
	
	@ResponseBody
	@PostMapping("/basket/setGPS")
	public boolean setGPS(@RequestBody GPSVo gpsVo, HttpSession session) {
		logger.info("GPS 설정하기");
		Boolean result;
		
		if (gpsVo == null) {
			result = false;
		} else {
			result = true;
		}
		session.setAttribute("curr_location", gpsVo);
		
		return result;
	}

}
