package com.lunchwb.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.service.StoreService;
import com.lunchwb.vo.GPSVo;
import com.lunchwb.vo.UserVo;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	
	/*실험용메인*/
	@GetMapping("/genie/main")
	public String GenieMain() {
		return "/main/genie-index-test";
	}
	
	
	/* 모달 - 가게 정보 받기 */
	@ResponseBody
	@PostMapping("store/info")
	public Map<String, Object> storeInfo(@RequestBody int storeNo, HttpSession session) {
		logger.info("storeInfo...storeNo={}", storeNo);
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		GPSVo gpsVo = (GPSVo)session.getAttribute("curr_location");
		Map<String, Object> storeMap = storeService.storeInfo(storeNo, authUser, gpsVo);
		
		return storeMap;
	}
	
	@ResponseBody
	@PostMapping("store/distance")
	public int storeDistance(@RequestBody GPSVo gpsVo) {
		logger.info("storeDistance...GPSVo={}", gpsVo);
		return 2;	
	}
	
	

}
