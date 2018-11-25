package com.with.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.endRoomVO;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;


	public List<String> PayRoomId(String id) {
		
		return sqlSession.selectList("With.PayRoomId", id);
	}


	//endRoomVo
	public endRoomVO EndRoomSelect(int eRoomid) {
		return sqlSession.selectOne("With.EndRoomSelect", eRoomid);
	}


	public List<endRoomVO> EndrId(String id) {
		return sqlSession.selectList("With.EndrId", id);
	}
}
