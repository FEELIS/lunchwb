package com.lunchwb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.StoreVo;

@Repository
public class BasketDao {

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<StoreVo> guestBasketPut() {
		List<StoreVo> basket = sqlSession.selectList("basket.guestBasketSelect");
		
		return basket;
	}
}
