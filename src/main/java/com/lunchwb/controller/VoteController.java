package com.lunchwb.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lunchwb.service.VoteService;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.StoreVo;
import com.lunchwb.vo.UserVo;

@RequestMapping("/vote")
@Controller
public class VoteController {

	@Autowired
	private VoteService voteService;
	
	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);

	
	@RequestMapping("")
	public String newVote(Model model, HttpSession session) {
		logger.info("새 투표 생성 페이지 이동");
		
		Integer groupNo = (Integer)session.getAttribute("curr_basket_group");
		Map<Integer, List<StoreVo>> basket = (Map<Integer, List<StoreVo>>)session.getAttribute("basket");
		UserVo loginUser = (UserVo)session.getAttribute("authUser");
		
		if (loginUser == null || groupNo == null || groupNo == 0 || basket.get(groupNo).size() < 2) {
			return "redirect:./";
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
	
	
	@PostMapping("/makeVote")
	public String makeVote(@RequestParam("voteEndDate") String voteEndDate) {
		logger.info(voteEndDate);
		
		return "redirect:../";
	}
}
