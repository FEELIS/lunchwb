package com.lunchwb.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.NotificationVo;

@Repository
public class NotiDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	/* 그룹 이름 변경 알림 */
	public int alertOfGroupChange(NotificationVo notiVo) {
		return sqlSession.insert("notification.addNoti", notiVo);
	}
	
	/* 개인 알림 */
	public int addNoti(Map<String, Object> map) {
		return sqlSession.insert("notification.addNoti", map);
	}
	
	/* 그룹원 리스트 : 초대중인 멤버 수 */
	public int membersInvitedCount(int groupNo) {
		return sqlSession.selectOne("notification.membersInvitedCount", groupNo);
	}
	
	
	/* 초대 중 여부 확인 */
	public int alreadyInvite(Map<String, Object> map) {
		return sqlSession.selectOne("notification.alreadyInvite", map);
	}
	
	

}
