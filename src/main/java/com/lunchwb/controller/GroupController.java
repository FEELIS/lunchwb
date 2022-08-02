package com.lunchwb.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lunchwb.service.GroupService;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.UserVo;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	
	/********************* 그룹원 리스트 페이지 ********************************************/
	@RequestMapping("/group/list")
	public String groupList() {
		logger.info("groupList()");
		
		return "group/groupList";
	}
	
	
	/******************** 그룹 추가 페이지 ***********************************************/
	@GetMapping("group/add")
	public String addGroupForm() {
		logger.info("addGroupForm()");
		
		return "group/addGroup";
	}
	
	/******************** 그룹 생성 ***********************************************/
	@PostMapping("group/add")
	public String addGroup(HttpSession session, GroupVo groupVo) {
		logger.info("addGroup()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		groupService.addGroup(authUser, groupVo);
	
		return "group/addGroup";
	}
	

}
