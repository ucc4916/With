package com.with.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.service.CreateRoomService;
import com.with.project.service.DriverExpected;
import com.with.project.service.DrivingrecordService;
import com.with.project.service.GradeService;
import com.with.project.service.MemberService;
import com.with.project.service.MyPageService;
import com.with.project.service.PayService;
import com.with.project.service.ReservationService;
import com.with.project.vo.MemberVO;
import com.with.project.vo.PayVO;
import com.with.project.vo.RoomVO;
import com.with.project.vo.endRoomVO;

@Controller
public class HomeController {

	@Autowired
	private MyPageService mps;
	
	@Autowired
	private ReservationService rvs;
	
	@Autowired
	private MemberService ms;
	private ModelAndView mav;

	@Autowired
	private CreateRoomService crs;
	
	@Autowired
	private PayService ps;

	@Autowired
	private HttpSession session;
	
	@Autowired
	private GradeService gsv;
	
	@Autowired
	private DriverExpected des;

	@Autowired
	private DrivingrecordService drs;
	
	// 서버 실행 시켰을때
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	/*//메인 페이지로 이동2
	@RequestMapping(value = "/homes", method = RequestMethod.GET)
	public String homes() {
		return "home";
	}*/

	// 메인 페이지로 이동
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home2(HttpSession ssesion) {
		mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		mav = ms.LoginMemberMain(id);

		return mav;
	}

	// 유저 마이페이지 JSP로 이동
	@RequestMapping(value = "/UserMyPage", method = RequestMethod.GET)
	public String UserMyPage() {
		return "UserMyPage";

	}

	// 기사 마이페이지 JSP로 이동
	@RequestMapping(value = "/DriverMyPage", method = RequestMethod.GET)
	public String DriverMyPage() {
		return "DriverMyPage";

	}

	// 유저 회원가입 JSP로 이동
	@RequestMapping(value = "/UserJoin", method = RequestMethod.GET)
	public String UserJoin() {
		return "UserJoin";
	}

	// 기사 회원가입 JSP로 이동
	@RequestMapping(value = "/DriverJoin", method = RequestMethod.GET)
	public String DriverJoin() {
		return "DriverJoin";
	}

	// 기사 회원가입
	@RequestMapping(value = "/DriverJoinPro", method = RequestMethod.GET)
	public ModelAndView DriverJoinPro(@ModelAttribute MemberVO memberVO) throws IOException {
		mav = new ModelAndView();
		mav = ms.DriverJoin(memberVO);
		return mav;
	}

	// 회원가입 id 중복확인
	@RequestMapping(value = "idOverlap", method = RequestMethod.POST)
	public void idOverlap(HttpServletResponse response, @RequestParam("id") String id) throws IOException {
		ms.idOverlap(id, response);
	}
	
	// 이메일 id 중복확인
	@RequestMapping(value = "EmailOverlap", method = RequestMethod.POST)
	public void EmailOverlap(HttpServletResponse response, @RequestParam("Email") String Email) throws IOException {
		ms.EmailOverlap(Email, response);
			}
		
	// 유저 회원가입
	@RequestMapping(value = "/UserJoinPro", method = RequestMethod.GET)
	public ModelAndView UserJoinPro(@ModelAttribute MemberVO memberVO) {
		mav = new ModelAndView();
		mav = ms.UserJoin(memberVO);
		return mav;
	}

	// 로그인 jsp로 이동
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String Login() {
		return "LoginForm";
	}

	// 로그인
	@RequestMapping(value = "/Loginpro", method = RequestMethod.POST)
	public ModelAndView LoginForm(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		mav = ms.Login(memberVO, response);

		return mav;
	}

	// 로그아웃
	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public String Logout() {
		session.removeAttribute("id");
		return "home";
	}

	// 유저 정보 변경 하기 전 비밀번호 확인 JSP
	@RequestMapping(value = "/PasswordForm", method = RequestMethod.GET)
	public String PasswordForm() {
		return "PasswordForm";
	}

