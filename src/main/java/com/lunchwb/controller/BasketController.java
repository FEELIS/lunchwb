package com.lunchwb.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
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

	// 로그인 회원 장바구니 그룹 목록 가져오기
	@ResponseBody
	@PostMapping("/getBasketGroup")
	public List<GroupVo> getBasketGroup(@RequestBody int userNo) {
		logger.info("basket group 불러오기");
		logger.info("userNo: " + userNo);
		
		List<GroupVo> basketGroup = basketService.getBasketGroup(userNo);
		
		return basketGroup;
	}
	                                                                                                                                                                                                                                                                                          
	
	// 비로그인 회원 장바구니 생성 + 초기 3개 항목 담기
	@ResponseBody
	@PostMapping("/guestMakeBasket")
	public Map<Integer, List<StoreVo>> guestMakeBasket(HttpSession session){
		logger.info("비로그인 회원 장바구니 생성");
		
		GPSVo curr_location = (GPSVo)session.getAttribute("curr_location");
		logger.info(curr_location.toString());
		
		List<Integer> filter_excluded = (List<Integer>)session.getAttribute("filter_excluded");
		logger.info(filter_excluded.toString());
		
		boolean firstTime = true;
			
		Map<Integer, List<StoreVo>> basket = basketService.makeNewbasket();	
		basket.put(0, basketService.addGuestBasket(basket.get(0), curr_location, filter_excluded, firstTime));	
		
		JSONObject json = new JSONObject(basket);
		
		session.setAttribute("basket_json", json);
		session.setAttribute("basket", basket);
		logger.info(basket.toString());
		
		return basket;
	}
	
	
	// 비회원 저장된 장바구니 불러오기
	@ResponseBody
	@PostMapping("/guestGetBasket")
	public Map<Integer, List<StoreVo>> guestMaketBasket(HttpSession session) {
		logger.info("비로그인 회원 장바구니 불러오기");
		
		Map<Integer, List<StoreVo>> basket = (Map<Integer, List<StoreVo>>)session.getAttribute("basket");
		
		return basket;
	}
	
	
	// GPS 위치 세션에 저장
	@ResponseBody
	@PostMapping("/setGPS")
	public boolean setGPS(@RequestBody GPSVo gpsVo, HttpSession session) {
		logger.info("GPS 설정하기");
				
		Boolean result;
		
		if (gpsVo == null) {
			result = false;
			
		} else {
			logger.info("gpsVo: " + gpsVo.toString());
			result = true;
		}
		
		if (session.getAttribute("curr_location") != null) {
			session.removeAttribute("curr_location");
		}
		session.setAttribute("curr_location", gpsVo);
		
		return result;
	}
	
	
	// 세션에 필터 없을 때 필터 생성
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
		logger.info("filter_excluded: " + filter_excluded.toString());
		
		session.setAttribute("filter_excluded", filter_excluded);
		
		return true;
	}

}
