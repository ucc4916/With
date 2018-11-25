package com.with.project.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.MemberVO;
import com.with.project.vo.PayVO;
import com.with.project.vo.RoomVO;
import com.with.project.vo.endRoomVO;

@Repository
public class CreateRoomDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//방만들기할때 RoomId max 값 가져오기
	public String MaxId() {
		
		return sqlSession.selectOne("With.RoomId");
	}
	//처음에 방만들기
	public int CreateRoom(RoomVO roomVO) {
		
		return sqlSession.insert("With.CreateRoom", roomVO);
	}
	//처음에 방만들고 값 불러오기
/*	public RoomVO RoomList(int insertRoomId) {
		
		return sqlSession.selectOne("With.RoomList", insertRoomId);
	}
*/
	//방만들기
	public int CreateRealRoom(RoomVO roomVO) {
		
		return sqlSession.update("With.CreateRealRoom", roomVO);
	}
	//방 아이디 값으로 방찾기
	public RoomVO SelectRoom(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.SelectRoom", roomVO);
	}
	//예약 방
	public int ReservationRoom(RoomVO roomVO) {
		
		return sqlSession.update("With.ReservationRoom", roomVO);
	}
	//계산한 FinalMoney 값 넣기
	public void CreateRealRoom2(RoomVO roomVO) {
		sqlSession.update("With.CreateRealRoom2", roomVO);
		
	}
	//방 목록
	public List<RoomVO> RoomList() {
		
		return sqlSession.selectList("With.RoomList");
	}
	//Id1 찾기
	public String SelectId1(RoomVO roomVO) {

		return sqlSession.selectOne("With.Id1", roomVO);
	}
	//Id1 업데이트 하기
	public void UpdateId1(RoomVO roomVO) {
		
		sqlSession.update("With.UpdateId1", roomVO);
	}
	//진짜 상세보기 페이지!
	public RoomVO RoomInfo(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.RoomInfo", roomVO);
	}
	//Id2 찾기
	public String SelectId2(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.Id2", roomVO);
	}
	//Id2 업데이트 하기
	public void UpdateId2(RoomVO roomVO) {
		sqlSession.update("With.UpdateId2", roomVO);
	}
	//Id3 찾기
	public String selectId3(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.Id3", roomVO);
	}
	//Id3 업데이트하기
	public void UpdateId3(RoomVO roomVO) {
		sqlSession.update("With.UpdateId3", roomVO);
		
	}
	//Id4 찾기
	public String selectId4(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.Id4", roomVO);
	}
	//Id4 업데이트하기
	public void UpdateId4(RoomVO roomVO) {
		sqlSession.update("With.UpdateId4", roomVO);
	}
	
	//방에 들어갈 최대인원 
	public String selectMax(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.SelectMax", roomVO);
	}
	//id1,id2,id3,id4 값을 가져오기위한 메소드!!
	public RoomVO RoomOutList(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.SelectOut", roomVO);
	}
	//자신의 아이디가 첫번째(방장)일때 방을 삭제한다.
	public int RoomOutListDel(RoomVO roomVO) {
		return sqlSession.delete("With.RoomDel",roomVO);
		
	}
	//rId2 위치에 자신의 아이디가 있을때 
	public void RoomOutRid2(RoomVO roomVO) {
		sqlSession.update("With.RoomOutRid2", roomVO);
		
	}
	//rId3 위치에 자신의 아이디가 있을때
	public void RoomOutRid3(RoomVO roomVO) {
		sqlSession.update("With.RoomOutRid3", roomVO);
		
	}
	//rId4 위치에 자신의 아이디가 있을때
	public void RoomOutRid4(RoomVO roomVO) {
		sqlSession.update("With.RoomOutRid4", roomVO);
		
	}
	//세션에 있는 아이디 값으로 성별 가져오기
	public MemberVO MemberGender(String Id) {
		
		return sqlSession.selectOne("With.MemberGender", Id);
	}
	//room의 성별 옵션 가져오기
	public RoomVO roomS(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.RoomGender", roomVO);
	}
	//방에서 기사아이디 가져오기
	public String SelectDriverId(RoomVO roomVO) {
		
		return sqlSession.selectOne("With.SelectDriverId", roomVO);
	}
	//방에 기사가 없으면 기사입장~
	public void UpdateDriverId(RoomVO roomVO) {
		sqlSession.update("With.UpdateDriver", roomVO);
		
	}
	//기사가 방을 나갈때
	public void RoomOutDriver(RoomVO roomVO) {
		sqlSession.update("With.RoomOutDriver", roomVO);
	}
	//기사정보를 보고싶을때
	public MemberVO DriverInfo(String Id) {
		return sqlSession.selectOne("With.DriverInfo", Id);
	}
	//방 정보가져오기
	public RoomVO FinalMoneyBring(int roomId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("With.FinalMoneyBring", roomId);
	}
	//OkChash 찾기
	public String SelectOkChash(PayVO payVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("With.SelectOkChash", payVO);
	}
	public List<RoomVO> RoomList2() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("With.RoomList2");
	}
	public List<PayVO> PayList(int roomId) {
		
		return sqlSession.selectList("With.PayList", roomId);
	}
	
	public void EndRoomInsert(endRoomVO endRoom) {
		sqlSession.insert("With.EndRoomInsert", endRoom);
		
	}
	//방만들기할때 RoomId max 값 가져오기 (EndRoom)
	public String MaxEid() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("With.EndRoomId");
	}
}
