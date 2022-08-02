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

	public UserVo getUser(UserVo userVo) {
		UserVo userInfo = sqlSession.selectOne("user.getUser", userVo);
		return userInfo;
	}

	public int join(UserVo userVo) {
		int count = sqlSession.insert("user.join", userVo);
		return count;
	}
	
	
	/* 이지희 */
	public UserVo groupMemInfo(int userNo) {
		//logger.info("groupMemInfo()");

		UserVo userVo = sqlSession.selectOne("user.groupMemInfo", userNo);

		return userVo;
	}

}
