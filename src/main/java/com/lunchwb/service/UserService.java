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
	
	public UserVo join(UserVo userVo) {
		int count = userDao.join(userVo);
		UserVo authUser = userDao.login(userVo);
		return authUser;
	}

}
