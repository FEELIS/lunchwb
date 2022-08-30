package com.lunchwb.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lunchwb.service.NotiService;
import com.lunchwb.vo.NotificationVo;

@RequestMapping("/notice")
@Controller
public class NotiController {
	
	@Autowired
	private NotiService notiService;
	
	private static final Logger logger = LoggerFactory.getLogger(NotiController.class);
	
	
	/*************************** 알림 개수  *******************************************/
	@ResponseBody
	@PostMapping("/count")
	public int notiCount(@RequestBody int userNo) {
		logger.info("notiCount...userNo={}", userNo);
		
		int notiCnt = notiService.notiCount(userNo);
		
		return notiCnt;
	}
	
	
	/*************************** 최근 알림 *******************************************/
	@ResponseBody
	@PostMapping("/recent/list")
	public List<NotificationVo> notiList(@RequestBody NotificationVo notiVo){
		logger.info("notiList...notiVo={}", notiVo);
		
		List<NotificationVo> notiList = notiService.notiList(notiVo);
		
		return notiList;
	}
	
	
	/*************************** 그룹 초대 수락 *******************************************/
	@ResponseBody
	@PostMapping("/group/invite/ok")
	public String inviteOk(@RequestBody NotificationVo notiVo) {
		logger.info("inviteOk...notiVo={}", notiVo);
		
		String result = notiService.inviteOk(notiVo);
		
		return result;
	}
	
	
	/*************************** 그룹 초대 거절 *******************************************/
	@ResponseBody
	@PostMapping("/group/invite/reject")
	public String inviteReject(@RequestBody NotificationVo notiVo) {
		logger.info("inviteReject...notiVo={}", notiVo);
		
		String result = notiService.inviteReject(notiVo);
		
		return result;
	}
	
	/****************************** 알림 확인 *******************************************/
	@ResponseBody
	@PostMapping("/check")
	public String alertCheck(@RequestBody int notiNo) {
		logger.info("alertCheck...notiVo={}", notiNo);
		
		String result = notiService.alertCheck(notiNo);
		
		return result;
	}
	
}
