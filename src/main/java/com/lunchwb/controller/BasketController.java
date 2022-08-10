package com.lunchwb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.service.BasketService;
import com.lunchwb.vo.GPSVo;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.StoreVo;


@RequestMapping("/basket")
@Controller
public class BasketController {
	
	@Autowired
	private BasketService basketService;
	
	private static final Logger logger = LoggerFactory.getLogger(BasketController.class);

	@ResponseBody
	@PostMapping("/getBasketGroup")
	public List<GroupVo> getBasketGroup(@RequestBody int userNo) {
		logger.info("basket group 불러오기");
		
		List<GroupVo> basketGroup = basketService.getBasketGroup(userNo);
		
		return basketGroup;
	}
	                                                                                                                                                                                                                                                                                          
	
	@ResponseBody
	@PostMapping("/guestMakeBasket")
	public Map<Integer, List<StoreVo>> guestMakeBasket(HttpSession session) {
		logger.info("비회원 장바구니 생성하기");
		
		Map<Integer, List<StoreVo>> basket = basketService.makeNewbasket();
		
		session.setAttribute("basket", basket);
		
		return basket;
	}
	
	
	@ResponseBody
	@PostMapping("/setGPS")
	public boolean setGPS(@RequestBody GPSVo gpsVo, HttpSession session) {
		logger.info("GPS 설정하기");
		Boolean result;
		
		if (gpsVo == null) {
			result = false;
			
		} else {
			result = true;
		}
		
		if (session.getAttribute("curr_location") != null) {
			session.removeAttribute("curr_location");
		}
		session.setAttribute("curr_location", gpsVo);
		
		return result;
	}
	
	
	@ResponseBody
	@PostMapping("/makeFilterSession")
	public boolean makeFilterSession(HttpSession session) {
		logger.info("세션 필터 생성");
		List<Integer> filter_excluded = new ArrayList<>();
		
		session.setAttribute("filter_excluded", filter_excluded);
		
		return true;
	}
	
	
	// 필터 모달에서 저장 버튼 눌렀을 때 > 세션에 값 저장
	@ResponseBody
	@PostMapping("/saveFilterSession")
	public boolean saveFilterSession(@RequestBody List<Integer> filter_excluded, HttpSession session) {
		logger.info("세션 필터 저장");
		
		session.setAttribute("filter_excluded", filter_excluded);
		
		return true;
	}

}
