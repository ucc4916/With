package com.with.project.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.CreateRoomDAO;
import com.with.project.dao.PayDAO;
import com.with.project.vo.MemberVO;
import com.with.project.vo.PayVO;
import com.with.project.vo.RoomVO;

@Service
public class PayService {
	
	@Autowired
	private PayDAO payDAO;
	private ModelAndView mav;
	
	@Autowired
	private CreateRoomDAO crDAO;
	
	//room에서 결제 클릭
	public ModelAndView PayClick(String finalMoney, String roomId, HttpServletResponse response, HttpSession session) {
		mav = new ModelAndView();
		
		String id = (String)session.getAttribute("id");
		MemberVO memberVO = payDAO.UserPoint(id);
		
		mav.addObject("roomId", roomId);
		mav.addObject("finalMoney", finalMoney);
		mav.addObject("member", memberVO);
		mav.setViewName("Pay");
		
		return mav;
	}
	//포인트충전하기
	public ModelAndView AddPointPro(String point, HttpSession session, String roomId, String finalMoney,HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(point == null || point.equals("")) {
			out.println("<script>");
			out.println("alert('포인트를 입력해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		String id = (String)session.getAttribute("id");
		MemberVO memberVO = payDAO.UserPoint(id);
		int Point = Integer.parseInt(point);
		int MyPoint = memberVO.getPoint();
		MyPoint = MyPoint + Point;
		memberVO.setPoint(MyPoint);
		memberVO.setId(id);
		
		payDAO.UpdatePoint(memberVO);
		mav.addObject("member", memberVO);
		mav.addObject("roomId", roomId);
		mav.addObject("finalMoney", finalMoney);
		mav.addObject("point", point);
		mav.setViewName("Pay");
		
		return mav;
	}
	//충전페이지 이동
	public ModelAndView AddPoint(String finalMoney, String roomId) {
		mav = new ModelAndView();
		
		mav.addObject("roomId", roomId);
		mav.addObject("finalMoney", finalMoney);
		mav.setViewName("Point");
		return mav;
	}
	//진짜결제
	public ModelAndView PayPro(HttpSession session, PayVO payVO, String finalMoney, HttpServletResponse response,MemberVO memberVO) throws IOException {
		
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id = (String)session.getAttribute("id");
		
		int Point = memberVO.getPoint();
		int FinalMoney = Integer.parseInt(finalMoney);
		int Good = Point-FinalMoney;
		if(Good<0) {
			out.println("<script>");
			out.println("alert('포인트가 부족합니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {
			payVO.setId(id);
			PayVO payVO1 = payDAO.SelectPayTable(payVO);
			if(payVO1 == null) {
				//깎인돈으로 최신화한다.
				memberVO.setId(id);
				memberVO.setPoint(Good);
				payDAO.MemberPointUpdate(memberVO);
				//DB에 roomId와 회원 id 를 넣는다.
				//넣은 값을 다시 addObject안에  넣고
				payVO.setId(id);
				payDAO.InsertId(payVO);
				int roomId = payVO.getRoomId();
				//room page로 돌아간다.
				//payTable에 값이 있는지 확인해준다.
				PayVO payVO2 = payDAO.SelectPayTable(payVO);
				RoomVO roomVO = payDAO.PayAfterRoom(roomId);
				mav.addObject("pay", payVO2);
				mav.addObject("Room", roomVO);
				mav.setViewName("room");
			}else if(payVO1.getId().equals(id)) {
				out.println("<script>");
				out.println("alert('이미 결제 하셨습니당.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}else {
				//null 도 아니고 id가 같을 수는 없다 !!
			}
			
		}
		return mav;
	}
	//결제 취소
	public ModelAndView payCancel(HttpSession session, PayVO payVO) {
		mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		//paytable에 한줄 삭제!
		payVO.setId(id);
		payDAO.DelLine(payVO); 
		//finalmoney를 가져온다.
		int roomId = payVO.getRoomId();
		RoomVO roomVO = crDAO.FinalMoneyBring(roomId);
		//id에 포인트를 가져온다.
		MemberVO memberVO = crDAO.MemberGender(id);
		//그 돈 만큼 다시 해당 id에 포인트를 넣어준다.
		int RMoney = Integer.parseInt(roomVO.getFinalMoney());
		int MyMoney = memberVO.getPoint();
		MyMoney += RMoney;
		memberVO.setPoint(MyMoney);
		//다시 돈을 업데이트
		payDAO.UpdatePoint(memberVO);
		//RoomInfo
		mav.setViewName("redirect:RoomInfo?roomId="+roomId+"&opGender="+roomVO.getOpGender());
		
		
		return mav;
	}
	//reservation에서 클릭
	public ModelAndView PayClick2(String finalMoney, String roomId, HttpServletResponse response, HttpSession session) {
		mav = new ModelAndView();
		
		String id = (String)session.getAttribute("id");
		MemberVO memberVO = payDAO.UserPoint(id);
		
		mav.addObject("roomId", roomId);
		mav.addObject("finalMoney", finalMoney);
		mav.addObject("member", memberVO);
		mav.setViewName("Pay2");
		
		return mav;
	}
	//예약 진짜결제
	public ModelAndView PayPro2(HttpSession session, PayVO payVO, String finalMoney, HttpServletResponse response,
			MemberVO memberVO) throws IOException {
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id = (String)session.getAttribute("id");
		
		int Point = memberVO.getPoint();
		int FinalMoney = Integer.parseInt(finalMoney);
		int Good = Point-FinalMoney;
		if(Good<0) {
			out.println("<script>");
			out.println("alert('포인트가 부족합니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {
			//깎인돈으로 최신화한다.
			memberVO.setId(id);
			memberVO.setPoint(Good);
			payDAO.MemberPointUpdate(memberVO);
			//DB에 roomId와 회원 id 를 넣는다.
			//넣은 값을 다시 addObject안에  넣고
			payVO.setId(id);
			payDAO.InsertId(payVO);
			int roomId = payVO.getRoomId();
			//room page로 돌아간다.
			//payTable에 값이 있는지 확인해준다.
			PayVO payVO1 = payDAO.SelectPayTable(payVO);
			RoomVO roomVO = payDAO.PayAfterRoom(roomId);
			mav.addObject("pay", payVO1);
			mav.addObject("Room", roomVO);
			mav.setViewName("Reservation");
		}
		return mav;
	}
	public ModelAndView AddPoint2(String finalMoney, String roomId) {
		mav = new ModelAndView();
		
		mav.addObject("roomId", roomId);
		mav.addObject("finalMoney", finalMoney);
		mav.setViewName("Point2");
		return mav;
	}
	
	//예약 포인트 충전하기
	public ModelAndView AddPointPro2(String point, HttpSession session, String roomId, String finalMoney,HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(point == null || point.equals("")) {
			out.println("<script>");
			out.println("alert('포인트를 입력해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		
		String id = (String)session.getAttribute("id");
		MemberVO memberVO = payDAO.UserPoint(id);
		int Point = Integer.parseInt(point);
		int MyPoint = memberVO.getPoint();
		MyPoint = MyPoint + Point;
		memberVO.setPoint(MyPoint);
		memberVO.setId(id);
		
		payDAO.UpdatePoint(memberVO);
		mav.addObject("member", memberVO);
		mav.addObject("roomId", roomId);
		mav.addObject("finalMoney", finalMoney);
		mav.addObject("point", point);
		mav.setViewName("Pay2");
		
		return mav;
	}
	//예약 결제 취소
	public ModelAndView payCancel2(HttpSession session, PayVO payVO) {
		mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		//paytable에 한줄 삭제!
		payVO.setId(id);
		payDAO.DelLine(payVO); 
		//finalmoney를 가져온다.
		int roomId = payVO.getRoomId();
		RoomVO roomVO = crDAO.FinalMoneyBring(roomId);
		//id에 포인트를 가져온다.
		MemberVO memberVO = crDAO.MemberGender(id);
		//그 돈 만큼 다시 해당 id에 포인트를 넣어준다.
		int RMoney = Integer.parseInt(roomVO.getFinalMoney());
		int MyMoney = memberVO.getPoint();
		MyMoney += RMoney;
		memberVO.setPoint(MyMoney);
		//다시 돈을 업데이트
		payDAO.UpdatePoint(memberVO);
		//RoomInfo
		mav.setViewName("redirect:RoomInfo2?roomId="+roomId+"&opGender="+roomVO.getOpGender());
		return mav;
	}
	//카카오 api 가기
	public ModelAndView GoCacao(String point, HttpSession session, String roomId, String finalMoney) {
		mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		MemberVO memberVO = payDAO.UserPoint(id);
		
		payDAO.UpdatePoint(memberVO);
		mav.addObject("member", memberVO);
		mav.addObject("roomId", roomId);
		mav.addObject("finalMoney", finalMoney);
		mav.addObject("point", point);
		mav.setViewName("api");
		
		return mav;
	}
	public ModelAndView GoCacao2(String point, HttpSession session, String roomId, String finalMoney) {
		mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		MemberVO memberVO = payDAO.UserPoint(id);
		
		payDAO.UpdatePoint(memberVO);
		mav.addObject("member", memberVO);
		mav.addObject("roomId", roomId);
		mav.addObject("finalMoney", finalMoney);
		mav.addObject("point", point);
		mav.setViewName("api2");
		
		return mav;
	}
}
