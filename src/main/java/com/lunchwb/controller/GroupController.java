package com.lunchwb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lunchwb.service.GroupService;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@RequestMapping("/groupList")
	public String groupList() {
		logger.info("GroupController > groupList()");
		
		return "group/groupList";
	}
	

}
