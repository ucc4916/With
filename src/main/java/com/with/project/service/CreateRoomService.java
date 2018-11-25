package com.with.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import com.with.project.vo.endRoomVO;

@Service
public class CreateRoomService {

	@Autowired
	private CreateRoomDAO CreateRoomDAO;
	private ModelAndView mav;
	// private RoomVO roomVO;
	@Autowired
	private PayDAO payDAO;

	// 방만들기 처음!
	public ModelAndView CreateRoom(RoomVO roomVO) {
		mav = new ModelAndView();
		String RoomId = CreateRoomDAO.MaxId();
		String EndRoomId = CreateRoomDAO.MaxEid();
		int Start = 0;
		int End = 0;
		
		if(RoomId == null) {
			RoomId = "0";
			Start = Integer.parseInt(RoomId);
		}else {
			Start = Integer.parseInt(RoomId);
		}
		if(EndRoomId == null) {
			EndRoomId = "0";
			End = Integer.parseInt(EndRoomId);
		}else {
			End = Integer.parseInt(EndRoomId);
		}
		
		if(Start<End) {
			End += 1;
			roomVO.setRoomId(End);
		}else if(Start == 0) {
			roomVO.setRoomId(1);
		}else {
			Start +=1;
			roomVO.setRoomId(Start);
		}
		
		/*if (RoomId.equals("null")) {
			roomVO.setRoomId(1);
		} else {
			int Roomid = Integer.parseInt(RoomId);
			Roomid = Roomid + 1;
			roomVO.setRoomId(Roomid);
		}*/
		// System.out.println(RoomId);

		// int InsertRoomId = roomVO.getRoomid();

		int result = CreateRoomDAO.CreateRoom(roomVO);
		// System.out.println(result);
		if (result == 0) {
			mav.setViewName("home");
		} else {
			// System.out.println(roomVO.getPreDistance());
			// RoomVO RoomV = CreateRoomDAO.RoomList(InsertRoomId);
			// 남자인지 여자인지 자신의 성별 값을 가져간다.
			String Id = roomVO.getrId1();
			MemberVO memberVO = CreateRoomDAO.MemberGender(Id);
			mav.addObject("Gender", memberVO);
			mav.addObject("Room", roomVO);
			mav.setViewName("CreateRoom");
		}
		return mav;
	}

	// 방만들기 성별, 최대인원 추가하기
	public ModelAndView CreateRealRoom(RoomVO roomVO,HttpSession session) {
		mav = new ModelAndView();

		int result = CreateRoomDAO.CreateRealRoom(roomVO);
		if (result == 0) {
			mav.setViewName("home");
		} else {
			RoomVO roomVO2 = CreateRoomDAO.SelectRoom(roomVO);

			// 예상 가격을 가져와서 원 의 인덱스 값을 가져온다.
			int idx = roomVO2.getPreMoney().indexOf("원");
			System.out.println("1:" + idx);
			// 원 부터 뒤에 글자는 모두 자른다.
			String money = roomVO2.getPreMoney().substring(0, idx);
			System.out.println("2:" + money);
			// int로 형변환
			int money1 = Integer.parseInt(money);
			// int 값이기때문에 나눌수 있다.
			money1 /= Integer.parseInt(roomVO2.getMaximum());
			// 다시 setPreMoney에 넣어야하기 때문에 String 으로 형변환
			String money2 = Integer.toString(money1);
			System.out.println("3:" + money2);
			// 다시 값을 넣는다.
			// roomVO2.setPreMoney(money2);
			roomVO2.setFinalMoney(money2);

			// 따로 한번 더 넣어주는 작업
			CreateRoomDAO.CreateRealRoom2(roomVO2);
			String id = (String) session.getAttribute("id");
			MemberVO memberVO = CreateRoomDAO.MemberGender(id);

			mav.addObject("Room", roomVO2);
			mav.addObject("member", memberVO);
			mav.setViewName("room");
		}
		return mav;

	}

