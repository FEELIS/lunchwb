package com.lunchwb.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.vo.StoreVo;

@Controller
public class RandomController {
	
	@ResponseBody
	@PostMapping("/pickRandom")
	public int pickRandom(HttpSession session, @RequestBody String countBasket) {
		// 장바구니 갯수 받기
		int countBasketItems = Integer.parseInt(countBasket);
		
		System.out.println("countBasketItems = " + countBasketItems);
		int count = (int)(Math.random()*countBasketItems)+1;
		System.out.println("count = " + count);
		
		return count;
	}
}