	// 유저 정보 변경 하기 전 비밀번호 확인 후 유저정보 가져오기!
	@RequestMapping(value = "/PasswordFormPro", method = RequestMethod.GET)
	public ModelAndView PasswordFormPro(@ModelAttribute MemberVO memberVO, HttpSession session,
			HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		memberVO.setId(id);
		mav = ms.PasswordFormPro(memberVO, response);
		return mav;
	}

	// 유저정보 변경(실질적인 변경임)
	@RequestMapping(value = "/UserInfoAlter", method = RequestMethod.POST)
	public ModelAndView UserInfoAlter(HttpSession session, @ModelAttribute MemberVO memberVO) {
		mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		memberVO.setId(id);
		mav = ms.UserInfoAlter(memberVO);

		return mav;
	}


	// 운전자 정보 변경(실질적변경)
	@RequestMapping(value = "/DriverInfoAlter", method = RequestMethod.POST)
	public ModelAndView DriverInfoAlter(HttpSession session, @ModelAttribute MemberVO memberVO) throws IOException {
		String Lisence = memberVO.getLisence();
		mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		memberVO.setId(id);
	    MultipartFile file = memberVO.getFile();
	    String testname = file.getOriginalFilename();
	    System.out.println("testname"+testname);
		if (testname.equals("")) {
		memberVO.setCertificate(Lisence);
		mav = ms.ExistingDriverInfoAlter(memberVO);
		}
			if (!file.isEmpty()) {
			String FileName = file.getOriginalFilename();
			file.transferTo(new File("D:\\Spring\\WithProject_0.1.0\\src\\main\\webapp\\resources\\" + FileName));
			memberVO.setCertificate(file.getOriginalFilename());
			mav = ms.DriverInfoAlter(memberVO);
			
			}
			return mav;
			
	}

	
	//라이센스 등록
	@RequestMapping(value = "/LicenseUpload", method = RequestMethod.POST)
	public ModelAndView LicenseUpload(HttpSession session,@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		memberVO.setId(id);	
		MultipartFile file = memberVO.getFile();
		if (!file.isEmpty()) {
			String FileName = file.getOriginalFilename();
			file.transferTo(new File("D:\\Spring\\WithProject_0.1.0\\src\\main\\webapp\\resources\\"+FileName));
		}
		memberVO.setCertificate(file.getOriginalFilename());
		
		mav = ms.LicenseUpload(memberVO, response);
		return mav;
	}
	
	//이메일 체크기능 (유저)
	@RequestMapping(value = "/EmailCheck", method = RequestMethod.GET)
	public ModelAndView MailJoin(HttpSession session, HttpServletRequest request, @ModelAttribute MemberVO memberVO)
    throws MessagingException {	
		mav = new ModelAndView();
		mav = ms.MailJoin(memberVO);	  	    
		return mav;
	}
	
	//이메일체크기능 (기사)
	@RequestMapping(value = "/CheckDriver", method = RequestMethod.GET)
	public ModelAndView EmailCheckDriver(HttpSession session, HttpServletRequest request, @ModelAttribute MemberVO memberVO) throws MessagingException {	
		mav = new ModelAndView();
		mav = ms.EmailCheckDriver(memberVO);	
		return mav;
	}
	
	@RequestMapping(value = "/FindIdPro", method = RequestMethod.GET)
	public ModelAndView mailSender(HttpSession session, HttpServletRequest request, @ModelAttribute MemberVO memberVO) throws MessagingException {	
		mav = new ModelAndView();
		mav = ms.mailSender(memberVO);	  	    
		return mav;
	}
	
	//이메일 인증
		@RequestMapping(value = "SelectFindId",method=RequestMethod.POST)
		public void SelectFindId(HttpServletResponse response, @ModelAttribute MemberVO selectmemberVO) throws IOException {
			ms.SelectFindId(selectmemberVO,response);
		}
		
	//핸드폰 인증
		@RequestMapping(value = "SelectFindPs",method=RequestMethod.POST)
		public void SelectFindPs(HttpServletResponse response, @ModelAttribute MemberVO selectmemberVO) throws IOException {
			ms.SelectFindPs(selectmemberVO,response);
		}
		
