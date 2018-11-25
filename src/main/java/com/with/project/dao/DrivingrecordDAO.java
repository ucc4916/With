package com.with.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.endRoomVO;

@Repository
public class DrivingrecordDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<endRoomVO> drivingrecord(endRoomVO endRoomVO) {

		return sqlSession.selectList("With.drivingrecord", endRoomVO);
	}
	
}
