package com.lunchwb.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String groupList(Model model, HttpSession session, 
							@RequestParam(name="no", defaultValue="0") int groupNo) {
		logger.info("groupList()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		if(authUser == null) {
			return "user/loginForm";
		}
		
		Map<String, Object> map = groupService.groupList(authUser, groupNo);
		
		
		model.addAttribute("map", map);
		
		//그룹 없음
		if((Integer)map.get("groupCount") == 0) {
			return "group/addGroup";
		}
			
		return "group/groupList";
	}
	
	
	/******************** 그룹 추가 페이지 ***********************************************/
	@GetMapping("group/add")
	public String addGroupForm(HttpSession session) {
		logger.info("addGroupForm()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		if(authUser == null) {
			return "user/loginForm";
		}
		
		return "group/addGroup";
	}
	
	
	/******************** 그룹 생성 ***********************************************/
	@PostMapping("group/add")
	public String addGroup(HttpSession session, GroupVo groupVo) {
		logger.info("addGroup()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int groupNo = groupService.addGroup(authUser, groupVo);
	
		return "group/addGroup?no=" + groupNo;
	}

	
	/******************** 그룹 순서 변경 ********************************************/
	@ResponseBody
	@PostMapping("group/changeOrder")
	public String changeOrder(@RequestBody HashMap<String, Integer> gpOrder, HttpSession session) {
		logger.info("changeOrder()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		String result = groupService.changeOrder(gpOrder, authUser);
		
		return result;
	}

}
