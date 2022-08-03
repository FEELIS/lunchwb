package com.lunchwb.service;

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
		int count = userDao.join(userVo);
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
