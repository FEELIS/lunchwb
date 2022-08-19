package com.lunchwb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.TestDao;
import com.lunchwb.vo.GroupVo;

@Service
public class TestService {
	
	@Autowired
	TestDao testDao;
	
	public GroupVo getGroupName(int groupNo) {
		GroupVo groupName = testDao.getGroupName(groupNo);
		return groupName;
	}

}
