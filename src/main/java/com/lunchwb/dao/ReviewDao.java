package com.lunchwb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.ReviewVo;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<ReviewVo> recentReviews(int storeNo){
		List<ReviewVo> reviewList = sqlSession.selectList("review.recentReviews", storeNo);
		return reviewList;
	}

}
