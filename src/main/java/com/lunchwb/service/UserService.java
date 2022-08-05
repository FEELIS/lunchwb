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
	public void autoLogin(String sessionId, Date limitDate, String email) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("email", email);
		
		userDao.autoLogin(map);
		
	}
	
	public UserVo selectSession(String sessionId) {
		UserVo autoLogin = userDao.selectSession(sessionId);
		return autoLogin;
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
