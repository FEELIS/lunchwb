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
	public String groupList(Model model, HttpSession session, @RequestParam(name="no", defaultValue="0") int groupNo) {
		logger.info("GroupController > groupList()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		Map<String, Object> map = groupService.groupList(authUser, groupNo);
		
		model.addAttribute("map", map);
		
		//내 그룹 없음
		if((Integer)map.get("groupCount") == 0) {
			return "group/addGroup";
		}
		
		/*
		//내 그룹이 아님(가져온 멤버목록이 없음)
		if((String)map.get("memberCount") == null) {
			return "error/403";
		}
		*/
			
		return "group/groupList";
	}
	
	
	/******************** 그룹 추가 페이지 ***********************************************/
	@GetMapping("group/add")
	public String addGroupForm(Model model, HttpSession session) {
		logger.info("GroupController > addGroupForm()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		Map<String, Object> map = groupService.addGroupForm(authUser);
		
		//그룹 최대 개수 보유(4개) > 잘못된 접근
		/*
		if((Integer)map.get("groupCount") == 4) {
			return "error/403";
		}
		*/
		
		model.addAttribute("map", map);
		
		return "group/addGroup";
	}
	
	
	/******************** 그룹 생성 ***********************************************/
	@PostMapping("group/add")
	public String addGroup(HttpSession session, GroupVo groupVo) {
		logger.info("GroupController > addGroup()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int groupNo = groupService.addGroup(authUser, groupVo);
	
		return "redirect:./list?no="+ groupNo;
	}

	
	/******************** 그룹 순서 변경 ********************************************/
	@ResponseBody
	@PostMapping("group/changeOrder")
	public String changeOrder(@RequestBody HashMap<String, Integer> gpOrder, HttpSession session) {
		logger.info("GroupController > changeOrder()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		String result = groupService.changeOrder(gpOrder, authUser);
		
		return result;
	}
	
	
	/******************** 그룹 보스 유무 ********************************************/
	@ResponseBody
	@PostMapping("group/beBoss")
	public String beBoss(@RequestBody int groupNo) {
		logger.info("GroupController > beBoss()");
		
		String result = groupService.beBoss(groupNo);
		
		return result;
	}
	

	/******************** 회원 그룹 멤버 추가 *******************************************/
	@ResponseBody
	@PostMapping("group/userCheck")
	public Map<String, Object> userCheck(String userEmail) {
		logger.info("GroupController > userCheck()");
		
		Map<String, Object> checkMap = groupService.userCheck(userEmail);
		
		return checkMap;
	}
	
	
	/******************** 회원 그룹 멤버 추가 *******************************************/
	/*
	 * @ResponseBody
	 * 
	 * @PostMapping("group/invtMember") public GroupVo invtMember(@RequestBody
	 * Map<String, Object> groupInvt) {
	 * logger.info("GroupController > invtMember()");
	 * 
	 * //GroupVo memberVo = groupService.invtMember(groupInvt);
	 * 
	 * return memberVo; }
	 */
	
	/******************** 유령회원 그룹 멤버 추가 *****************************************/
	@ResponseBody
	@PostMapping("group/addMember")
	public GroupVo addMember(@RequestBody GroupVo groupVo) {
		logger.info("GroupController > addMember()");
		
		GroupVo memberVo = groupService.addMember(groupVo);
		
		return memberVo;
	}

}