	public ModelAndView ReservationRoom(RoomVO roomVO) {
		mav = new ModelAndView();
		int result = CreateRoomDAO.ReservationRoom(roomVO);
		if (result == 0) {
			mav.setViewName("home");
		} else {
			RoomVO roomVO2 = CreateRoomDAO.SelectRoom(roomVO);

			// 예상 가격을 가져와서 원 의 인덱스 값을 가져온다.
			int idx = roomVO2.getPreMoney().indexOf("원");
			System.out.println("1:" + idx);
			// 원 부터 뒤에 글자는 모두 자른다.
			String money = roomVO2.getPreMoney().substring(0, idx);
			System.out.println("2:" + money);
			// int로 형변환
			int money1 = Integer.parseInt(money);
			// int 값이기때문에 나눌수 있다.
			money1 /= Integer.parseInt(roomVO2.getMaximum());
			// 다시 setPreMoney에 넣어야하기 때문에 String 으로 형변환
			String money2 = Integer.toString(money1);
			System.out.println("3:" + money2);
			// 다시 값을 넣는다.
			// roomVO2.setPreMoney(money2);
			roomVO2.setFinalMoney(money2);

			// 따로 한번 더 넣어주는 작업
			CreateRoomDAO.CreateRealRoom2(roomVO2);

			mav.addObject("Room", roomVO2);
			mav.setViewName("Reservation");
		}
		return mav;
	}

	public ModelAndView RoomList() {
		mav = new ModelAndView();
		List<RoomVO> RoomList = CreateRoomDAO.RoomList();
		mav.addObject("RoomList", RoomList);
		mav.setViewName("RoomList");

		return mav;
	}

