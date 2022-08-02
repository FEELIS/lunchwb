package com.lunchwb.dao;

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
