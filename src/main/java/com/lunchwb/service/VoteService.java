package com.lunchwb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.GroupDao;
import com.lunchwb.dao.VoteDao;
import com.lunchwb.vo.GroupVo;

@Service
public class VoteService {
	
	@Autowired
	private VoteDao voteDao;
	@Autowired
	private GroupDao groupDao;
	
	public List<GroupVo> getVoteMember(int groupNo) {
		return groupDao.selectVoteMember(groupNo);
	}

}