	public ModelAndView RoomInfo(RoomVO roomVO, HttpSession session, HttpServletResponse response, PayVO payVO)
			throws IOException {
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id = (String) session.getAttribute("id");
		MemberVO memberVO = CreateRoomDAO.MemberGender(id);
		RoomVO room = CreateRoomDAO.roomS(roomVO);
		String max = CreateRoomDAO.selectMax(roomVO);
		int UserPass = memberVO.getPassuser();

		if (UserPass == 1) {
			// 성별
			String memberGender = memberVO.getGender();
			String RoomOpGender = room.getOpGender();
			if (memberGender.equals(RoomOpGender) || RoomOpGender.equals("noProblem")) {
				if (max.equals("2")) {
					System.out.println("1");
					String rId1 = CreateRoomDAO.SelectId1(roomVO);
					// 1,2,3,4 컬럼에 null인지 아닌지 확인
					if (rId1 == null) {
						roomVO.setrId1(id);
						CreateRoomDAO.UpdateId1(roomVO);
						RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
						mav.addObject("Room", roomVO2);
						mav.setViewName("room");
						payVO.setId(id);
						payVO.setRoomId(roomVO.getRoomId());
						String OkChash = CreateRoomDAO.SelectOkChash(payVO);
						if (OkChash != null) {
							PayVO pay = payDAO.SelectPayTable(payVO);
							mav.addObject("pay", pay);
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("room");
						} else {

							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("room");
						}
					} else {
						String rId2 = CreateRoomDAO.SelectId2(roomVO);
						if (rId1.equals(id)) {
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							}
						} else if (rId2 == null) {
							System.out.println("2018-10-04 여기로 와야한다. ");
							roomVO.setrId2(id);
							CreateRoomDAO.UpdateId2(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							}
						} else if (rId2.equals(id)) {
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							}
						} else {
							out.println("<script>");
							out.println("alert('인원이 꽉 찼습니다. 다른 방을 이용해주세용.');");
							out.println("history.go(-1);");
							out.println("</script>");
							out.close();
							mav.setViewName("redirect:RoomList");
						}
					}
				} else if (max.equals("3")) {
					String rId1 = CreateRoomDAO.SelectId1(roomVO);
					String rId2 = CreateRoomDAO.SelectId2(roomVO);
					String rId3 = CreateRoomDAO.selectId3(roomVO);
					if (rId1 == null) {
						rId1 = "1";
					}
					if (rId2 == null) {
						rId2 = "1";
					}
					if (rId3 == null) {
						rId3 = "1";
					}
					if (rId1.equals(id) || rId2.equals(id) || rId3.equals(id)) {
						RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
						payVO.setId(id);
						payVO.setRoomId(roomVO.getRoomId());
						String OkChash = CreateRoomDAO.SelectOkChash(payVO);
						if (OkChash != null) {
							PayVO pay = payDAO.SelectPayTable(payVO);
							mav.addObject("pay", pay);
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("room");
						} else {
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("room");
						}
					} else {
						if (rId2.equals("1")) {
							roomVO.setrId2(id);
							CreateRoomDAO.UpdateId2(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							}
						} else if (rId3.equals("1")) {
							roomVO.setrId3(id);
							CreateRoomDAO.UpdateId3(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							}
						} else {
							System.out.println("왜 여기로오는지 생각하기!, 만약 여기로온다면");
						}
					}
				} else if (max.equals("4")) {
					String rId1 = CreateRoomDAO.SelectId1(roomVO);
					String rId2 = CreateRoomDAO.SelectId2(roomVO);
					String rId3 = CreateRoomDAO.selectId3(roomVO);
					String rId4 = CreateRoomDAO.selectId4(roomVO);
					if (rId1 == null) {
						rId1 = "1";
					}
					if (rId2 == null) {
						rId2 = "1";
					}
					if (rId3 == null) {
						rId3 = "1";
					}
					if (rId4 == null) {
						rId4 = "1";
					}
					if (rId1.equals(id) || rId2.equals(id) || rId3.equals(id) || rId4.equals(id)) {
						RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
						payVO.setId(id);
						payVO.setRoomId(roomVO.getRoomId());
						String OkChash = CreateRoomDAO.SelectOkChash(payVO);
						if (OkChash != null) {
							PayVO pay = payDAO.SelectPayTable(payVO);
							mav.addObject("pay", pay);
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("room");
						} else {
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("room");
						}
					} else {
						if (rId2.equals("1")) {
							roomVO.setrId2(id);
							CreateRoomDAO.UpdateId2(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							}
						} else if (rId3.equals("1")) {
							roomVO.setrId3(id);
							CreateRoomDAO.UpdateId3(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							}
						} else if (rId4.equals("1")) {
							roomVO.setrId4(id);
							CreateRoomDAO.UpdateId4(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("room");
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("room");
							}
						} else {
							System.out.println("왜 여기로오는지 생각하기!, 만약 여기로온다면");
						}
					} // 4개중에 모두 같지않은것 끝
				} // max 끝

			} else {
				out.println("<script>");
				out.println("alert('성별 옵션을 잘 보고 입장해주세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				mav.setViewName("redirect:RoomList");
			}

		} else {
			// 여기는 passUser가 2일때 기사일때 입장 여부!
			String DriverId = CreateRoomDAO.SelectDriverId(roomVO);
			if (DriverId == null) {
				DriverId = "0";
			}
			if (DriverId.equals("0")) {
				roomVO.setDriverId(id);
				CreateRoomDAO.UpdateDriverId(roomVO);
				RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
				mav.addObject("Room", roomVO2);
				mav.addObject("member", memberVO);
				mav.setViewName("room");
			} else if (DriverId.equals(id)) {
				RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
				mav.addObject("Room", roomVO2);
				mav.addObject("member", memberVO);
				mav.setViewName("room");
			} else {
				out.println("<script>");
				out.println("alert('이미 다른 기사님이 운행을 준비중 입니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				mav.setViewName("redirect:RoomList");
			}

		}
		return mav;
	}

