package com.with.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.RoomVO;

@Repository
public class ReservationDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<String> PayList2(String id) {
		return sqlSession.selectList("With.PayList2", id);
	}
	public RoomVO rservationRoomList(int roomid) {
		return sqlSession.selectOne("With.rservationRoomList", roomid);
	}
	public List<RoomVO> endroomid(String id) {
		return sqlSession.selectList("With.endroomid", id);
	}

}
