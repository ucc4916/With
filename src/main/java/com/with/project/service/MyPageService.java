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

import com.with.project.dao.MyPageDAO;
import com.with.project.vo.MemberVO;
import com.with.project.vo.endRoomVO;

@Service
public class MyPageService {

	@Autowired
	private MyPageDAO mpDAO;
	private ModelAndView mav;

	

	public ModelAndView mypageList(HttpSession session,endRoomVO endRoom,HttpServletResponse response,MemberVO memvervo) throws IOException{
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = (String)session.getAttribute("id");
		ArrayList<endRoomVO> list = new ArrayList<endRoomVO>();
		System.out.println("여기까지는 오니?");
		//해당 아이디 결제된 룸 번호를 찾음
		
		//쿼리문을 넘겨서 가져와
		
		List<endRoomVO> endrid=mpDAO.EndrId(id);
		System.out.println(endrid);
		
		if(endrid.size() == 0) {
			System.out.println("endId"+endrid);
			out.println("<script>");
			out.println("alert('이용한 기록이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		
		else {
			//List<String> roomid = mpDAO.PayRoomId(id);
			for(int i=0; i<endrid.size(); i++) {
				int roomIdReal = endrid.get(i).getEroomId();
				endRoomVO endRoom1 = mpDAO.EndRoomSelect(roomIdReal);
				list.add(i,endRoom1);
				System.out.println(endRoom1.getEfinalMoney());
		}
		}
		
		System.out.println("여이가 그 서비스라는 곳이니?");
		System.out.println("리스트: "+list);
		
		mav.addObject("mypagelist",list);
		mav.setViewName("MyPageList");
		
		
		
		return mav;
	}
}
