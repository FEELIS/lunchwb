package com.lunchwb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lunchwb.vo.AloneVo;

@Repository
public class AloneDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<AloneVo> reviewList(int userNo) {
		List<AloneVo> reviewList = sqlSession.selectList("alone.reviewList", userNo);
		
		return reviewList;
	};
	
	public int delReview(int reviewNo) {
		System.out.println("Dao: "+reviewNo);
		int count = sqlSession.delete("alone.deleteReview",reviewNo);
		
		return count;
	};
	
	public AloneVo getReview(int reviewNo) {
		AloneVo aloneVo = sqlSession.selectOne("alone.getReview", reviewNo);
	
		return aloneVo;
		
	};
	

}
