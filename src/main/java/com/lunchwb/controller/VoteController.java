package com.lunchwb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lunchwb.service.VoteService;

@Controller
public class VoteController {

	@Autowired
	private VoteService voteService;
}
