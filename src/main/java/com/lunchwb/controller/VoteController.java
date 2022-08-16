package com.lunchwb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lunchwb.service.VoteService;

@RequestMapping("/vote")
@Controller
public class VoteController {

	@Autowired
	private VoteService voteService;
	
	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);

	
	@RequestMapping("")
	public String newVote() {
		logger.info("새 투표 생성 페이지 이동");
		
		return "main/vote/newVote";
	}
}
