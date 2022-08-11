package com.lunchwb.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.UserDao;
import com.lunchwb.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public UserVo login(UserVo userVo) {
		UserVo authUser = userDao.login(userVo);
		return authUser;
	}
	
	public UserVo getUserInfo(UserVo userVo) {
		UserVo userInfo = userDao.getUser(userVo);
		return userInfo;
	}
	
	
	public UserVo join(UserVo userVo) {
		userDao.join(userVo);
		UserVo authUser = userDao.login(userVo);
		return authUser;
	}
	
	public UserVo modifyUser(UserVo userVo) {
		int count = userDao.modifyUser(userVo);
		
		if(count > 0) {
			UserVo authUser = userDao.login(userVo);
			return authUser;
		}else {
			return null;
		}
	}
	
	/* 자동로그인 */
	public void autoLogin(String sessionId, Date limitDate, String userEmail) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("userEmail", userEmail);
		
		userDao.autoLogin(map);
		
	}
	
	public UserVo selectSession(String sessionId) {
		UserVo autoLogin = userDao.selectSession(sessionId);
		return autoLogin;
	}
	
	/* SNS 로그인 */
	/* 네이버 */
	public UserVo naverConnectionCheck(Object userEmail) {
		UserVo naverCheck = userDao.naverConnectionCheck(userEmail);
		return naverCheck;
	}
	
	public UserVo naverLogin(Map<String, Object> apiJson) {
		UserVo naverLogin = userDao.naverLogin(apiJson);
		return naverLogin;
	}
	
	public void setNaverConnection(Map<String, Object> apiJson) {
		userDao.setNaverConnection(apiJson);
	}
	
	public int userNaverRegisterPro(Map<String, Object> apiJson) {
		
		int count = userDao.userNaverRegisterPro(apiJson);
		return count;
	}
	
	/* SNS 회원 가입 유저 확인 */
	public UserVo checkSNS(String userEmail) {
		UserVo checkSNSUser = userDao.checkNaverUser(userEmail);
		return checkSNSUser;
	}
	
	/* SNS 회원 회원정보 수정 */
	public UserVo modifySNSUser(UserVo userVo) {
		int count = userDao.modifySNSUser(userVo);
		System.out.println("userVo = " +userVo);
		if(count > 0) {
			UserVo authUser = userDao.modifyAfterNaverLogin(userVo);
			return authUser;
		}else {
			return null;
		}
	}
	
	
	/* JSON */
	public String checkEmail(String userEmail) {
		
		UserVo emailCheck = userDao.checkEmail(userEmail);
		
		String result;
		
		if(emailCheck == null) {
			result = "success";
		}else {
			result = "fail";
		}
		
		return result;
	}

	
	

}
