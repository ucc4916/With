package com.with.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.DriverExpectedDAO;
import com.with.project.vo.RoomVO;

@Service
public class DriverExpected {
	@Autowired
	private DriverExpectedDAO deDAO;
	private ModelAndView mav;
	

	
	public ModelAndView DriverExpected2(HttpSession session, RoomVO roomvo, HttpServletResponse response)
			throws IOException {
		
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		System.out.println("서비스 컴온");
		System.out.println("roomVO DriverID" +roomvo.getDriverId() );
		//세션
		String id =(String)session.getAttribute("id");
		
		//기사가 예약 누르면 해당 아이디에 예약추가
		//기사 아이디,roomid
		//
		if(id==roomvo.getDriverId()) {
			List<RoomVO> room = deDAO.DriverExpected(roomvo);
				mav.addObject("roomlist", room);
				mav.setViewName("DriverExpected");
				System.out.println("기사 운행예정 IF");
		}else {
			out.println("<script>");
			out.println("alert('운행 예정이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		System.out.println("여기좀 ");
		return mav;
	}
	
}
