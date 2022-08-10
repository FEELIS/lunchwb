package com.lunchwb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.GroupVo;

@Repository
public class GroupDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	/******************** 그룹 리스트 **********************************************/
	public List<GroupVo> userGroups(int userNo) {
		List<GroupVo> groupList = sqlSession.selectList("group.userGroups", userNo);
		return groupList;
	}
	
	/******************** 그룹 이름 *******************************************/
	public String selectedGpName(GroupVo groupVo) {
		String groupName = sqlSession.selectOne("group.selectedGpName", groupVo);
		return groupName;
	}
	
	/******************** 그룹 멤버 리스트 *******************************************/
	public List<GroupVo> groupMembers(int groupNo) {
		List<GroupVo> memberList = sqlSession.selectList("group.groupMembers", groupNo);
		return memberList;
	}
	
	/******************** 그룹 리더 ***********************************************/
	public int groupLeader(int groupNo) {
		int leader = sqlSession.selectOne("group.groupLeader", groupNo);
		return leader;
	}
	
	/******************** 그룹 생성 ***********************************************/
	public void createGroup(GroupVo groupVo) {
		sqlSession.insert("group.createGroup", groupVo);
	}
	
	/******************** 그룹 개수 ***********************************************/
	public int groupCount(int userNo) {
		int groupCount = sqlSession.selectOne("group.groupCount", userNo);
		return groupCount;
	}
	
	/******************** 그룹 순서 변경 ***********************************************/
	public int changeOrder(GroupVo groupVo) {
		int count = sqlSession.update("group.changeOrder", groupVo);
		return count;
	}
	
	/******************** 그룹 정보 변경(이름/리더) ***************************************/
	public int groupChange(GroupVo groupVo) {
		int count = sqlSession.update("group.groupChange", groupVo);
		return count;
	}
	
	/******************** 그룹 보스 유무 ***********************************************/
	public int beBoss(int groupNo) {
		int count = sqlSession.selectOne("group.beBoss", groupNo);
		return count;
	}
	
	/******************** 그룹 보스 삭제 ***********************************************/
	public void deleteBoss(int groupNo) {
		sqlSession.update("group.deleteBoss", groupNo);
	}
	
	/******************** 그룹 멤버 여부 ***********************************************/
	public int memberCheck(GroupVo groupVo) {
		int count = sqlSession.selectOne("group.memberCheck", groupVo);
		return count;
	}
	
	
	/******************** 그룹 멤버 추가 ***********************************************/
	public void addMember(GroupVo groupVo) {
		sqlSession.insert("group.addMember", groupVo);
	}
	
	/******************** 그룹 멤버 1명 정보(방금 추가한 멤버 정보 조회) *********************/
	public GroupVo memberInfo(int memberNo) {
		GroupVo memberInfo = sqlSession.selectOne("group.memberInfo", memberNo);
		return memberInfo;
	}
	
	/******************** 그룹 멤버 강퇴 ***********************************************/
	public int outMember(GroupVo groupVo) {
		int count = sqlSession.delete("group.outMember", groupVo);
		return count;
	}
	
	/******************** 그룹 순서 조정(선택 변경x) **************************************/
	public void autoOrder(GroupVo groupVo) {
		sqlSession.update("group.autoOrder", groupVo);
	}
	
	/******************** 장바구니 그룹 선택 ***********************************************/
	public List<GroupVo> selectBasketGroup(int userNo) {
		List<GroupVo> basketGroup = sqlSession.selectList("group.selectBasketGroup", userNo);
		return basketGroup;
	}
}
