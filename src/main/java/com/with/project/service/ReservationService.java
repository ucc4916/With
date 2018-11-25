package com.with.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.ReservationDAO;
import com.with.project.vo.MemberVO;
import com.with.project.vo.RoomVO;

@Service
public class ReservationService {

	@Autowired
	private ReservationDAO rvDAO;
	private ModelAndView mav;
	
	public ModelAndView rservationRoomList(HttpSession session, RoomVO endRoom,HttpServletResponse response,MemberVO memvervo)throws IOException{
		mav = new ModelAndView();
		System.out.println("여기까지 온다 (서비스)");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = (String)session.getAttribute("id");
		//결제된 아이디를 찾는다.
		List<String> endroom = rvDAO.PayList2(id);
		//결제태이블에서 결제된 id 값을 찾아와
		ArrayList<RoomVO> endlist = new ArrayList<RoomVO>();
		
		
		
		List<RoomVO> endRoomid=rvDAO.endroomid(id);
		if(endRoomid.size()==0) {
			out.println("<script>");
			out.println("alert('예약한 방이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else {
			System.out.println("사이즈 찍어보기 : "+endroom.size());
			int j=0;
			for(int i=0; i<endroom.size(); i++) {
			
			int roomid = Integer.parseInt(endroom.get(i));
			//예약한 방은 dayday 컬럼이 비어있지 않아야하니까...
			//룸 번호를 찾는다
			RoomVO EndRoom = rvDAO.rservationRoomList(roomid);
			if(EndRoom == null) {
				System.out.println("null값...");
			}else {
				endlist.add(j, EndRoom);
				j++;
			}
			
			}
			System.out.println("사이즈:"+endlist.size());
			/*String test = "";
			if(endlist.get(0) == null) {
				 test = "null";
			}*/
			if(endlist.size() == 0) {
				out.println("<script>");
				out.println("alert('예약한 방이 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}
			System.out.println("?");
			System.out.println("서비스: "+endlist);
		}
		
		
		mav.addObject("reservationList", endlist);
		mav.setViewName("ReservationRoomList");
		
		return mav;
	}

}
