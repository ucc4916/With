package com.with.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.with.project.vo.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	//기사 회원가입
	public int DriverJoin(MemberVO memberVO) {
		return sqlSession.insert("With.DriverJoin", memberVO);
	}
	//유저 회원가입
	public int UserJoin(MemberVO memberVO) {
		return sqlSession.insert("With.UserJoin", memberVO);
	}
	//로그인
	public MemberVO Login(MemberVO memberVO) {
		return sqlSession.selectOne("With.Login", memberVO);
				
	}
	//로그인후 메인으로 갈때 기사인지 유저인이 확인하는 값 가져오기
	public MemberVO MemberMain(String id) {
		return sqlSession.selectOne("With.Main", id);
	}
	//비밀번호 확인후 값 가져오기
	public MemberVO UserAlterInfo(MemberVO memberVO) {
		
		return sqlSession.selectOne("With.Login",memberVO );
	}
	//유저정보 변경!
	public int UserInfoUpdate(MemberVO memberVO) {
		
		return sqlSession.update("With.UserUpdate", memberVO);
	}
	//운전자정보 변경!
	public int DriverInfoUpdate(MemberVO memberVO) {
		
		return sqlSession.update("With.DriverUpdate",memberVO);
	}
	//아이디 중복확인
	public MemberVO idOverlap(String id) {
		
		return sqlSession.selectOne("With.idOverlap", id);
	}
	
	
	//이메일 중복확인
	public MemberVO EmailOverlap(String email) {
		return sqlSession.selectOne("With.EmailOverlap", email);
	}
	
	public MemberVO mailSender(MemberVO memberVO) {
		return sqlSession.selectOne("With.FindId", memberVO);
	}
	public MemberVO SelectFindId(MemberVO selectmemberVO) {
		return sqlSession.selectOne("With.SelectFindId", selectmemberVO);
	}
	public MemberVO SelectFindPs(MemberVO selectmemberVO) {
		return sqlSession.selectOne("With.SelectFindPs", selectmemberVO);
	}
	public MemberVO FindPsPro(MemberVO memberVO) {
		return sqlSession.selectOne("With.FindPsPro", memberVO);
	}
	public int ChangePsPro(MemberVO memberVO) {
		return sqlSession.update("With.ChangePsPro", memberVO);
	}
	public int LicenseUpload(MemberVO memberVO) {

		return sqlSession.update("With.LicenseUpload",memberVO);
	}
	public List<MemberVO> MemberList() {
		return sqlSession.selectList("With.MemberList");
	}
	public MemberVO MemberDetail(String Id) {
		
		return sqlSession.selectOne("With.MemberDetail",Id);
	}
	public int MemberDelete(String id) {
		
		return sqlSession.delete("With.MemberDel", id);
	}
	public List<MemberVO> DriverApproval() {
		return sqlSession.selectList("With.DriverList");
	}
	public MemberVO DriverDetail(String id) {
		return sqlSession.selectOne("With.DriverDetail",id);
	}
	public int DriverAuthorityApproval(String id) {
		 return sqlSession.update("With.DriverAuthorityApproval",id);
   }
	//정보변경
	public int DriverInfoUpdateLisence(MemberVO memberVO) {
		System.out.println("봅");
		return sqlSession.update("With.DriverUpdateLisence",memberVO);
	}
	public int ExistingDriverInfoAlter(MemberVO memberVO) {
		return sqlSession.update("With.ExistingDriverInfoAlter",memberVO);
	}
	
	

	

	
}
