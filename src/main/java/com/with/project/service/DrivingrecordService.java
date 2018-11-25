package com.with.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.DrivingrecordDAO;
import com.with.project.vo.endRoomVO;

@Service
public class DrivingrecordService {
	@Autowired
	private  DrivingrecordDAO drDAO;
	private ModelAndView mav;
	
	
	
	public ModelAndView drivingrecord(HttpSession session, endRoomVO endRoomVO, HttpServletResponse response) throws IOException{
		mav = new ModelAndView();
		System.out.println("운행기록 서비스1");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		//String id = (String)session.getAttribute("id");
		
			List<endRoomVO> endroom = drDAO.drivingrecord(endRoomVO);
		
				if(endroom.size() != 0) {
				mav.addObject("endroomvo", endroom);
				mav.setViewName("Drivingrecord");
				System.out.println("운행기록 서비스2 IF문");
		}else {
			out.println("<script>");
			out.println("alert('운행 기록이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			System.out.println("운행기록 서비스3 else");
		}
		
		System.out.println("운행기록 서비스4");
		return mav;
	}
	
}
