package com.lunchwb.dao;

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
	
}