	public ModelAndView RoomOut(RoomVO roomVO, HttpSession session, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 자신의 id 값과 room table db에 있는 값을 비교한 후 db에 있는 값과 같다면 null 값을 만든다.
		// 비교 하려면 List 와 반복문을 사용한다.

		// 유저인지 기사인지
		MemberVO memberVO = CreateRoomDAO.MemberGender(id);
		int UserPass = memberVO.getPassuser();
		if (UserPass == 1) {
			// DB에 ID 값이 들어있는데 그값을 찾기 위한 리스트!
			RoomVO RoomRid = CreateRoomDAO.RoomOutList(roomVO);
			if (RoomRid.getrId1().equals(id)) {
				CreateRoomDAO.RoomOutListDel(roomVO);
				mav.setViewName("redirect:RoomList");
				out.println("<script>");
				out.println("alert('방장이 방을 나가면 방이 삭제 됩니다.');");
				out.println("location.href='RoomList';");
				out.println("</script>");
				out.close();
			} else if (RoomRid.getrId2().equals(id)) {
				CreateRoomDAO.RoomOutRid2(roomVO);
				mav.setViewName("redirect:RoomList");
			} else if (RoomRid.getrId3().equals(id)) {
				CreateRoomDAO.RoomOutRid3(roomVO);
				mav.setViewName("redirect:RoomList");
			} else if (RoomRid.getrId4().equals(id)) {
				CreateRoomDAO.RoomOutRid4(roomVO);
				mav.setViewName("redirect:RoomList");
			}
		} else {
			String DriverId = CreateRoomDAO.SelectDriverId(roomVO);
			if (DriverId.equals(id)) {
				CreateRoomDAO.RoomOutDriver(roomVO);
				mav.setViewName("redirect:RoomList");
			}
		}

		return mav;
	}

	// 방에서 기사 정보 보기
	public ModelAndView RoomDriverInfo(String Id) {
		mav = new ModelAndView();
		MemberVO memberVO = CreateRoomDAO.DriverInfo(Id);
		mav.addObject("DriverInfo", memberVO);
		mav.setViewName("DriverInfo");
		return mav;
	}

	public ModelAndView RoomOut2(RoomVO roomVO, HttpSession session, HttpServletResponse response) throws IOException {
		mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 자신의 id 값과 room table db에 있는 값을 비교한 후 db에 있는 값과 같다면 null 값을 만든다.
		// 비교 하려면 List 와 반복문을 사용한다.

		// 유저인지 기사인지
		MemberVO memberVO = CreateRoomDAO.MemberGender(id);
		int UserPass = memberVO.getPassuser();
		if (UserPass == 1) {
			// DB에 ID 값이 들어있는데 그값을 찾기 위한 리스트!
			RoomVO RoomRid = CreateRoomDAO.RoomOutList(roomVO);
			if (RoomRid.getrId1().equals(id)) {
				CreateRoomDAO.RoomOutListDel(roomVO);
				mav.setViewName("redirect:RoomList2");
				out.println("<script>");
				out.println("alert('방장이 방을 나가면 방이 삭제 됩니다.');");
				out.println("location.href='RoomList2';");
				out.println("</script>");
				out.close();
			} else if (RoomRid.getrId2().equals(id)) {
				CreateRoomDAO.RoomOutRid2(roomVO);
				mav.setViewName("redirect:RoomList2");
			} else if (RoomRid.getrId3().equals(id)) {
				CreateRoomDAO.RoomOutRid3(roomVO);
				mav.setViewName("redirect:RoomList2");
			} else if (RoomRid.getrId4().equals(id)) {
				CreateRoomDAO.RoomOutRid4(roomVO);
				mav.setViewName("redirect:RoomList2");
			}
		} else {
			String DriverId = CreateRoomDAO.SelectDriverId(roomVO);
			if (DriverId.equals(id)) {
				CreateRoomDAO.RoomOutDriver(roomVO);
				mav.setViewName("redirect:RoomList2");
			}
		}

		return mav;
	}
	//예약룸 가자!
	public ModelAndView RoomList2() {
		mav = new ModelAndView();
		List<RoomVO> RoomList = CreateRoomDAO.RoomList2();

		mav.addObject("RoomList", RoomList);
		mav.setViewName("RoomList2");

		return mav;
	}

