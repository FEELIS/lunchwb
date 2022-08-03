package com.lunchwb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.GroupVo;

@Repository
public class GroupDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(GroupDao.class);
	
	
	/******************** 그룹 리스트 **********************************************/
	public List<GroupVo> userGroups(int groupNo) {
		logger.info("userGroups");
		
		List<GroupVo> groupList = sqlSession.selectList("group.groupList", groupNo);
		
		return groupList;
	}
	
	
	/******************** 그룹 멤버 리스트 *******************************************/
	public List<GroupVo> groupMembers(int groupNo) {
		logger.info("groupMembers");
		
		List<GroupVo> memberList = sqlSession.selectList("group.groupMembers", groupNo);
		
		return memberList;
	}

	
	
	/******************** 그룹 생성 ***********************************************/
	public void createGroup(GroupVo groupVo) {
		logger.info("createGroup()");
		
		int count = sqlSession.insert("group.createGroup", groupVo);
		
		logger.info("그룹 "+ count + "건 생성 완료");
	}
	
	
	/******************** 그룹 멤버 추가 ***********************************************/
	public void addMember(GroupVo groupVo) {
		logger.info("addMember()");
		
		int count = sqlSession.insert("group.addMember", groupVo);
		
		logger.info("그룹 멤버 " + count + "명 추가 완료");
	}

}
