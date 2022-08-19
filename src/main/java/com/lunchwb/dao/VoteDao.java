package com.lunchwb.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.VoteVo;

@Repository
public class VoteDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	// 로그인 안한 사용자가 투표No 가지고 접근 시
	public Integer selectGuestVoteState(int voteNo) {
		return sqlSession.selectOne("vote.selectGuestVoteState", voteNo);
	}
	
	
	// 로그인 한 사용자 투표중인지 확인
	public Integer selectMemberVoteState(int userNo) {
		return sqlSession.selectOne("vote.selectMemberVoteState", userNo);
	}
	
	
	// 투표생성하기(생성된 voteNo 리턴)
	public int insertNewVote(VoteVo voteMakeItems) {
		sqlSession.insert("vote.insertNewVote", voteMakeItems);
		
		return voteMakeItems.getVoteNo();
	}
	
	
	// 투표 멤버 insert
	public int insertVoteMember(Map<String, Object> voteMems) {
		return sqlSession.insert("vote.insertVoteMember", voteMems);
	}
	
}
