package com.lunchwb.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.RandomVo;

@Repository
public class RandomDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertRandomResult(RandomVo randomVo) {
		sqlSession.insert("random.insertRandomResult", randomVo);
		return randomVo.getRandomNo();
	}

}
