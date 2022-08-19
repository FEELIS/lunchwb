package com.lunchwb.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VoteDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	public Integer selectGuestVoteState(int voteNo) {
		return sqlSession.selectOne("vote.selectGuestVoteState", voteNo);
	}
	
	public Integer selectMemberVoteState(int userNo) {
		return sqlSession.selectOne("vote.selectMemberVoteState", userNo);
	}
}
