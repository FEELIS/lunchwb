package com.lunchwb.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.GroupDao;
import com.lunchwb.dao.UserDao;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.UserVo;

@Service
public class GroupService {
	
	@Autowired
	private GroupDao groupDao;
	@Autowired
	private UserDao userDao;
	
	private static final Logger logger = LoggerFactory.getLogger(GroupService.class);
	
	
	/******************** 그룹 리스트 페이지 ********************************************/
	public Map<String, Object> groupList(UserVo authUser, int groupNo) {
		logger.info("groupList()");
		
		Map<String, Object> map = new HashMap<>();
		
		/////////////////// 유저 그룹 리스트  /////////////////////////////
		int userNo = authUser.getUserNo();
		List<GroupVo> groupList = groupDao.userGroups(userNo);
		map.put("grouopList", groupList);
		
		//그룹 개수
		//그룹이 없으면 그룹 생성페이지로 전송
		int groupCount = groupList.size();
		map.put("groupCount", groupCount);
		
		logger.info("gCount: " + groupCount);
		/////////////////// 그룹원 리스트 //////////////////////////////
		//나의그룹 접근 groupNo == 0: 첫번째 그룹페이지

		if(groupCount != 0) {
			
			if(groupNo == 0) {
				groupNo = groupList.get(0).getGroupNo();
			}
			logger.info("groupNo" + groupNo);
			
			map.put("groupNo", groupNo);
			
			List<GroupVo> memberList = groupDao.groupMembers(groupNo);
			map.put("memberList", memberList);
			
			int memberCount = memberList.size();
			map.put("memberCount", memberCount);
		}
		
		return map;
	}
	
	
	
	/******************** 그룹 생성 ***********************************************/
	public int addGroup(UserVo authUser, GroupVo groupVo) {
		logger.info("addGroup()");
		
		//그룹 최대 4개 보유 가능 > 4개 이후 생성 못함 (새 그룹 추가 버튼이 보이지 않음 - 혹시 주소접근은 새 그룹 추가 페이지 접근시 막을 것)
		
		
		//////////////////// 그룹 생성 //////////////////////////////////
		//그룹 생성 > 생성자가 첫번째 리더
		groupVo.setGroupLeader(authUser.getUserNo());
		groupDao.createGroup(groupVo);
		
		
		/////////////////// 그룹 멤버 추가 ////////////////////////////////
		//groupVo : groupNo / bossCheck 있음
		//생성된 그룹 번호
		int groupNo = groupVo.getGroupNo();
		
		logger.info(groupNo + "그룹번호");
		
		//그룹멤버에 추가할 유저 정보 받기
		int userNo = authUser.getUserNo();
		UserVo userVo = userDao.groupMemInfo(userNo);
		
		//생년 4자리 + 생월 + 생일
		int birthYear = Integer.parseInt(userVo.getUserBirth().substring(0, 4));
		int birthMonth = Integer.parseInt(userVo.getUserBirth().substring(4, 6));
		int birthDay = Integer.parseInt(userVo.getUserBirth().substring(6));
		
		//오늘날짜 연도 +달(month:지난달출력) +날짜
		Calendar today = Calendar.getInstance();
		int thisYear = today.get(Calendar.YEAR);
		int thisMonth = today.get(Calendar.MONTH) + 1;
		int thisDay = today.get(Calendar.DAY_OF_MONTH);
		
		// 만나이 (생일 안지났으면 -1)
		int age = thisYear - birthYear; 
		if(birthMonth*100 + birthDay > thisMonth*100 + thisDay) {
			age = age - 1;
		}
		
		//vo 정보 추가
		groupVo.setUserNo(userNo);
		groupVo.setLeaderCheck(1);
		groupVo.setMemberName(userVo.getUserName());
		groupVo.setMemberAge(age);
		groupVo.setMemberSex(userVo.getUserSex());
		
		//그룹 멤버 추가
		groupDao.addMember(groupVo);
		
		
		return groupNo;
	}

}