		@RequestMapping(value = "/FindPsPro", method = RequestMethod.GET) 
		public ModelAndView FindPsPro(HttpSession session, HttpServletRequest request, @ModelAttribute MemberVO memberVO) 
				throws MessagingException {	
			mav = new ModelAndView();	
			mav = ms.FindPsPro(memberVO);	  	   
			return mav;
			
		}
		
		//비밀번호 바꾸기	
		@RequestMapping(value = "/ChangePsPro", method = RequestMethod.GET)
		public ModelAndView ChangePsPro(HttpSession session, HttpServletRequest request, @ModelAttribute MemberVO memberVO) 
		throws IOException {
			mav = new ModelAndView();
			mav = ms.ChangePsPro(memberVO);
			return mav;
		}
		
		
		//관리자가 보는 멤버들
		@RequestMapping(value ="/MemberInfomation", method = RequestMethod.GET)
		public ModelAndView MemberInfomation(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws IOException {
			mav = new ModelAndView();
			mav = ms.MemberInformaion(memberVO);
			
			return mav;	
		}
		
		
		//멤버 상세보기
		@RequestMapping(value = "/MemberDetail", method = RequestMethod.GET)
		public ModelAndView MemberDetail(@RequestParam("id") String id) {
			System.out.println("memberdelete String값"+id);
			mav = new ModelAndView();
			mav = ms.MemberDetail(id);
			return mav;
		}
		
		
		//멤버 삭제
		@RequestMapping(value = "/MemberDelete", method = RequestMethod.GET)
		public ModelAndView MemberDelete(@RequestParam("id") String id) {
			System.out.println("memberdelete String값"+id);
			mav = new ModelAndView();
			mav = ms.MemberDelete(id);
			return mav;
		}
		
		//승인 대기중인 기사보기
		@RequestMapping(value = "/DriverApproval", method = RequestMethod.GET)
		public ModelAndView DriverApproval(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws IOException {
			mav = new ModelAndView();
			mav = ms.DriverApproval(memberVO);	
			
			return mav;
		}
		
		//어드민 드라이버 상세보기
		@RequestMapping(value = "/DriverDetail", method = RequestMethod.GET)
		public ModelAndView DriverDetail(@RequestParam("id") String id) {
			System.out.println("DriverDetail String값"+id);
			mav = new ModelAndView();
			mav = ms.DriverDetail(id);
			return mav;
		}
		
		//어드민이 드라이버 자격 승인하기 
		@RequestMapping(value = "/DriverAuthorityApproval", method = RequestMethod.GET)
		public ModelAndView DriverAuthorityApproval(@RequestParam("id") String id) {
			System.out.println("DriverDetail String값"+id);
			mav = new ModelAndView();
			mav = ms.DriverAuthorityApproval(id);
			return mav;
		}
		
		
		
		@RequestMapping(value = "/CodeSuccess", method = RequestMethod.GET)
			public String CodeSuccess() {
				return "ChangePs";
			}
		

	
	//아이디 찾기 페이지 이동
	@RequestMapping(value = "/findid", method = RequestMethod.GET)
	public String findid() {
		return "FindId";

			} 
	
	//비밀번호 찾기 페이지 이동
			@RequestMapping(value = "/findps", method = RequestMethod.GET)
			public String findps() {
				return "Findps";

			} 
			
	//라이센스 페이지 이동 		
			@RequestMapping(value = "/License", method = RequestMethod.GET)
			public String License() {
				return "License";
			}
			
	//관리자페이지
			
			@RequestMapping(value = "/AdminHome", method = RequestMethod.GET)
			public String AdminHome() {
				return "AdminHome";
			}
			
		
	
	// 지도가기
	@RequestMapping(value = "/maps", method = RequestMethod.GET)
	public String maps() {
		return "Maps";

	}

	// SearchMap
	@RequestMapping(value = "/SearchMap", method = RequestMethod.GET)
	public String SearchMap() {
		return "SearchMap";

	}

	// Search2Map test!!
	@RequestMapping(value = "/Search2Map", method = RequestMethod.GET)
	public String Search2Map() {
		return "Search2Map";

	}

	// 맵다시띄우기ReStart
	@RequestMapping(value = "/ReStart", method = RequestMethod.GET)
	public String ReStart() {
		return "Maps";

	}

	// UserStart 유저 시작 눌렀을때
	@RequestMapping(value = "/UserStart", method = RequestMethod.GET)
	public ModelAndView UserStart(HttpSession session,HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		mav = ms.UserPass(session,response);
		return mav;
	}
	//DriverStart 드라이버 시작 눌렀을때
	@RequestMapping(value = "/DriverStart", method = RequestMethod.GET)
	public ModelAndView DriverStart(HttpSession session,HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		mav = ms.DriverStart(session,response);
		return mav;
	}

	// CreateRoom 방 만들기
	@RequestMapping(value = "/CreateRoom", method = RequestMethod.GET)
	public ModelAndView CreateRoom(@ModelAttribute RoomVO roomVO, HttpSession session,HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 전부 찍힘
		/*
		 * System.out.println(roomVO.getRStart()); System.out.println(roomVO.getREnd());
		 * System.out.println(roomVO.getPreDistance());
		 * System.out.println(roomVO.getPreMoney());
		 * System.out.println(roomVO.getPreTime());
		 */
		// 테이블에 있는거 가져와서 max(넘버값) +1 시켜서

		String id = (String) session.getAttribute("id");
		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인을 해주세용!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		if(roomVO.getPreDistance().equals("undefined")) {
			out.println("<script>");
			out.println("alert('경로를 먼저 검색해주세요!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		// 방 초기에 만들때는 Rid1에 방장의 아이디 값이 들어간다.
		roomVO.setrId1(id);
		mav = crs.CreateRoom(roomVO);

		// 만들기니까 무조건 id1번에 세션값 넣으면 됨!
		return mav;

	}
	//방 진짜로 만들기
	@RequestMapping(value = "/CreateRealRoom", method = RequestMethod.POST)
	public ModelAndView CreateRealRoom(@ModelAttribute RoomVO roomVO, HttpSession session,@RequestParam("gender") String gender,HttpServletResponse response) {
		mav = new ModelAndView();
		//opGender
		//maximum
		response.setContentType("text/html;charset=UTF-8");
		/*System.out.println(gender);
		System.out.println(roomVO.getRoomId());
		System.out.println(roomVO.getMaximum());
		*/
		roomVO.setOpGender(gender);
		mav = crs.CreateRealRoom(roomVO, session);
		return mav;
	}
	//방 예약하기
	@RequestMapping(value = "/ReservationRoom", method = RequestMethod.POST)
	public ModelAndView ReservationRoom(@ModelAttribute RoomVO roomVO, @RequestParam("gender") String gender,@RequestParam("dayDay") String dayDay, @RequestParam("times") String times,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		mav = new ModelAndView();
		/*System.out.println(gender);
		System.out.println(dayDay);
		System.out.println(times);
		*/
		System.out.println(dayDay);
		if(dayDay == null || dayDay.equals("")) {
			out.println("<script>");
			out.println("alert('날짜를 선택해주세용.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		roomVO.setOpGender(gender);
		roomVO.setDayDay(dayDay);
		roomVO.setTimes(times);
		mav = crs.ReservationRoom(roomVO);
		
		return mav;
		
	}
	//예약룸 RoomList1 가즈아!
	@RequestMapping(value = "/RoomList1", method = RequestMethod.GET)
	public ModelAndView RoomList1() {
		mav = new ModelAndView();
		
		mav = crs.RoomList2();
		
		return mav;
		
	}
	
	//RoomList 방목록 불러오기
	@RequestMapping(value = "/RoomList", method = RequestMethod.GET)
	public ModelAndView RoomList() {
		mav = new ModelAndView();
		
		mav = crs.RoomList();
		
		return mav;
		
	}
	//RoomInfo 방 세부정보
	@RequestMapping(value = "/RoomInfo", method = RequestMethod.GET)
	public ModelAndView RoomInfo(@ModelAttribute RoomVO roomVO, HttpSession session,HttpServletResponse response,PayVO payVO) throws IOException {
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(roomVO.getOpGender().equals("")) {
			out.println("<script>");
			out.println("alert('방장이 방을 설정중입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		mav = crs.RoomInfo(roomVO, session,response,payVO);
		
		return mav;
		
	}
	//RoomOut 방나가기
	@RequestMapping(value = "/RoomOut", method = RequestMethod.GET)
	public ModelAndView RoomOut(@ModelAttribute RoomVO roomVO,HttpSession session, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		
		mav = crs.RoomOut(roomVO, session,response);
		
		return mav;
	}
	//DriverInfo 방에서 기사의 상세정보 보기 
	@RequestMapping(value = "/DriverInfo", method = RequestMethod.GET)
	public ModelAndView DriverInfo(@RequestParam("Id") String Id, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		
		mav = crs.RoomDriverInfo(Id);
		
		return mav;
	}
	//pay 결제페이지로
	@RequestMapping(value = "/pay", method = RequestMethod.GET)
	public ModelAndView pay(@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId, HttpServletResponse response,HttpSession session) throws IOException {
		mav = new ModelAndView();
		
		mav = ps.PayClick(finalMoney,roomId,response,session);
		
		return mav;
	}
	//AddPoint 충전패이지로
	@RequestMapping(value = "/AddPoint", method = RequestMethod.POST)
	public ModelAndView AddPoint(@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId){
	
		mav = new ModelAndView();
		
		mav = ps.AddPoint(finalMoney,roomId);
		
		return mav;
	}
	//AddPointPro 진짜 충전
	@RequestMapping(value = "/AddPointPro", method = RequestMethod.GET)
	public ModelAndView AddPointPro(@RequestParam("Point") String Point,HttpSession session,@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId,HttpServletResponse response) throws IOException  {
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(Point == null || Point.equals("")) {
			out.println("<script>");
			out.println("alert('포인트를 입력해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		//System.out.println(Point);
		mav = ps.AddPointPro(Point,session,roomId,finalMoney,response);
		
		return mav;
	}
	//PayPro 진짜결제
	@RequestMapping(value = "/PayPro", method = RequestMethod.POST)
	public ModelAndView PayPro(@ModelAttribute MemberVO memberVO,HttpSession session,@RequestParam("finalMoney") String finalMoney,@ModelAttribute PayVO payVO,HttpServletResponse response) throws IOException  {
		mav = new ModelAndView();
		/*System.out.println(memberVO.getPoint());
		System.out.println(payVO.getRoomId());
		System.out.println(finalMoney);*/
		mav = ps.PayPro(session,payVO,finalMoney,response,memberVO);
		
		return mav;
	}
	
	//payCancel 결제취소
	@RequestMapping(value = "/payCancel", method = RequestMethod.GET)
	public ModelAndView payCancel(HttpSession session, @ModelAttribute PayVO payVO) {
		mav = new ModelAndView();
		mav = ps.payCancel(session,payVO);
		return mav;
	}
	
	//예약 및 결제 Rpay
	@RequestMapping(value = "/Rpay", method = RequestMethod.GET)
	public ModelAndView Rpay(@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId, HttpServletResponse response,HttpSession session) throws IOException {
		mav = new ModelAndView();
		
		mav = ps.PayClick2(finalMoney,roomId,response,session);
		
		return mav;
	}
	//PayPro2
	@RequestMapping(value = "/PayPro2", method = RequestMethod.POST)
	public ModelAndView PayPro2(@ModelAttribute MemberVO memberVO,HttpSession session,@RequestParam("finalMoney") String finalMoney,@ModelAttribute PayVO payVO,HttpServletResponse response) throws IOException  {
		mav = new ModelAndView();
		/*System.out.println(memberVO.getPoint());
		System.out.println(payVO.getRoomId());
		System.out.println(finalMoney);*/
		mav = ps.PayPro2(session,payVO,finalMoney,response,memberVO);
		
		return mav;
	}
	
	//AddPoint2
	@RequestMapping(value = "/AddPoint2", method = RequestMethod.POST)
	public ModelAndView AddPoint2(@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId){
	
		mav = new ModelAndView();
		
		mav = ps.AddPoint2(finalMoney,roomId);
		
		return mav;
	}
	
	//payCancel2
	@RequestMapping(value = "/payCancel2", method = RequestMethod.GET)
	public ModelAndView payCancel2(HttpSession session, @ModelAttribute PayVO payVO) {
		mav = new ModelAndView();
		mav = ps.payCancel2(session,payVO);
		return mav;
	}
	
	//RoomOut2
	@RequestMapping(value = "/RoomOut2", method = RequestMethod.GET)
	public ModelAndView RoomOut2(@ModelAttribute RoomVO roomVO,HttpSession session, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		
		mav = crs.RoomOut2(roomVO, session,response);
		
		return mav;
	}
	
	//예약룸 리스트 불러오기
	@RequestMapping(value = "/RoomList2", method = RequestMethod.GET)
	public ModelAndView RoomList2() {
		mav = new ModelAndView();
		
		mav = crs.RoomList2();
		
		return mav;
		
	}
	
    //AddPointPro2
	@RequestMapping(value = "/AddPointPro2", method = RequestMethod.GET)
	public ModelAndView AddPointPro2(@RequestParam("Point") String Point,HttpSession session,@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId,HttpServletResponse response) throws IOException  {
		
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(Point == null || Point.equals("")) {
			out.println("<script>");
			out.println("alert('포인트를 입력해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		System.out.println("커몬 베이비");
		//System.out.println(Point);
		mav = ps.AddPointPro2(Point,session,roomId,finalMoney,response);
		
		return mav;
	}
	
	//예약방 세부정보 
	@RequestMapping(value = "/RoomInfo2", method = RequestMethod.GET)
	public ModelAndView RoomInfo2(@ModelAttribute RoomVO roomVO, HttpSession session,HttpServletResponse response,PayVO payVO) throws IOException {
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(roomVO.getOpGender().equals("")) {
			out.println("<script>");
			out.println("alert('방장이 방을 설정중입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		mav = crs.RoomInfo2(roomVO, session,response,payVO);
		
		return mav;
		
	}
	//EndDriver
	@RequestMapping(value = "/EndDriver", method = RequestMethod.GET)
	public ModelAndView EndDriver(@ModelAttribute RoomVO roomVO,HttpSession session, HttpServletResponse response, PayVO payVO, endRoomVO endRoom) throws IOException {
		mav = new ModelAndView();
		
		mav = crs.EndDriver(roomVO, session,response,payVO,endRoom);
		
		return mav;
	}
	
	//cacaoAPI 카카오페이 테스트
	@RequestMapping(value = "/cacaoAPI", method = RequestMethod.GET)
	public String cacaoAPI() {
		return "cacaoAPI";
	}
	
	//room에서 내가 선택한 지도보기
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView map(@ModelAttribute RoomVO roomVO) throws IOException {
		mav = new ModelAndView();
		
		mav.addObject("RoomMap", roomVO);
		mav.setViewName("Maps1");
		
		return mav;
	}
	//reservation room에서 내가 선택한 지도보기
		@RequestMapping(value = "/map2", method = RequestMethod.GET)
		public ModelAndView map2(@ModelAttribute RoomVO roomVO) throws IOException {
			mav = new ModelAndView();
			
			mav.addObject("RoomMap", roomVO);
			mav.setViewName("Maps2");
			
			return mav;
		}
		//카카오 api로 가기
		@RequestMapping(value = "/GoCacao", method = RequestMethod.POST)
		public ModelAndView GoCacao(@RequestParam("Point") String Point,HttpSession session,@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId,HttpServletResponse response) throws IOException {
			mav = new ModelAndView();
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			if(Point == null || Point.equals("")) {
				out.println("<script>");
				out.println("alert('포인트를 입력해주세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}
			mav = ps.GoCacao(Point,session,roomId,finalMoney);
			
			return mav;
		}
		
		//GoCacao2
		@RequestMapping(value = "/GoCacao2", method = RequestMethod.POST)
		public ModelAndView GoCacao2(@RequestParam("Point") String Point,HttpSession session,@RequestParam("finalMoney") String finalMoney,@RequestParam("roomId") String roomId,HttpServletResponse response) throws IOException {
			mav = new ModelAndView();
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			if(Point == null || Point.equals("")) {
				out.println("<script>");
				out.println("alert('포인트를 입력해주세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			}
			mav = ps.GoCacao2(Point,session,roomId,finalMoney);
			
			return mav;
		}
		
				//내가 예약한거 보기
				@RequestMapping(value = "/ReservationRoomList", method = RequestMethod.GET)
				public ModelAndView ReservationRoomList(HttpSession session,RoomVO endRoom,HttpServletResponse response,MemberVO memvervo)throws IOException  {
					mav = new ModelAndView();
					String id = (String)session.getAttribute("id");
					memvervo.setId(id);
					mav=rvs.rservationRoomList(session,endRoom,response,memvervo);
				
					return mav;
			}
				//자신이 이용한 목록보기 
				@RequestMapping(value = "/MyPageList", method = RequestMethod.GET)
				public ModelAndView MyPageList(HttpSession session,endRoomVO endRoom,HttpServletResponse response,MemberVO memvervo)throws IOException {
					mav = new ModelAndView();
					
					System.out.println("여기야 여기!!!");
					
					String id = (String)session.getAttribute("id");
					memvervo.setId(id);
					System.out.println("아디: "+memvervo.getId());
					System.out.println(memvervo.getId());
					mav=mps.mypageList(session,endRoom,response,memvervo);
					
					return mav;
				}
				//평점페이지
				@RequestMapping(value = "/Grade", method = RequestMethod.GET)
				public ModelAndView Grade(@RequestParam("driverId") String driverId) {
					mav = new ModelAndView();
				
					System.out.println(driverId);
					mav.addObject("driverId",driverId);
					mav.setViewName("Grade");
					return mav;
				}
				//평점주기
				@RequestMapping(value = "/Gradeform", method = RequestMethod.GET)
				public ModelAndView Gradeform(@RequestParam("Grade") String Grade,HttpSession session,@RequestParam("edriverId")String edriverId)  {
					mav = new ModelAndView();
					
					System.out.println("평점: "+Grade);
					System.out.println("드라이버 아뒤 "+edriverId);
					mav = gsv.AddGrade(Grade,session,edriverId);
					
					return mav;
				}
				//기사 운행예정 
				@RequestMapping(value = "/DriverExpected", method = RequestMethod.GET)
				public ModelAndView DriverExpected(HttpSession session,RoomVO roomvo,HttpServletResponse response) throws IOException {
				mav = new ModelAndView();
				System.out.println("기사 마이페이지 Home");
			
				String id = (String)session.getAttribute("id");
				roomvo.setDriverId(id);
				System.out.println(roomvo.getDriverId());
				mav = des.DriverExpected2(session,roomvo,response);
				return mav;
				}
				
				//기사 운행기록
				@RequestMapping(value = "/Drivingrecord", method = RequestMethod.GET)
				public ModelAndView Drivingrecord(HttpSession session,endRoomVO endRoomVO,HttpServletResponse response) throws IOException {
				mav = new ModelAndView();
					
					System.out.println("기사운행기록 홈컨1");
					
					//세션아디, 끝난 운행 
					String id=(String)session.getAttribute("id");
					endRoomVO.setEdriverId(id);
					mav=drs.drivingrecord(session,endRoomVO,response);
					
					System.out.println("기록운행기록 홈컨2");
					return mav;
				}
				
				@RequestMapping(value = "/chat", method = RequestMethod.GET)
				public ModelAndView chat(@RequestParam("roomId") int roomId) {
					mav = new ModelAndView();
					System.out.println(roomId);
					
					
					mav = ms.chatservice(roomId);
					return mav;
				}
}