	// 예약 상세정보
	public ModelAndView RoomInfo2(RoomVO roomVO, HttpSession session, HttpServletResponse response, PayVO payVO)
			throws IOException {
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id = (String) session.getAttribute("id");
		MemberVO memberVO = CreateRoomDAO.MemberGender(id);
		RoomVO room = CreateRoomDAO.roomS(roomVO);
		String max = CreateRoomDAO.selectMax(roomVO);
		int UserPass = memberVO.getPassuser();

		if (UserPass == 1) {
			// 성별
			String memberGender = memberVO.getGender();
			String RoomOpGender = room.getOpGender();
			if (memberGender.equals(RoomOpGender) || RoomOpGender.equals("noProblem")) {
				if (max.equals("2")) {
					System.out.println("1");
					String rId1 = CreateRoomDAO.SelectId1(roomVO);
					// 1,2,3,4 컬럼에 null인지 아닌지 확인
					if (rId1 == null) {
						roomVO.setrId1(id);
						CreateRoomDAO.UpdateId1(roomVO);
						RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
						mav.addObject("Room", roomVO2);
						mav.addObject("member", memberVO);
						
						mav.setViewName("Reservation");
						payVO.setId(id);
						payVO.setRoomId(roomVO.getRoomId());
						String OkChash = CreateRoomDAO.SelectOkChash(payVO);
						if (OkChash != null) {
							PayVO pay = payDAO.SelectPayTable(payVO);
							mav.addObject("pay", pay);
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("Reservation");
						} else {

							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("Reservation");
						}
					} else {
						String rId2 = CreateRoomDAO.SelectId2(roomVO);
						if (rId1.equals(id)) {
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								//System.out.println("passuser찍기:"+memberVO.getPassuser());
								mav.setViewName("Reservation");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								//System.out.println("passuser찍기:"+memberVO.getPassuser());
								mav.setViewName("Reservation");

							}
						} else if (rId2 == null) {
							roomVO.setrId2(id);
							CreateRoomDAO.UpdateId2(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							}
						} else if (rId2.equals(id)) {
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							}
						} else {
							out.println("<script>");
							out.println("alert('인원이 꽉 찼습니다. 다른 방을 이용해주세용.');");
							out.println("history.go(-1);");
							out.println("</script>");
							out.close();
							mav.setViewName("redirect:RoomList2");
						}
					}
				} else if (max.equals("3")) {
					String rId1 = CreateRoomDAO.SelectId1(roomVO);
					String rId2 = CreateRoomDAO.SelectId2(roomVO);
					String rId3 = CreateRoomDAO.selectId3(roomVO);
					if (rId1 == null) {
						rId1 = "1";
					}
					if (rId2 == null) {
						rId2 = "1";
					}
					if (rId3 == null) {
						rId3 = "1";
					}
					if (rId1.equals(id) || rId2.equals(id) || rId3.equals(id)) {
						RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
						payVO.setId(id);
						payVO.setRoomId(roomVO.getRoomId());
						String OkChash = CreateRoomDAO.SelectOkChash(payVO);
						if (OkChash != null) {
							PayVO pay = payDAO.SelectPayTable(payVO);
							mav.addObject("pay", pay);
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("Reservation");
						} else {
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("Reservation");
						}
					} else {
						if (rId2.equals("1")) {
							roomVO.setrId2(id);
							CreateRoomDAO.UpdateId2(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							} else {
								mav.addObject("Room", roomVO2);
								mav.setViewName("Reservation");
							}
						} else if (rId3.equals("1")) {
							roomVO.setrId3(id);
							CreateRoomDAO.UpdateId3(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							}
						} else {
							System.out.println("왜 여기로오는지 생각하기!, 만약 여기로온다면");
						}
					}
				} else if (max.equals("4")) {
					String rId1 = CreateRoomDAO.SelectId1(roomVO);
					String rId2 = CreateRoomDAO.SelectId2(roomVO);
					String rId3 = CreateRoomDAO.selectId3(roomVO);
					String rId4 = CreateRoomDAO.selectId4(roomVO);
					if (rId1 == null) {
						rId1 = "1";
					}
					if (rId2 == null) {
						rId2 = "1";
					}
					if (rId3 == null) {
						rId3 = "1";
					}
					if (rId4 == null) {
						rId4 = "1";
					}
					if (rId1.equals(id) || rId2.equals(id) || rId3.equals(id) || rId4.equals(id)) {
						RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
						payVO.setId(id);
						payVO.setRoomId(roomVO.getRoomId());
						String OkChash = CreateRoomDAO.SelectOkChash(payVO);
						if (OkChash != null) {
							PayVO pay = payDAO.SelectPayTable(payVO);
							mav.addObject("pay", pay);
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("Reservation");
						} else {
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("Reservation");
						}
					} else {
						if (rId2.equals("1")) {
							roomVO.setrId2(id);
							CreateRoomDAO.UpdateId2(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							}
						} else if (rId3.equals("1")) {
							roomVO.setrId3(id);
							CreateRoomDAO.UpdateId3(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							}
						} else if (rId4.equals("1")) {
							roomVO.setrId4(id);
							CreateRoomDAO.UpdateId4(roomVO);
							RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
							mav.addObject("Room", roomVO2);
							mav.addObject("member", memberVO);
							mav.setViewName("Reservation");
							payVO.setId(id);
							payVO.setRoomId(roomVO.getRoomId());
							String OkChash = CreateRoomDAO.SelectOkChash(payVO);
							if (OkChash != null) {
								PayVO pay = payDAO.SelectPayTable(payVO);
								mav.addObject("pay", pay);
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							} else {
								mav.addObject("Room", roomVO2);
								mav.addObject("member", memberVO);
								mav.setViewName("Reservation");
							}
						} else {
							System.out.println("왜 여기로오는지 생각하기!, 만약 여기로온다면");
						}
					} // 4개중에 모두 같지않은것 끝
				} // max 끝

			} else {
				out.println("<script>");
				out.println("alert('성별 옵션을 잘 보고 입장해주세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				mav.setViewName("redirect:RoomList2");
			}

		} else {
			// 여기는 passUser가 2일때 기사일때 입장 여부!
			String DriverId = CreateRoomDAO.SelectDriverId(roomVO);
			if (DriverId == null) {
				DriverId = "0";
			}
			if (DriverId.equals("0")) {
				roomVO.setDriverId(id);
				CreateRoomDAO.UpdateDriverId(roomVO);
				RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
				mav.addObject("Room", roomVO2);
				mav.addObject("member", memberVO);
				mav.setViewName("Reservation");
			} else if (DriverId.equals(id)) {
				RoomVO roomVO2 = CreateRoomDAO.RoomInfo(roomVO);
				mav.addObject("Room", roomVO2);
				mav.addObject("member", memberVO);
				mav.setViewName("Reservation");
			} else {
				out.println("<script>");
				out.println("alert('이미 다른 기사님이 운행을 준비중 입니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				mav.setViewName("redirect:RoomList2");
			}

		}
		return mav;

	}

