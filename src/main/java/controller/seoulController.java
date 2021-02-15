package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import controller.SessionBindingListner;
import dao.SeoulDaoImp;
import dto.UsersDTO;
import service.UsersService;

@Controller
public class seoulController {
	private SeoulDaoImp dao;
	private UsersService userService;
	
	public seoulController() {

	}
	
	public void setDao(SeoulDaoImp dao) {
		this.dao = dao;
	}
	
	public void setUserService(UsersService userService) {
		this.userService = userService;
	}
	
	
//  http://127.0.0.1:8090/myseoul/index.do
//  http://172.16.5.3:8090/myseoul/index.do
	@RequestMapping("/index.do")
	public String process() {
		return "index";
	}

//[1] 로그인페이지로 이동
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		return "login";
	}

//[2] 로그인프로세스
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView loginPro(UsersDTO dto, HttpServletRequest request, ModelAndView mv) {
		int check = dao.loginCheck(dto);
		if(check == 1) {
			//아이디,비밀번호 일치함!
			
			
			//현재 접속자들 출력
			SessionBindingListner.getInstance().printloginUsers();
			
			//이미 접속한 아이디인가?
			if(SessionBindingListner.getInstance().isUsing(dto.getU_id())) {
				System.out.println(dto.getU_id()+" 중복로그인시도!\n");
				mv.addObject("errStr","로그인실패! 이미 접속중인 아이디입니다!");
				mv.setViewName("redirect:/login.do");
			}else {
				HttpSession session = request.getSession();
				SessionBindingListner.getInstance().setSession(session, dto.getU_id());
				
			
			
			
			////////////////////////////////////
				//HttpSession session = request.getSession();
				String acc_session = (String)session.getId();
				String u_id = dto.getU_id();
				dao.updateVisitor(acc_session, u_id);
			
				session.setAttribute("u_id", u_id);
				int gNum = dao.userGnum(u_id);
				session.setAttribute("u_grade", gNum);
			
				String grade = dao.userGname(gNum);
				if(grade.equals("관리자")) {
					mv.setViewName("redirect:/admin.do");
				}else {
					mv.setViewName("redirect:/main.do");
				}
			}
			
		}else {
			mv.addObject("errStr", "로그인실패! 회원정보를 확인해 주세요!");
			mv.setViewName("redirect:/login.do");
		}
		
		return mv;
	}
	
//[3] 로그아웃프로세스
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logoutPro(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/main.do";
	}
	
//[4-1] 회원가입 페이지로 이동	
	@RequestMapping(value="/joinGo.do", method=RequestMethod.GET)
	public String joinGo() {
		return "join";
	}
	
//[4-2] 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk.do", method = RequestMethod.GET)
	public String idChk(HttpServletRequest request) throws Exception {	
		String u_id = request.getParameter("u_id");
		int result =  userService.idChk(u_id);
		
		return Integer.toString(result);
	}
	
//[4-3] 회원가입 등록
	@RequestMapping(value = "/joinGo.do", method = RequestMethod.POST)
	public String joinGoPost(UsersDTO dto) throws Exception {		
		userService.register(dto);		
		return "login";
	}
	
//[5] 리스트로보기 페이지로 이동	
	/*@RequestMapping(value="/listGo.do", method=RequestMethod.GET)
	public String listGo() {
		return "listSearch";
	}*/
	
//[6] 지도로보기 페이지로 이동	
	@RequestMapping(value="/mapGo.do", method=RequestMethod.GET)
	public String mapGo() {
		return "mapSearch";
	}
	
//[7] 집등록 페이지로 이동
// 02월 19일 수정 => manager1Controller로 이동함
	


	
//[9] 자주묻는질문 페이지로 이동
	@RequestMapping(value="/faqGo.do", method=RequestMethod.GET)
	public String faqGo() {
		return "faq";
	}

	

//[12] 장바구니로 이동
	@RequestMapping(value="/myCartGo.do", method=RequestMethod.GET)
	public String myCartGo() {
		return "myCart";
	}
	
//[*] 나의 포인트조회(ajax)
	@RequestMapping(value="/mypoint.do", method=RequestMethod.GET)
	public @ResponseBody int myPoint(String data) {
		return dao.myPoint(data);
	}
	
	
//관리자페이지////////////////////////////////////////////////////////	
	@RequestMapping(value="/adminRefund.do", method=RequestMethod.GET)
	public String adminRefund() {
		return "admin_refund";
	}
	
// manager3Controller로 이동	
/*	@RequestMapping(value="/adminSale.do", method=RequestMethod.GET)
	public String adminSale() {
		return "admin_sale";
	}
	*/
	
	
	
	
	
	
//마이페이지(판매자) : 호스팅관리
	/*@RequestMapping("/myHosting.do")
	public ModelAndView aaaa(ModelAndView mv) {
		
		mv.setViewName("myHosting");
		return mv;
	}*/
	
//마이페이지(판매자) : 환불신청허가
	/*@RequestMapping("/permitRefund.do")
	public ModelAndView bbbb(ModelAndView mv) {
		
		mv.setViewName("permitRefund");
		return mv;
	}*/
	
//마이페이지 : 방문예약 내역
	@RequestMapping("/userReservation.do")
	public ModelAndView ccc(ModelAndView mv) {
		
		mv.setViewName("userReservation");
		return mv;
	}
}