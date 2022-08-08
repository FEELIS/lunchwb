package com.lunchwb.dao;

import java.util.Map;

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
	
	public int modifyUser(UserVo userVo) {
		int count = sqlSession.update("user.modifyUser", userVo);
		return count;
	}
	
	/* 자동로그인 */
	public void autoLogin(Map<String, Object> map) {
		sqlSession.update("user.autoLogin", map);
	}
	
	public UserVo selectSession(String sessionId) {
		UserVo autoLogin = sqlSession.selectOne("user.selectSession", sessionId);
		return autoLogin;
	}
	
	
	/* Json */
	/* 이메일 중복확인 */
	public UserVo checkEmail(String userEmail) {
		UserVo checkEmail = sqlSession.selectOne("user.checkEmail", userEmail);
		return checkEmail;
	}
	
	/* 이지희 */
	/* 그룹 비회원 멤버 추가*/
	public void addGpMember(UserVo userVo) {
		//logger.info("addGroupMem()");
		sqlSession.insert("user.addGpMember", userVo);
	}
	
	/* 그룹에 초대할 회원 존재 여부 */
	public int userCheck(String userEmail) {
		int userNo = sqlSession.selectOne("user.userCheck", userEmail);
		return userNo;
	}

}
