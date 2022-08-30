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
	
	
	/* 알림 개수 */
	public int notiCount(int userNo) {
		return sqlSession.selectOne("notification.notiCount", userNo);
	}
	
	
	/* 그룹 이름 변경 알림 */
	public int alertOfGroupChange(NotificationVo notiVo) {
		return sqlSession.insert("notification.alertOfGroupChange", notiVo);
	}
	
	/* 그룹원 알림 1/5/6/10 */
	public int addGroupNoti(NotificationVo notiVo) {
		return sqlSession.insert("notification.addGroupNoti", notiVo);
	}

	/* 그룹장 알림 2/3/4 */
	public int addLeaderNoti(NotificationVo notiVo) {
		return sqlSession.insert("notification.addLeaderNoti", notiVo);
	}
	
	/* 리뷰 삭제 알림 8 */
	public int addReportNoti(NotificationVo notiVo) {
		return sqlSession.insert("notification.addReportNoti", notiVo);
	}
	
	/* 문의 답변 알림 9 */
	public int addReplyNoti(NotificationVo notiVo) {
		return sqlSession.insert("notification.addReplyNoti", notiVo);
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
