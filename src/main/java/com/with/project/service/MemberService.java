package com.with.project.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.with.project.dao.MemberDAO;
import com.with.project.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberService {
	
	private final static String ACCOUNT = ("사용시 구글 이메일");
	
	private final static String PASSWORD = ("사용시 구글 비밀번호");
	    
	@Autowired
	private MemberDAO memberDAO;
	private ModelAndView mav;
	private MemberVO memberVO;

	@Autowired
	private HttpSession session;

	// 기사 회원가입
	public ModelAndView DriverJoin(MemberVO memberVO) {
		mav = new ModelAndView();
		int result = memberDAO.DriverJoin(memberVO);

		if (result == 0) {
			mav.setViewName("home");
		} else {
			mav.setViewName("home");
		}
		return mav;
	}

	// 유저 회원가입
	public ModelAndView UserJoin(MemberVO memberVO) {
		mav = new ModelAndView();

		int result = memberDAO.UserJoin(memberVO);

		if (result == 0) {
			mav.setViewName("home");
		} else {
			mav.setViewName("home");
		}
		return mav;
	}

	// 로그인
	public ModelAndView Login(MemberVO memberVO, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();

		MemberVO loginMember = memberDAO.Login(memberVO);

		if (loginMember != null) {
			session.setAttribute("id", memberVO.getId());
			mav.addObject("LoginMember", loginMember);
			mav.setViewName("home");

		} else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			mav.setViewName("LoginForm");
		}
		return mav;
	}

	// 로그인 한 후 메인 으로 갈때
	public ModelAndView LoginMemberMain(String id) {
		mav = new ModelAndView();
		MemberVO member = memberDAO.MemberMain(id);
		mav.addObject("LoginMember", member);
		mav.setViewName("home");
		return mav;
	}

	// 비밀번호 확인 후 정보로가기
	public ModelAndView PasswordFormPro(MemberVO memberVO,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		MemberVO UserAlterInfo = memberDAO.UserAlterInfo(memberVO);
		if(UserAlterInfo != null) {
			mav.addObject("UserAlterInfo", UserAlterInfo);
			mav.setViewName("UserMyPageInfo");
		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			mav.setViewName("PasswordForm");
		}
		return mav;
	}
	//유저 정보 수정
	public ModelAndView UserInfoAlter(MemberVO memberVO) {
		mav = new ModelAndView();
		int result = memberDAO.UserInfoUpdate(memberVO);
		if(result==0) {
			mav.setViewName("redirect:PasswordFormPro?Password="+memberVO.getPassword());
		}else {
			mav.setViewName("redirect:UserMyPage");
		}
		return mav;
	}
	//운전자 정보 수정
	public ModelAndView DriverInfoAlter(MemberVO memberVO) {
		System.out.println("테스트입니다2.");
		String Lisence = memberVO.getLisence();
		System.out.println("엥"+Lisence);
		System.out.println(memberVO.getCertificate());
		if(memberVO.getCertificate().equals("")) {
			System.out.println("email="+memberVO.getEmail()+"TEL="+memberVO.getTel()+"address="+memberVO.getAddress()+"certificate="+memberVO.getCertificate()+"NAME="+memberVO.getName()+"SIGNTYPE='request' WHERE id="+memberVO.getId());
			System.out.println("메로롱");
		mav = new ModelAndView();
		int result = memberDAO.DriverInfoUpdate(memberVO);
		if(result==0) {
			mav.setViewName("redirect:PasswordFormPro?Password="+memberVO.getPassword());
			}else {
				mav.setViewName("redirect:DriverMyPage");
			}
		return mav;
	}else {
		System.out.println("마지막입니다.");
		System.out.println("email="+memberVO.getEmail()+"TEL="+memberVO.getTel()+"address="+memberVO.getAddress()+"certificate="+memberVO.getCertificate()+"NAME="+memberVO.getName()+"SIGNTYPE='request' WHERE id="+memberVO.getId());
		mav = new ModelAndView();
		int result = memberDAO.DriverInfoUpdateLisence(memberVO);
		if(result==0) {
			mav.setViewName("redirect:PasswordFormPro?Password="+memberVO.getPassword());
			}else {
				mav.setViewName("redirect:DriverMyPage");
			}	
	}
		return mav;
	}
	
	public ModelAndView ExistingDriverInfoAlter(MemberVO memberVO) {
		System.out.println("ExistingDriverInfoAlter");
		mav = new ModelAndView();
		int result = memberDAO.ExistingDriverInfoAlter(memberVO);
		if(result==0) {
			mav.setViewName("redirect:PasswordFormPro?Password="+memberVO.getPassword());
			}else {
				mav.setViewName("redirect:DriverMyPage");
			}
		return mav;
	}

	public void idOverlap(String id, HttpServletResponse response) throws IOException {
		memberVO = new MemberVO();
		memberVO = memberDAO.idOverlap(id);
		if(memberVO==null) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}
		
	}
	
	

	public void EmailOverlap(String email, HttpServletResponse response) throws IOException {
		memberVO = new MemberVO(); 
		memberVO = memberDAO.EmailOverlap(email);
		if(memberVO==null) {
			response.getWriter().print("1");
		}else {
			response.getWriter().print("0");
		}
	}

	   
 public static class SMTPAuthenticator extends Authenticator {
     public PasswordAuthentication getPasswordAuthentication() {
         return new PasswordAuthentication(ACCOUNT, PASSWORD);
     }
 }		
	public ModelAndView MailJoin(MemberVO memberVO) {	
			mav = new ModelAndView();
			boolean chkBoolean = true;		      
		        Properties p = new Properties(); 
		            p.put("mail.smtp.user", ACCOUNT); 
		            p.put("mail.smtp.host", "smtp.gmail.com");
		            p.put("mail.smtp.port", "465");
		            p.put("mail.smtp.starttls.enable","true");
		            p.put("mail.smtp.auth", "true");
		            p.put("mail.smtp.debug", "true");
		            p.put("mail.smtp.socketFactory.port", "465");
		            p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		            p.put("mail.smtp.socketFactory.fallback", "false");
		            try {		    
		            	int random = (int)(Math.random()*100)*(int)(Math.random()*10000);
		                session.setAttribute("random", random);
		                Authenticator auth = new SMTPAuthenticator();
		                Session session = Session.getInstance(p, auth);
		                session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
		                MimeMessage msg = new MimeMessage(session);
		                String message = "안녕하세요. With입니다. 인증번호는"+random+"입니다.";
		                msg.setSubject("[WithProject] 회원가입 이메일 인증번호 입니다."); //제목
		                Address fromAddr = new InternetAddress(ACCOUNT); // 보내는 사람의 메일주소
		                msg.setFrom(fromAddr);
		                Address toAddr = new InternetAddress(memberVO.getEmail()); // 받는 사람의 메일주소
		                msg.addRecipient(javax.mail.Message.RecipientType.TO, toAddr);
		                msg.setContent(message, "text/html;charset=UTF-8");
		                                  
		                Transport.send(msg);
		                     		                     
		            } catch (Exception mex) {
		                mex.printStackTrace();
		                chkBoolean = false;
		            } 
		            System.out.println(chkBoolean);
		            mav.setViewName("MailCheckView");
		            return mav;
		}
	
	public ModelAndView EmailCheckDriver(MemberVO memberVO) {
	mav = new ModelAndView();
		
		/* MemberVO mail = memberDAO.mailSender(memberVO); */

		boolean chkBoolean = true;
	      
	        Properties p = new Properties();
	        // 보내는사람 메일 주소(Gmail용)
	        
	            p.put("mail.smtp.user", ACCOUNT); 
	            p.put("mail.smtp.host", "smtp.gmail.com");
	            p.put("mail.smtp.port", "465");
	            p.put("mail.smtp.starttls.enable","true");
	            p.put("mail.smtp.auth", "true");
	            p.put("mail.smtp.debug", "true");
	            p.put("mail.smtp.socketFactory.port", "465");
	            p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	            p.put("mail.smtp.socketFactory.fallback", "false");
	            try {
	            	int random = (int)(Math.random()*100)*(int)(Math.random()*10000);
	                session.setAttribute("random", random);
	                Authenticator auth = new SMTPAuthenticator();
	                Session session = Session.getInstance(p, auth);
	                session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
	                MimeMessage msg = new MimeMessage(session);
	                String message = "안녕하세요. With입니다. 인증번호는"+random+"입니다.";
	                msg.setSubject("[WithProject] 회원가입 이메일 인증번호 입니다."); //제목
	                Address fromAddr = new InternetAddress(ACCOUNT); // 보내는 사람의 메일주소
	                msg.setFrom(fromAddr);
	                Address toAddr = new InternetAddress(memberVO.getEmail()); // 받는 사람의 메일주소
	                msg.addRecipient(javax.mail.Message.RecipientType.TO, toAddr);
	                msg.setContent(message, "text/html;charset=UTF-8");
	                 
	                 
	                Transport.send(msg);
	                     
	                     
	            } catch (Exception mex) {
	                mex.printStackTrace();
	                chkBoolean = false;
	            } 
	            System.out.println(chkBoolean);
	            mav.setViewName("EmailCheckDriver");
	            return mav;
	}

		public ModelAndView mailSender(MemberVO memberVO) {
		
		mav = new ModelAndView();
		
		MemberVO mail = memberDAO.mailSender(memberVO);
		
		System.out.println("mail테스트 입니다."+mail.getEmail());
		
		String Resultid = mail.getId();
		
	      boolean chkBoolean = true;
	      
	        Properties p = new Properties();
	        // 보내는사람 메일 주소(Gmail용)
	        
	            p.put("mail.smtp.user", ACCOUNT); 
	            p.put("mail.smtp.host", "smtp.gmail.com");
	            p.put("mail.smtp.port", "465");
	            p.put("mail.smtp.starttls.enable","true");
	            p.put("mail.smtp.auth", "true");
	            p.put("mail.smtp.debug", "true");
	            p.put("mail.smtp.socketFactory.port", "465");
	            p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	            p.put("mail.smtp.socketFactory.fallback", "false");
	            try {
	                Authenticator auth = new SMTPAuthenticator();
	                Session session = Session.getInstance(p, auth);
	                 
	                session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
	                MimeMessage msg = new MimeMessage(session);
	                String message = "안녕하세요. With입니다. 회원님의 아이디는"+Resultid+"입니다.";
	                msg.setSubject("[WithProject] 회원님이 요청하신 아이디 찾기 결과입니다."); //제목
	                Address fromAddr = new InternetAddress(ACCOUNT); // 보내는 사람의 메일주소
	                msg.setFrom(fromAddr);
	                Address toAddr = new InternetAddress(mail.getEmail()); // 받는 사람의 메일주소
	                msg.addRecipient(javax.mail.Message.RecipientType.TO, toAddr);
	                msg.setContent(message, "text/html;charset=UTF-8");
	                 
	                 
	                Transport.send(msg);
	                     
	                     
	            } catch (Exception mex) {
	                mex.printStackTrace();
	                chkBoolean = false;
	            } 
	            System.out.println(chkBoolean);
	            mav.setViewName("FindId");
	            return mav;
	}

		public void SelectFindId(MemberVO selectmemberVO, HttpServletResponse response) throws IOException {

			memberVO = new MemberVO();
			memberVO = memberDAO.SelectFindId(selectmemberVO);
			System.out.println("member테스트"+memberVO);
			if(memberVO!=null) {
				response.getWriter().print("1");
			}else {
				response.getWriter().print("0");
			}
			
		}

		public void SelectFindPs(MemberVO selectmemberVO, HttpServletResponse response) throws IOException {

			memberVO = new MemberVO();
			memberVO = memberDAO.SelectFindPs(selectmemberVO);
			if(memberVO!=null) {
				response.getWriter().print("1");
			}else {
				response.getWriter().print("0");
			}
			
		}

		public ModelAndView FindPsPro(MemberVO memberVO) {
			
			mav = new ModelAndView();
			
			MemberVO findps = memberDAO.FindPsPro(memberVO);
			String findid = findps.getId();
			System.out.println(findid);
			String phonenum = findps.getTel();
			String api_key = "NCSRCYUAUBZKB9J2";
		    String api_secret = "WZZXZDO3EFPCMATMV21IMFT9EOYWSD5U";
		    Message coolsms = new Message(api_key, api_secret);
		    int random = (int)(Math.random()*100)*(int)(Math.random()*10000);
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", phonenum);
		    params.put("from", "01051476124");
		    params.put("type", "SMS");
		    params.put("text", "[With] 프로젝트 입니다. 인증번호는"+random+"입니다.");
		    params.put("app_version", "test app 1.2"); // application name and version
		    System.out.println("테스트 완료");
		    try {
		        JSONObject obj = (JSONObject) coolsms.send(params);
		        System.out.println(obj.toString());
		        mav.addObject("random", random);
		        mav.addObject("id",findid);
			    mav.setViewName("ResultPs");
		      } catch (CoolsmsException e) {
		        System.out.println(e.getMessage());
		        System.out.println(e.getCode());
		      }
			return mav;
		}

			public ModelAndView ChangePsPro(MemberVO memberVO) {
		mav = new ModelAndView();
		//int result = memberDAO.ChangePsPro(memberVO);
			memberDAO.ChangePsPro(memberVO);
			mav.setViewName("home");
		return mav;
		
	}

			public ModelAndView CodeSuccess(MemberVO memberVO) {
				String id = memberVO.getId();
				session.setAttribute(id, "id");
				
				mav.setViewName("ChangePs");
				return mav;			
				
			}

			public ModelAndView LicenseUpload(MemberVO memberVO, HttpServletResponse response) {
				response.setContentType("text/html;charset=UTF-8");
				mav = new ModelAndView();
				
				memberDAO.LicenseUpload(memberVO);
				
			    mav.setViewName("redirect:home");

				return mav;
			}

			public ModelAndView MemberInformaion(MemberVO memberVO) {
				mav = new ModelAndView();
				
				List<MemberVO> memberList = memberDAO.MemberList();
				
				mav.addObject("member", memberList);
				mav.setViewName("MemberList");
				
				return mav;
			}

			public ModelAndView MemberDetail(String id) {
				System.out.println("MemberService MemberDetail"+id);
				mav = new ModelAndView();
				MemberVO memberdetail = memberDAO.MemberDetail(id);
				System.out.println("MemberVO 타입 memberdetail 체크"+memberdetail.getId());
				mav.addObject("Memberdetail", memberdetail);
				mav.setViewName("MemberDetailView");
			return mav;
			}
			public ModelAndView MemberDelete(String id) {
				
				mav = new ModelAndView();
				
				int result = memberDAO.MemberDelete(id);
				if(result ==0) {
					System.out.println("result값:"+result);
					mav.setViewName("redirect:MemberInfomation");
				}else {
				mav.setViewName("redirect:MemberInfomation");
				}
				
				return mav;
			}
			public ModelAndView DriverApproval(MemberVO memberVO) {	
				mav = new ModelAndView();
				
				List<MemberVO> DriverList = memberDAO.DriverApproval();
				mav.addObject("driverlist", DriverList);
				mav.setViewName("DriverList");
				
				return mav;
			}


			public ModelAndView DriverDetail(String id) {
					mav = new ModelAndView();
					MemberVO driverdetail = memberDAO.DriverDetail(id);
					System.out.println("DriverDetail"+driverdetail.getAddress());
					mav.addObject("DriverDetail", driverdetail);
					mav.setViewName("DriverDetailView");
					return mav;
				}

			public ModelAndView DriverAuthorityApproval(String id) {
		
		memberDAO.DriverAuthorityApproval(id);
		
		mav.setViewName("redirect:DriverApproval");
		
		System.out.println("mav테스트"+mav.getViewName());
		
		return mav;
	}

			public ModelAndView UserPass(HttpSession session2, HttpServletResponse response) throws IOException {
				mav = new ModelAndView();
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				/*"Maps"*/
				String id = (String)session2.getAttribute("id");
				if(id==null) {
					id = "null";
				}
				MemberVO member = memberDAO.MemberDetail(id);
				if(member == null) {
					out.println("<script>");
					out.println("alert('로그인을 해주시기 바랍니다.');");
					out.println("location.href='Login'");
					out.println("</script>");
					out.close();
				}
				if(member.getPassuser() == 1) {
					mav.setViewName("Maps");
				}else {
					out.println("<script>");
					out.println("alert('유저가 아닙니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
				}
				return mav;
				
			}

			public ModelAndView DriverStart(HttpSession session2, HttpServletResponse response) throws IOException {
				mav = new ModelAndView();
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				/*"Maps"*/
				String id = (String)session2.getAttribute("id");
				if(id==null) {
					id = "null";
				}
				if(id.equals("null")) {
					out.println("<script>");
					out.println("alert('로그인을 해주시기 바랍니다.');");
					out.println("location.href='Login'");
					out.println("</script>");
					out.close();
				}
				MemberVO member = memberDAO.MemberDetail(id);
				String DriverType = member.getSigntype();
				
				
				if(member.getPassuser() == 2) {
					mav.setViewName("redirect:RoomList");
				}else {
					out.println("<script>");
					out.println("alert('기사가 아닙니다.');");
					out.println("history.go(-1);");
					out.println("</script>");
					out.close();
				}
				
				if(DriverType.equals("request")) {
					out.println("<script>");
					out.println("alert('관리자의 승인을 기다려주시기 바랍니다.');");
					out.println("location.href='home'");
					out.println("</script>");
					out.close();
				}
				return mav;
				
			}
			public ModelAndView chatservice(int roomId) {
				mav = new ModelAndView();
				
				mav.addObject("roomId", roomId);
				mav.setViewName("chat");
				return mav;
			}

		


}
