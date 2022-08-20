package com.lunchwb.controller;

import java.util.HashMap;
import java.util.List;
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

import com.lunchwb.service.BasketService;
import com.lunchwb.service.GroupService;
import com.lunchwb.vo.GPSVo;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.StoreVo;
import com.lunchwb.vo.UserVo;

@RequestMapping("/group")
@Controller
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	@Autowired
	private BasketService basketService;
	
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	
	/********************* 그룹원 리스트 페이지 ********************************************/
	@RequestMapping("/list")
	public String groupList(Model model, HttpSession session, @RequestParam(name="no", defaultValue="0") int groupNo) {
		logger.info("GroupController > groupList()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		Map<String, Object> map = groupService.groupList(authUser, groupNo);
		
		model.addAttribute("map", map);
		
		//내 그룹 없음
		if((Integer)map.get("groupCount") == 0) {
			return "group/addGroup";
		}
		
		//내 그룹이 아님(가져온 멤버목록이 없음) - 내가 있으면 0 일 수가 없어요
		if((String)map.get("memberCount") == null) {
			return "error/403";
		}
			
		return "group/groupList";
	}
	
	
	/******************** 그룹 추가 페이지 ***********************************************/
	@GetMapping("/add")
	public String addGroupForm(Model model, HttpSession session) {
		logger.info("GroupController > addGroupForm()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		Map<String, Object> map = groupService.addGroupForm(authUser);
		
		//그룹 최대 개수 보유(4개) : 잘못된 접근이지만 그냥 list로 보내버릴래요
		if((Integer)map.get("groupCount") >= 4) {
			return "redirect:./list";
		}
		
		model.addAttribute("map", map);
		
		return "group/addGroup";
	}
	
	
	/******************** 그룹 생성 ***********************************************/
	@PostMapping("/add")
	public String addGroup(HttpSession session, GroupVo groupVo) {
		logger.info("GroupController > addGroup()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		HashMap<String, Object> map = groupService.addGroup(authUser, groupVo);

		GroupVo gpVo = (GroupVo)map.get("gpVo");
		int groupNo = gpVo.getGroupNo();
		
		///////// Basket /////////////////////
		List<GroupVo> basketGroup = (List<GroupVo>)session.getAttribute("basketGroup");
		basketGroup = basketService.basketGroupAdd(basketGroup, groupVo);

		session.setAttribute("basketGroup", basketGroup);
		
		int groupCount = (Integer)map.get("groupCount");
		
		if(groupCount > 1) {
			GPSVo curr_location = (GPSVo)session.getAttribute("curr_location");
			List<Integer> filter_excluded = (List<Integer>)session.getAttribute("filter_excluded");
			Map<Integer, List<StoreVo>> basket = (Map<Integer, List<StoreVo>>)session.getAttribute("basket");

			basket = basketService.addBasketGroup(basket, groupNo);
			basket.put(groupNo, basketService.addItemsToBasket(basket.get(groupNo), groupNo, curr_location, filter_excluded, true, true));

			session.setAttribute("basket", basket);

		}else {
			if (session.getAttribute("basket") != null) {
			    session.removeAttribute("basket");
			}
			session.setAttribute("curr-basket-group", groupNo);
		}

		return "redirect:./list?no="+ groupNo;
	}

	
	/******************** 그룹 순서 변경 ********************************************/
	@ResponseBody
	@PostMapping("/changeOrder")
	public String changeOrder(@RequestBody HashMap<String, Integer> gpOrder, HttpSession session) {
		logger.info("GroupController > changeOrder()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		String result = groupService.changeOrder(gpOrder, authUser);
		
		return result;
	}
	
	
	/******************** 그룹 보스 유무 ********************************************/
	@ResponseBody
	@PostMapping("/nameChange")
	public String nameChange(@RequestBody GroupVo groupVo) {
		logger.info("GroupController > nameChange()");
		
		String result = groupService.nameChange(groupVo);
		
		return result;
	}
	
	
	/******************** 그룹 보스 유무 ********************************************/
	@ResponseBody
	@PostMapping("/beBoss")
	public String beBoss(@RequestBody int groupNo) {
		logger.info("GroupController > beBoss()");
		
		String result = groupService.beBoss(groupNo);
		
		return result;
	}
	

	/******************** 초대할 유저 존재 확인 ***************************************/
	@ResponseBody
	@PostMapping("/userCheck")
	public Map<String, Object> userCheck(@RequestBody String userEmail, HttpSession session) {
		logger.info("GroupController > userCheck()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");	
		Map<String, Object> checkMap = groupService.userCheck(userEmail, authUser);
		
		return checkMap;
	}
	
	
	/******************** 회원 그룹 멤버 여부 *******************************************/
	@ResponseBody
	@PostMapping("/memberCheck")
	public String memberCheck(@RequestBody GroupVo groupVo) {
		logger.info("GroupController > memberCheck()");
		
		String state = groupService.memberCheck(groupVo);
		
		return state;
	}

	
	/******************** 회원 그룹 멤버 추가 *******************************************/
	@ResponseBody
	@PostMapping("/invtMember") public GroupVo invtMember(@RequestBody GroupVo groupVo) {
		logger.info("GroupController > invtMember()");
		
		GroupVo memberVo = groupService.invtMember(groupVo);
		
		return memberVo; 
	}
	
	
	/******************** 유령회원 그룹 멤버 추가 *****************************************/
	@ResponseBody
	@PostMapping("/addMember")
	public GroupVo addMember(@RequestBody GroupVo groupVo) {
		logger.info("GroupController > addMember()");
		
		GroupVo memberVo = groupService.addMember(groupVo);
		
		return memberVo;
	}
	
	
	/******************** 그룹 멤버 내보내기(강퇴) *****************************************/
	@ResponseBody
	@PostMapping("/outMember")
	public String outMember(@RequestBody GroupVo groupVo) {
		logger.info("GroupController > outMember()");
		
		String result = groupService.outMember(groupVo);		
		
		return result;
	}
	
	
	/******************** 그룹 탈퇴 ***************************************************/
	@GetMapping("/leave")
	public String leaveGroup(HttpSession session, @RequestParam(name="no", defaultValue="0") int groupNo, 
							 @RequestParam(name="lead", defaultValue="0") int groupLeader) {
		logger.info("GroupController > leaveGroup()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");	
		int groupCount = groupService.leaveGroup(authUser, groupNo, groupLeader);
		
		/////////////// Basket ///////////////////////////
		List<GroupVo> basketGroup = (List<GroupVo>)session.getAttribute("basketGroup");
		
		if (session.getAttribute("curr-basket-group") != null) {
		    session.removeAttribute("curr-basket-group");
		}

		basketGroup = basketService.basketGroupDel(basketGroup, groupNo);
		session.setAttribute("basketGroup", basketGroup);
		
		if(groupCount > 0) {
			Map<Integer, List<StoreVo>> basket = (Map<Integer, List<StoreVo>>)session.getAttribute("basket");
			basket = basketService.deleteBasketGroup(basket, groupNo);

			session.setAttribute("basket", basket); 
		}else {
			if (session.getAttribute("basket") != null) {
			    session.removeAttribute("basket");
			}
		}
		
		return "redirect:./list";
	}
	
	
	/******************** 그룹장 위임 ***************************************************/
	@ResponseBody
	@PostMapping("/leaderChange")
	public String leaderChange(@RequestBody GroupVo groupVo) {
		logger.info("GroupController > leaderchange()");
		
		String result = groupService.leaderChange(groupVo);
		
		return result;
	}
	
	
	
	/******************** 그룹 블랙리스트 페이지 *******************************************/
	@GetMapping("/blacklist")
	public String blacklist(Model model, HttpSession session, @RequestParam(name="no", defaultValue="0") int groupNo) {
		logger.info("GroupController > blacklist()");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		Map<String, Object> map = groupService.blacklist(authUser, groupNo);
		
		model.addAttribute("map", map);
		
		//내 그룹 없음
		if((Integer)map.get("groupCount") == 0) {
			return "group/addGroup";
		}
		
		if((String)map.get("groupName") == null) {
			return "error/403";
		}
		
		
		return "group/blacklist";
	}


}
