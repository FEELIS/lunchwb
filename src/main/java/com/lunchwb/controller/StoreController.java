package com.lunchwb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.service.StoreService;
import com.lunchwb.vo.UserVo;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	/*실험용메인*/
	@GetMapping("/genie/main")
	public String GenieMain() {
		return "/main/genie-index-test";
	}
	
	
	/* 모달 - 가게 정보 받기 */
	@ResponseBody
	@PostMapping("store/info")
	public String storeInfo(@RequestBody int storeNo, HttpSession session) {
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		storeService.storeInfo(storeNo, authUser);
		
		return "";
	}
	
	

}
