package com.lunchwb.dao;

import java.util.List;
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
	public Integer selectMemberVoteNo(int userNo) {
		return sqlSession.selectOne("vote.selectMemberVoteNo", userNo);
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
	
	
	// voteAside 정보 가져오기
	public List<VoteVo> selectVoteInfo(int voteNo) {
		return sqlSession.selectList("vote.selectVoteInfo", voteNo);
	}
	
	
	// guest 동일ip 투표 여부 확인
	public Integer selectGuestVoted(Map<String, Object> map) {
		return sqlSession.selectOne("vote.selectGuestVoted", map);
	}
	
	
	// 투표 현황 불러오기
	public String selectVoteResults(int voteNo) {
		return sqlSession.selectOne("vote.selectVoteResults", voteNo);
	}
	
	
	// 투표 결과 업데이트
	public void updateVoteResults(VoteVo voteResults) {
		sqlSession.update("vote.updateVoteResults", voteResults);
	}
	
	
	// voteVoted 업데이트
	public void updateVoteVoted(VoteVo myVote) {
		sqlSession.update("vote.updateVoteVoted", myVote);
	}
	
	
	// 투표 현황
	public VoteVo currVote(int voteNo) {
		return sqlSession.selectOne("vote.currVote", voteNo);
	}
	
	
	// 투표 종료 > voteState 업데이트
	public int updateVoteEnd(int voteNo) {
		return sqlSession.update("vote.updateVoteEnd", voteNo);
	}
	
	
	// 투표 종료 > userState 업데이트
	public int updateUserEnd(int voteNo) {
		return sqlSession.update("vote.updateUserEnd", voteNo);
	}
}
