package com.lunchwb.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
	
	
	public void makeVote(int userNo, Date voteEndTime, String voteMember, String currBasket, int groupNo) {
		System.out.println("**********************************************************************************************************************************************************");
		System.out.println("[투표 생성 데이터 정리하기]");
		System.out.println(voteEndTime.toString());
		System.out.println(currBasket);
		
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
		
		JSONArray basketArray = new JSONArray(currBasket);
		JSONArray resultArray = new JSONArray();
		
		for (int i = 0; i < basketArray.length(); i++) {
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
		
		// 스케쥴러 추가
		
		System.out.println("**********************************************************************************************************************************************************");
	}

	
	
	// voteAside 필요한 파라미터 불러오기
	public Map<String, Object> getVoteAsideData(int voteNo) {
		Map<String, Object> voteData = new HashMap<>();
		
		// 끝나는 시각,  가게 정보들, 투표 만든 사람 정보는 투표 정본데 투표 정보? /// 투표 참여자 정보들, voteVo 가져와서 해체하고 /// userVo ㄴㄴ voteMemberVo인가 맞아
		List<VoteVo> voteVo = voteDao.selectVoteInfo(voteNo);
		
		// 끝나는 시각, 가게 정보, 투표 만든 사람
		VoteVo voteInfo = new VoteVo();
		voteInfo.setVoteNo(voteNo);
		voteInfo.setVoteState(voteVo.get(0).getVoteState());
		voteInfo.setGroupName(voteVo.get(0).getGroupName());
		voteInfo.setVoteEndTime(voteVo.get(0).getVoteEndTime());
		voteInfo.setVoteMadeUser(voteVo.get(0).getVoteMadeUser());
		
		
		// 장바구니 담긴 가게 정보		
		JSONArray storeInfo = new JSONArray(voteVo.get(0).getVoteItems());
		JSONArray voteStatus = new JSONArray(voteVo.get(0).getVoteResults());
		
		List<StoreVo> voteStoreInfo = new ArrayList<>();
		List<Integer> voteResult = new ArrayList<>();
		
		for (int i = 0; i < storeInfo.length(); i++) {
			// 장바구니 정보 파싱
			StoreVo store = new StoreVo();
			JSONObject jstore = (JSONObject)storeInfo.getJSONObject(i);
			
			store.setStoreName(jstore.getString("storeName"));
			store.setStoreNo(jstore.getInt("storeNo"));
			store.setDistance(jstore.getInt("distance"));
			store.setMenu2ndCateName(jstore.getString("menu2ndCateName"));
			
			voteStoreInfo.add(store);
			
			
			// vote_result 파싱
			voteResult.add(voteStatus.getInt(i));
		}
		
		voteInfo.setVoteResultList(voteResult);
		
		
		// vote member 데이터 정리
		List<VoteVo> voteMember = new ArrayList<>();
		
		for (VoteVo member: voteVo) {
			VoteVo mem = new VoteVo();
			
			mem.setVoteMemberNo(member.getVoteMemberNo());
			mem.setUserNo(member.getUserNo());
			mem.setUserName(member.getUserName());
			mem.setVoteVoted(member.getVoteVoted());
			
			voteMember.add(mem);
		}
		
		
		// model에 추가할 Map에 데이터 넣기
		voteData.put("voteInfo", voteInfo);
		voteData.put("voteBasket", voteStoreInfo);
		voteData.put("voteMember", voteMember);

		
		return voteData;
	}
 
 }
