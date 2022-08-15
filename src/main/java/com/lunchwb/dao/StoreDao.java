package com.lunchwb.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.StoreVo;

@Repository
public class StoreDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	/* 가게 기본 정보 불러오기 */
	public StoreVo basicStoreInfo(int storeNo) {
		StoreVo StoreBasic = sqlSession.selectOne("store.basicStoreInfo", storeNo);
		return StoreBasic;
	}
	
	
	/* 가게 영업 시간 */
	/* 삭제 예정
	public Map<String, String> storeTime(int storeNo) {
		Map<String, String> map = sqlSession.selectOne("store.storeTime", storeNo);
		return map;
	}
	*/
}
