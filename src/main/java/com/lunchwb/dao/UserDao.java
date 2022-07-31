package com.lunchwb.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public UserVo login(UserVo userVo) {
		UserVo authUser = sqlSession.selectOne("user.login", userVo);
		return authUser;
	}

}
