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
	
	/* SNS로그인 */
	/* 네이버 */
	public UserVo naverConnectionCheck(Object userEmail) {
		UserVo naverCheck = sqlSession.selectOne("user.naverConnectionCheck", userEmail);
		return naverCheck;
	}
	
	public UserVo naverLogin(Map<String, Object> apiJson) {
		UserVo naverLogin = sqlSession.selectOne("user.naverLogin", apiJson);
		return naverLogin;
	}
	
	public UserVo modifyAfterNaverLogin(UserVo userVo) {
		UserVo naverLogin = sqlSession.selectOne("user.modifyAfterNaverLogin", userVo);
		return naverLogin;
	}
	
	public void setNaverConnection(Map<String, Object> apiJson) {
		sqlSession.update("user.setNaverConnection", apiJson);
	}
	
	public int userNaverRegisterPro(Map<String, Object> apiJson) {
		int count = sqlSession.insert("user.userNaverRegisterPro", apiJson);
		return count;
	}
	
	
	/* SNS 유저 확인 */
	public UserVo checkNaverUser(String userEmail) {
		UserVo checkNaverUser = sqlSession.selectOne("user.checkNaverUser", userEmail);
		return checkNaverUser;
	}
	
	/* SNS 유저 회원 정보 수정 */
	public int modifySNSUser(UserVo userVo) {
		int count = sqlSession.update("user.modifySNSUser", userVo);
		return count;
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
   public UserVo userCheck(String userEmail) {
      UserVo userVo = sqlSession.selectOne("user.userCheck", userEmail);
      return userVo;
   }
   
   /* 유령회원 제거 */
   public void groupOut(int userNo) {
	   sqlSession.delete("user.groupOut", userNo);
   }

}
