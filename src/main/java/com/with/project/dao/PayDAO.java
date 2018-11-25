package com.with.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.MemberVO;
import com.with.project.vo.PayVO;
import com.with.project.vo.RoomVO;

@Repository
public class PayDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//유저 포인트값 가져오기
	public MemberVO UserPoint(String Id) {
		
		return sqlSession.selectOne("With.UserPoint", Id);
	}
	//포인트 업데이트하기
	public void UpdatePoint(MemberVO memberVO) {
		
		sqlSession.update("With.UpdatePoint", memberVO);
	}
	//결제후 방으로
	public RoomVO PayAfterRoom(int roomId) {
		
		return sqlSession.selectOne("With.PayAfterRoom", roomId);
	}
	//pay 테이블에 id값들 넣기
	public void InsertId(PayVO payVO) {
		sqlSession.insert("With.InsertId", payVO);
		
	}
	//다시 깎은 가격 업데이트
	public void MemberPointUpdate(MemberVO memberVO) {
		sqlSession.update("With.MemberPointUpdate", memberVO);
		
	}
	//SelectPayTable 테이블에 있는거 가져오기
	public PayVO SelectPayTable(PayVO payVO) {
		
		return sqlSession.selectOne("With.SelectPayTable", payVO);
	}
	//PayTable에서 한 줄 삭제
	public void DelLine(PayVO payVO) {
		sqlSession.delete("With.DelLine", payVO);
		
	}
	public void InsertDrvier(PayVO payVO) {
		sqlSession.insert("With.InsertDrvierPay", payVO);
		
	}


}
