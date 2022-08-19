package com.lunchwb.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.GroupDao;
import com.lunchwb.dao.VoteDao;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.StoreVo;
import com.lunchwb.vo.VoteVo;

@Service
public class VoteService {
	
	@Autowired
	private VoteDao voteDao;
	@Autowired
	private GroupDao groupDao;
	
	public List<GroupVo> getVoteMember(int groupNo) {
		return groupDao.selectVoteMember(groupNo);
	}
	
	
	public void makeVote(int userNo, Date voteEndDate, String voteMember, int[] currBasket) {
		System.out.println("**********************************************************************************************************************************************************");
		System.out.println("투표 생성 데이터");
		System.out.println(voteEndDate.toString());
		System.out.println(Arrays.toString(currBasket));
		
		List<VoteVo> voteMem = new ArrayList<>();
		System.out.println(voteMember);

		JSONObject iptData = new JSONObject(voteMember);
		JSONArray jArray = (JSONArray)iptData.get("mem");
		
		for (int i = 0; i < jArray.length(); i++) {
			JSONObject user = jArray.getJSONObject(i);
			System.out.println(user);
			VoteVo member = new VoteVo();
			
			member.setUserName(user.getString("userName"));
			if (user.has("userNo")) {
				if (user.getInt("userNo") == userNo) {
					member.setVoteMadeUser(userNo);
				}
				member.setUserNo(user.getInt("userNo"));
			}
			
			if (user.has("userGrade")) {
				member.setUserGrade(user.getInt("userGrade"));
			}
			
			voteMem.add(member);
		}		
		System.out.println("**********************************************************************************************************************************************************");
	}

}
