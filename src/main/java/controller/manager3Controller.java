package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.SellListPageDTO;
import dto.UsersDTO;
import dto.permitHousePageDTO;
import service.UsersService;

@Controller
public class manager3Controller {
	private UsersService service3;
	private int currentPage;
	private permitHousePageDTO pdto;
	private SellListPageDTO pdto1;
	
	public manager3Controller() {
	// TODO Auto-generated constructor stub
	}
	
	public void setService3(UsersService service3) {
		this.service3 = service3;
	}
	
	// 아이디 찾기 폼
	@RequestMapping(value="/searchUser.do", method=RequestMethod.GET)
	public String find_id_form() throws Exception {
		return "searchUser";
	}
		
	// 아이디 찾기
	@RequestMapping(value = "/find_id.do", method=RequestMethod.GET)
	public @ResponseBody String find_id(String u_email) throws Exception {
		return service3.findId(u_email);
		
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value="/searchUserPw.do", method=RequestMethod.GET)
	public String find_pw_form() throws Exception {
		return "searchUserPw";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw.do", method=RequestMethod.GET)
	public @ResponseBody String find_pw(UsersDTO dto) throws Exception {
		return service3.findPw(dto);
		
	}
	
	// 회원 정보 수정 처리 페이지 이동
	@RequestMapping("/userUpdate.do")
	public ModelAndView userUpdate(ModelAndView mav, HttpServletRequest request) {
		String u_id = (String) request.getSession().getAttribute("u_id");
		
		if(u_id != null) {
			mav.addObject("dto", service3.viewUser(u_id));
			mav.setViewName("userUpdate");
		} 
			
		return mav;
	}
		
	// 회원 정보 수정 처리
	@RequestMapping(value="/mypage_users_update.do", method=RequestMethod.POST)
	public String userUpdatePost(@ModelAttribute("dto" ) UsersDTO dto, HttpServletRequest request, ModelAndView mav) {
		String u_id = (String) request.getSession().getAttribute("u_id");
		dto.setU_id(u_id);
		
		try {
			service3.updateUser(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("수정완료");
		
	
		return "redirect:/userUpdate.do";
	}
		
	@RequestMapping(value="/mypage_users_delete.do", method=RequestMethod.POST)
	public String userDelete(UsersDTO dto, HttpServletRequest request, ModelAndView mav) {
		String u_id = (String) request.getSession().getAttribute("u_id");
		dto.setU_id(u_id);
			
		try {
			service3.deleteUser(dto.getU_id());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("삭제완료");
		return "redirect:/main.do";
	}
	
	
//03월13일	
	//[4-1] 관리자페이지(집허가 관리) 이동
	//관리자권한 : 집관리(전체집)
	@RequestMapping(value="/adminPermitEnroll.do", method=RequestMethod.GET)
	public ModelAndView adminPermitEnroll(ModelAndView mav, permitHousePageDTO pv) {
					
		int permitRecord = service3.PermitCount(pv);
		
		if(permitRecord >= 1) {
			//현재 페이지 값이 없으면
			if(pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			
			pdto = new permitHousePageDTO(currentPage, permitRecord, pv.getSearchKey(), pv.getSearchWord(), pv.getH_permit(), pv.getH_gender(), pv.getH_type(), pv.getH_region());
		
			mav.addObject("permitList",service3.PermitList(pdto));
			mav.addObject("pv", pdto);
		}
		mav.setViewName("adminPermitEnroll");
		
		return mav;
		
	}
	
	// [4-2] 관리자페이지 집 등록허가취소
	// 집 등록허가 취소 script
	@RequestMapping("/enroll_cancelConfirm.do")
	public ModelAndView enrollCancelConfirm(ModelAndView mav, int h_num) {
		mav.addObject("h_num", h_num);
		mav.setViewName("enrollCancelConfirm");

		return mav;
	}

	// [4-2] 관리자페이지 집 등록허가취소
	@RequestMapping(value = "/cancelPermitEnroll.do", method = RequestMethod.GET)
	public ModelAndView cancelPermitEnroll(HttpServletRequest request, ModelAndView mav, permitHousePageDTO pv,
			int h_num) {

		try {
			service3.cancelPermitEnroll(h_num);

		} catch (Exception e) {
			System.out.println("선택값없음");
		}

		System.out.println("허가 취소 완료");
		mav.setViewName("redirect:/adminPermitEnroll.do");
		return mav;
	}

	@RequestMapping("/enroll_deleteConfirm.do")
	public ModelAndView enrollDeleteConfirm(ModelAndView mav, int h_num) {
		mav.addObject("h_num", h_num);
		mav.setViewName("enrollDeleteConfirm");

		return mav;
	}

	// 집등록정보 삭제 -> manager1Controller로 이동함
	/*@RequestMapping(value = "/adminEnroll_delete.do", method = RequestMethod.GET)
	public String adminEnrollDelete(ModelAndView mav, int h_num) {

		
		 * try { service3.deleteHouse(h_num); System.out.println("h_num:" + h_num); }
		 * catch (Exception e) { System.out.println("선택값없음"); }
		 * 
		 * 
		 * System.out.println("삭제완료"); return "redirect:/adminPermitEnroll.do"; }
		 
		return null;
	}*/

	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailChk.do", method = RequestMethod.GET)
	public String emailChk(HttpServletRequest request) throws Exception {
		String u_email = request.getParameter("u_email");
		int result = service3.emailChk(u_email);

		return Integer.toString(result);
	}
	
    // 매출현황 페이지로 이동
    @RequestMapping(value="/adminSale.do", method=RequestMethod.GET)
    public ModelAndView adminSaleView(ModelAndView mav, SellListPageDTO pv) {
       
       int sellListRecord = service3.sellListCount(pv);
       
       if(sellListRecord >= 1) {
          if(pv.getCurrentPage() == 0) {
             currentPage = 1;
          } else {
             currentPage = pv.getCurrentPage();
          }
       }
       
       pdto1 = new SellListPageDTO(currentPage, sellListRecord, pv.getSearchKey(), pv.getSearchKey3(), pv.getSearchWord(), pv.getDate());
       mav.addObject("sellList", service3.viewSellList(pdto1));
       mav.addObject("pv", pdto1);
       
       mav.setViewName("admin_sale");
       
       return mav;
    }

}
