package com.lunchwb.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.lunchwb.service.VoteService;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.StoreVo;
import com.lunchwb.vo.UserVo;
import com.lunchwb.vo.VoteVo;

@RequestMapping("/vote")
@Controller
public class VoteController {

	@Autowired
	private VoteService voteService;
	
	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);

	
	// 새 투표 생성하기 페이지로 이동
	@SuppressWarnings("unchecked")
	@RequestMapping("")
	public String newVote(Model model, HttpSession session) {
		System.out.println("**********************************************************************************************************************************************************");
		logger.info("투표 생성 페이지로 이동");
		System.out.println("**********************************************************************************************************************************************************");

		Integer groupNo = (Integer)session.getAttribute("curr_basket_group");
		Map<Integer, List<StoreVo>> basket = (Map<Integer, List<StoreVo>>)session.getAttribute("basket");
		UserVo loginUser = (UserVo)session.getAttribute("authUser");
		
		if (loginUser == null || groupNo == null || groupNo == 0 || basket.get(groupNo).size() < 2) {
			return "redirect:/";
		}
		
		List<GroupVo> voteMember = voteService.getVoteMember(groupNo);
		model.addAttribute("voteMember", voteMember);
		
		List<GroupVo> basketGroup = (List<GroupVo>)session.getAttribute("basketGroup");
		for (int i = 0; i < basketGroup.size(); i++) {
			if (basketGroup.get(i).getGroupNo() == groupNo) {
				model.addAttribute("groupName", basketGroup.get(i).getGroupName());
				break;
			}
		}
				
		return "main/vote/newVote";
	}
	
	
	// 투표 만들기
	@ResponseBody
	@PostMapping("/makeVote")
	public int makeVote(@RequestBody Map<String, String> voteData, HttpSession session) throws ParseException {
		System.out.println("**********************************************************************************************************************************************************");
		logger.info("새 투표 생성하기");
		System.out.println("**********************************************************************************************************************************************************");

		String voteEndDate = voteData.get("voteEndDate");
		String voteMember = voteData.get("voteMember");
		String currBasket = voteData.get("currBasket");
		
		if (voteEndDate.contains(".")) {
			voteEndDate = voteEndDate.substring(0, voteEndDate.indexOf("."));
		}
		
		@SuppressWarnings("deprecation")
		Date date = new Date(voteEndDate);

		UserVo loginUser = (UserVo)session.getAttribute("authUser");
		int groupNo = (Integer)session.getAttribute("curr_basket_group");
		int voteNo = 0;
		
		if (loginUser != null) {
			voteNo = voteService.makeVote(loginUser.getUserNo(), date, voteMember, currBasket, groupNo);
		}
		
		return voteNo;
	}
	
	
	// 투표 참여중인 회원인지 확인
	@ResponseBody
	@PostMapping("/checkVoteMem")
	public List<String> checkVoteMem(@RequestBody int[] checkVoteMem) {
		System.out.println("**********************************************************************************************************************************************************");
		logger.info("투표 참여 불가능 회원 확인");
		System.out.println("**********************************************************************************************************************************************************");
		
		return voteService.checkVoteMember(checkVoteMem);
	}
	
	
	// 투표하기
	@PostMapping("/submitVote")
	public String submitVote(@ModelAttribute VoteVo myVote) throws JsonProcessingException {
		System.out.println("**********************************************************************************************************************************************************");
		logger.info("투표하기");
		System.out.println("**********************************************************************************************************************************************************");

		logger.info(myVote.toString());
		voteService.submitVote(myVote);
		
		return "redirect:/";
	}
	
	
	// 여기갈래요
	@PostMapping("/visitConfirm")
	public String visitConfirm(@ModelAttribute VoteVo visitData) {
		System.out.println("**********************************************************************************************************************************************************");
		logger.info("여기갈래요");
		System.out.println("**********************************************************************************************************************************************************");

		voteService.visitConfirm(visitData);
		
		return "redirect:/";
	}
	
	
	// 투표 초기화하기
	@PostMapping("/resetVote")
	public String resetVote(@RequestParam("voteNo") int voteNo) {
		System.out.println("**********************************************************************************************************************************************************");
		logger.info("투표 초기화하기");
		System.out.println("**********************************************************************************************************************************************************");

		voteService.cancelVote(voteNo);
		
		return "redirect:/";		
	}
	
	
	// 투표 수정하기페이지 호출
	@PostMapping("/modifyVoteReady")
	public String modifyVoteReady(HttpSession session) {
		System.out.println("**********************************************************************************************************************************************************");
		logger.info("투표 수정하기로 이동");
		System.out.println("**********************************************************************************************************************************************************");
		
		UserVo loginUser = (UserVo)session.getAttribute("authUser");
			
		if (loginUser != null) {
			session.setAttribute("modifyState", 99);
		}
		
		return "redirect:/";
	}
	
	
	// 투표 수정하기
	@ResponseBody
	@PostMapping("/modifyVote")
	public boolean modifyVote(@RequestBody Map<String, Object> voteData) {
		System.out.println("**********************************************************************************************************************************************************");
		logger.info("투표 수정하기");
		System.out.println("**********************************************************************************************************************************************************");
		
		String voteEndDate = (String)voteData.get("voteEndDate");
		logger.info(voteEndDate);
		String voteMember = (String)voteData.get("voteMember");
		logger.info(voteMember);
		logger.info("" + voteData.get("voteNo"));
		int voteNo = (int)voteData.get("voteNo");
		logger.info("" + voteNo);
		
		if (voteEndDate.contains(".")) {
			voteEndDate = voteEndDate.substring(0, voteEndDate.indexOf("."));
		}
		
		@SuppressWarnings("deprecation")
		Date date = new Date(voteEndDate);
		
		boolean result = false;
		result = voteService.modifyVote(date, voteMember, voteNo);
		
		return result;
	}
	
	
	// 투표 > 다른 사람들이랑 먹을래요
	@PostMapping("/escapeVote")
	public String escapeVote(@ModelAttribute VoteVo myVote) {
		System.out.println("**********************************************************************************************************************************************************");
		logger.info("다른 사람들이랑 먹을래요");
		System.out.println("**********************************************************************************************************************************************************");
		
		voteService.escapeVote(myVote);
		
		return "redirect:/";
	}
}
