package com.lunchwb.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.GroupDao;
import com.lunchwb.dao.UserDao;
import com.lunchwb.dao.VoteDao;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.StoreVo;
import com.lunchwb.vo.UserVo;
import com.lunchwb.vo.VoteVo;

@Service
public class VoteService {
	
	@Autowired
	private VoteDao voteDao;
	@Autowired
	private GroupDao groupDao;
	@Autowired
	private UserDao userDao;
	
	public List<GroupVo> getVoteMember(int groupNo) {
		return groupDao.selectVoteMember(groupNo);
	}
	
	
	public void makeVote(int userNo, Date voteEndTime, String voteMember, int[] currBasket, int groupNo) {
		System.out.println("**********************************************************************************************************************************************************");
		System.out.println("[투표 생성 데이터 정리하기]");
		System.out.println(voteEndTime.toString());
		System.out.println(Arrays.toString(currBasket));
		
		List<UserVo> voteMem = new ArrayList<>();
		List<UserVo> memberMem = new ArrayList<>();
		System.out.println(voteMember);

		JSONObject iptData = new JSONObject(voteMember);
		JSONArray jArray = (JSONArray)iptData.get("mem");
		
		for (int i = 0; i < jArray.length(); i++) {
			JSONObject user = jArray.getJSONObject(i);
			System.out.println(user);
			UserVo member = new UserVo();
			
			member.setUserName(user.getString("userName"));
			if (user.has("userNo")) member.setUserNo(user.getInt("userNo"));
						
			if (user.has("userGrade")) {
				int userGrade = user.getInt("userGrade");
				member.setUserGrade(userGrade);
				
				if (userGrade == 1) memberMem.add(member);
			}
			
			voteMem.add(member);
		}		
		
		System.out.println("memberMem");
		System.out.println(memberMem);
		
		System.out.println("**********************************[vote 생성하기]**********************************");
		VoteVo voteItems = new VoteVo();
		voteItems.setUserNo(userNo);
		voteItems.setGroupNo(groupNo);
		voteItems.setVoteEndTime(voteEndTime);
		
		JSONArray basketArray = new JSONArray();
		JSONArray resultArray = new JSONArray();
		
		for (int i = 0; i < currBasket.length; i++) {
			basketArray.put(currBasket[i]);
			resultArray.put(0);
		}
		
		voteItems.setVoteItems(basketArray.toString());
		voteItems.setVoteResults(resultArray.toString());
		
		System.out.println(voteItems.toString());
		int voteNo = voteDao.insertNewVote(voteItems);
		
		// 스케줄러 추가해줘야할 듯
		
		System.out.println("**********************************[vote_member 생성하기]**********************************");
		Map<String, Object> voteMems = new HashMap<>();
		voteMems.put("voteMember", voteMem);
		voteMems.put("voteNo", voteNo);
		
		int cnt = voteDao.insertVoteMember(voteMems);
		System.out.println(cnt);
		
		System.out.println("**********************************[회원들 user_state 변경하기]**********************************");
		userDao.updateState1(memberMem);
		
		System.out.println("**********************************************************************************************************************************************************");
	}

}
