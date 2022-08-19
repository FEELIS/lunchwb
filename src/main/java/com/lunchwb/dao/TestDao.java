package com.lunchwb.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.GroupVo;

@Repository
public class TestDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public GroupVo getGroupName(int groupNo) {
		GroupVo groupName = sqlSession.selectOne("test.getGroupName", groupNo);
		return groupName;
	}
}
