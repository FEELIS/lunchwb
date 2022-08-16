package com.lunchwb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.VisitedVo;

@Repository
public class VisitedDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// ================================ 달력 ================================
	// 이번달 방문장소
	public List<VisitedVo> getCalendar(VisitedVo vstVo){
		List<VisitedVo> calendarList = sqlSession.selectList("visited.calendar",vstVo); 
		
		
		return calendarList;
	};
	
	// ================================ 달력 끝 ================================
	
	
	/* 지니 */
	public VisitedVo recentVisit(VisitedVo visitedVo) {
		visitedVo = sqlSession.selectOne("visited.recentVisit", visitedVo);
		return visitedVo;
	}
	
	public VisitedVo recentMenu(int storeNo) {
		VisitedVo visitedVo = sqlSession.selectOne("visited.recentMenu", storeNo);
		return visitedVo;
	}
	

}
