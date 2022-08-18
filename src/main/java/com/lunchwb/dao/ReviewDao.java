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
	
	
	public List<ReviewVo> storeReviews(int storeNo){
		List<ReviewVo> reviewList = sqlSession.selectList("review.storeReviews", storeNo);
		return reviewList;
	}
	
	public List<ReviewVo> recentReview(int storeNo){
		List<ReviewVo> reviewList = sqlSession.selectList("review.recentReview", storeNo);
		return reviewList;
	}

}
