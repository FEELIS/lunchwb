package com.lunchwb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.VoteDao;

@Service
public class VoteService {
	
	@Autowired
	private VoteDao voteDao;

}
