package com.lunchwb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.BlacklistVo;

@Repository
public class BlackDao {
	
	@Autowired
	SqlSession sqlSession;
	
	/******************** 블랙리스트 ***********************************************/
	public List<BlacklistVo> blacklist(int groupNo){
		List<BlacklistVo> blacklist = sqlSession.selectList("blacklist.blacklist", groupNo);
		return blacklist;
	}
	

}
