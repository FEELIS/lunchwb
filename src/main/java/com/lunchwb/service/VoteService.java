package com.lunchwb.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	
	/////////// 투표 참여 못하는 회원 목록 불러오기 ///////////////////////////////
	
	public List<String> checkVoteMember(int[] checkMember) {
		List<Integer> checkMem = new ArrayList<>();
		for (int no: checkMember) checkMem.add(no);
		System.out.println(checkMem.toString());
		
		return userDao.selectImpossibleMember(checkMem);
	}
	
	
	///////// 투표 생성하기 ///////////////////////////////////////////////////////////////////////
	
	public int makeVote(int userNo, Date voteEndTime, String voteMember, String currBasket, int groupNo) {
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
	
		
		return voteNo;
	}

	
	
	///////// voteAside 필요한 파라미터 불러오기 ////////////////////////////////////////////////////////////
	
	public Map<String, Object> getVoteAsideData(int voteNo, int userState) {
		Map<String, Object> voteData = new HashMap<>();
		
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
			
			String storeName = jstore.getString("storeName");
			if (storeName.length() >= 13) storeName = storeName.substring(0, 13);
			store.setStoreName(storeName);
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
		
		
		// 투표 진행상황(userStaet == 2일 때)
		if (userState == 2) {
			VoteVo currVote = voteDao.currVote(voteNo);
			voteData.put("currVote", currVote);
		}
		
		
		// 투표 결과 정리한 것(userState == 3일 때)
		if (userState == 3) {
			
		}
				
		return voteData;
	}
	
	
	
	//////// 투표하기 ///////////////////////////////////////////////////////////
	
	public String submitVote(VoteVo myVote) throws JsonProcessingException {
		// 투표 업데이트
		int voteIdx = myVote.getVoteIdx();
		int voteNo = myVote.getVoteNo();
		
		JSONArray jArray = new JSONArray(voteDao.selectVoteResults(voteNo));
		int[] voteResults = new int[jArray.length()];
		
		for (int i = 0; i < jArray.length(); i++) {
			voteResults[i] = jArray.getInt(i);
			
			if (i == voteIdx) voteResults[i]++;
		}
		
		
		ObjectMapper mapper = new ObjectMapper();
		myVote.setVoteResults(mapper.writeValueAsString(voteResults));
		
		voteDao.updateVoteResults(myVote);
				
		// userState, voteVoted 업데이트
		if (myVote.getUserNo() != null) {
			voteDao.updateVoteVoted(myVote);
			userDao.updateState2(myVote.getUserNo());
		}
		
		// 비회원 추가해야함
		
		// 만약 내가 마지막 투표자면 투표 종료
		VoteVo currVote = voteDao.currVote(voteNo);
		
		if (currVote.getTotCnt() == currVote.getVotedCnt()) {
			int cnt = voteDao.updateVoteEnd(voteNo);
			
			if (cnt == 1) {
				System.out.println(voteNo + "번 투표 종료");
				
				voteDao.updateUserEnd(voteNo);
				
			} else {
				System.out.println("투표 종료 실패");
			}
		}
		
		return "redirect:/";
	}
	
	
	
	///// 여기갈래요 누르기 ///////////////////////////////////////////
	
	public void visitConfirm(int voteNo) {
		int cnt = voteDao.updateVoteVisited(voteNo);
		
		if (cnt > 0) {
			System.out.println("[투표 종료]");
			
			cnt = voteDao.updateUserVisited(voteNo);
			
			System.out.println("[회원 " + cnt + "명 방문 완료로 상태 변경]");
			
		} else {
			System.out.println("[투표 종료 실패]");
		}
		
	}
 
 }
