package com.with.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.RoomVO;

@Repository
public class DriverExpectedDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;


	public List<RoomVO> DriverExpected(RoomVO roomvo) {
		return sqlSession.selectList("With.DriverExpected", roomvo);
	}

}