	public ModelAndView EndDriver(RoomVO roomVO, HttpSession session, HttpServletResponse response, PayVO payVO, endRoomVO endRoom)
			throws IOException {
		// 여기부터
		/*
		 * 링크로 운행완료 누르면 최대인원 수 만큼의 결제 횟수가 있는지 파악하고 안되있으면 결제가 모두 미완료 됫다는 얼럿창띄우고 되있으면 총금액을
		 * 기사한태 업데이트해준후 링크를 없앤다. 그리고
		 */

		// if(RoomList.get(0).getDayDay() != null)
		mav = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String Id = (String)session.getAttribute("id");
		int roomId = roomVO.getRoomId();
		MemberVO member = CreateRoomDAO.MemberGender(Id);
		List<PayVO> PayList = CreateRoomDAO.PayList(roomId);
		RoomVO room = CreateRoomDAO.SelectRoom(roomVO);

		//OkCash가 1일때는 회원이 돈을 넣은것이고
		//OkCash가 2일때는 기사가 결제 완료를 한것이다.
		int sum = 0;
		for (int i = 0; i < PayList.size(); i++) {
			if (PayList.get(i).getOkCash().equals("1")) {
				sum += 1;
			}
		}

		int max = Integer.parseInt(room.getMaximum());

		if (max == sum) {
			
			// 예상 가격을 가져와서 원 의 인덱스 값을 가져온다.
			int idx = room.getPreMoney().indexOf("원");
			// 원 부터 뒤에 글자는 모두 자른다.
			String money = room.getPreMoney().substring(0, idx);
			// int로 형변환
			int money1 = Integer.parseInt(money);// int 값이기때문에 계산가능!
			int MyPoint = member.getPoint();
			
			MyPoint +=money1;
			member.setPoint(MyPoint);
			payDAO.UpdatePoint(member); //포인트 업데이트 후
			
			payVO.setId(Id);
			payVO.setRoomId(roomId);
			payDAO.InsertDrvier(payVO); //먼저 결제가 완료되어서 나중에 기사가 운행기록 보기위해 필요함
			
			
			//null 값을 잡기위해
			if(room.getrId3() == null) {
				room.setrId3("null");
			}
			if(room.getrId4() == null) {
				room.setrId4("null");
			}
			if(room.getDayDay() == null) {
				room.setDayDay("null");
			}
			if(room.getTimes() == null) {
				room.setTimes("null");
			}
			
			//room에있는 것을 endRoom에 옮긴다.
			endRoom.setEdayDay(room.getDayDay()); //1
			endRoom.setEdriverId(room.getDriverId()); //2
			endRoom.setEfinalMoney(room.getFinalMoney()); //3
			endRoom.setEmaximum(room.getMaximum()); //4
			endRoom.setEopGender(room.getOpGender()); //5
			endRoom.setEpreDistance(room.getPreDistance()); //6
			endRoom.setEpreMoney(room.getPreMoney()); //7
			endRoom.setEpreTime(room.getPreTime()); //8
			endRoom.setErEnd(room.getrEnd()); // 9
			endRoom.setErId1(room.getrId1()); //10
			endRoom.setErId2(room.getrId2()); //11
			endRoom.setErId3(room.getrId3());//12
			endRoom.setErId4(room.getrId4());//13
			endRoom.setEroomId(room.getRoomId());//14
			endRoom.setErStart(room.getrStart());//15
			endRoom.setEtimes(room.getTimes());//16
			//옮길 필요는 없었음...테스트해보다가 이렇게 됌...
			//room table에 있는 한줄을 EndRoom table에 넣는다.
			CreateRoomDAO.EndRoomInsert(endRoom);
			//room table에 있는 한줄을 삭제한다.
			CreateRoomDAO.RoomOutListDel(roomVO);
			
			out.println("<script>");
			out.println("alert('운행이 완료되었습니다. 방이 삭제되고 본인의 운행기록에서 볼 수있습니다.');");
			out.println("location.href='home';");
			out.println("</script>");
			out.close();
			//home으로
			//mav.setViewName("redirect:home");
		} else {
			out.println("<script>");
			out.println("alert('아직 모든인원이 결제를 완료 하지 않았습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			// mav.setViewName("redirect:RoomList");
		}

		return mav;
	}

}
