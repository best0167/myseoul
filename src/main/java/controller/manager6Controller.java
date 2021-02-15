package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.AdminRefundPageDTO;
import dto.RoomDTO;
import dto.UsersDTO;
import dto.UsersListPageDTO;
import dto.VisitDTO;
import service.manager6Service;

@Controller
public class manager6Controller {
	private manager6Service man6Service;
	private int currentPage;
	private UsersListPageDTO pdto;
	private AdminRefundPageDTO adto;
	
	public manager6Controller() {
	// TODO Auto-generated constructor stub
	}
	
	public void setMan6Service(manager6Service man6Service) {
		this.man6Service = man6Service;
	}
	
	// [5-1] 관리자페이지(유저관리) 이동
	@RequestMapping(value = "/adminUserTotal.do", method = RequestMethod.GET)
	public ModelAndView adminUser(ModelAndView mv, UsersListPageDTO pv) {

		int totalRecord = man6Service.count(pv);
		/*System.out.println(totalRecord);*/

		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			// mv.addObject("waitList", man1Service.managementUser());
			pdto = new UsersListPageDTO(currentPage, totalRecord, pv.getSearchKey(), pv.getSearchWord(),
					pv.getU_grade());
			mv.addObject("usersList", man6Service.usersList(pdto));
			mv.addObject("pv", pdto);
		}
		mv.setViewName("admin_user_total");
		return mv;
	}

	// 관리자의 회원 수정 페이지
	@RequestMapping(value = "/adminUserUpdate.do")
	public ModelAndView adminUserUpdate(ModelAndView mv, String u_id) {

		mv.addObject("dto", man6Service.userInfo(u_id));

		mv.setViewName("admin_user_update");
		return mv;
	}

	// 관리자의 회원 정보 수정 처리
	@RequestMapping(value = "/adminUserUpdatePro.do", method = RequestMethod.POST)
	public String userUpdatePost(@ModelAttribute("dto") UsersDTO dto, ModelAndView mav) {

		try {
			man6Service.adminUserUpdate(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("수정완료");

		return "redirect:/adminUserTotal.do";
	}

	@RequestMapping(value = "/deleteConfirm.do", method = RequestMethod.GET)
	public ModelAndView deleteConfirm(ModelAndView mv, String u_id) {

		mv.addObject("u_id", u_id);
		mv.setViewName("adminUserDeleteConfirm");
		return mv;
	}

	@RequestMapping(value = "/adminUserDelete.do", method = RequestMethod.GET)
	public ModelAndView adminUserDelete(ModelAndView mv, String u_id) {

		try {
			man6Service.adminUserDelete(u_id);
			System.out.println("u_id :" + u_id);
		} catch (Exception e) {
			System.out.println("선택값없음");
		}
		System.out.println("삭제완료");
		mv.setViewName("redirect:/adminUserTotal.do");

		return mv;

		/*
		 * PageDTO pdto=new PageDTO(pv.getCurrentPage(), man6Service.count(pv));
		 * 
		 * if(pdto.getTotalPage()<pv.getCurrentPage()) { mv.addObject("currentPage",
		 * pdto.getTotalPage()); }else { mv.addObject("currentPage",
		 * pv.getCurrentPage()); }
		 * 
		 * mv.setViewName("redirect:/adminUser2.do");
		 * 
		 * return mv;
		 */
	}
	
	@RequestMapping("visitReservation.do")//방문예약 팝업
	public ModelAndView visitReservation(ModelAndView mv, HttpServletRequest request, RoomDTO rDto, int r_hnum,String r_pid) {
		String u_id= (String) request.getSession().getAttribute("u_id");
		
		if(u_id != null) {
			mv.addObject("hdto", man6Service.selectHouse(r_hnum));
			mv.addObject("rdto", man6Service.selectRoom(rDto));
			mv.addObject("pdto", man6Service.pUserInfo(r_pid));
			mv.addObject("dto", man6Service.userInfo(u_id));
			mv.setViewName("userUpdate");
		} 
		
		mv.setViewName("visitReservation");
		return mv;
	}
	
	@RequestMapping(value = "visitReservationPro.do")//방문예약 과정
	public ModelAndView visitReservationPro(ModelAndView mv, VisitDTO vDto) {
		
		man6Service.visitReservation(vDto);
		
		return mv;
	}
	
	//마이페이지 : 방문예약 내역
		@RequestMapping("/userReservation2.do")
		public ModelAndView userReservation(ModelAndView mv, HttpServletRequest request) {
			String u_id = (String) request.getSession().getAttribute("u_id");
			
			mv.addObject("vList", man6Service.visitList(u_id));
			mv.setViewName("userReservation");
			return mv;
		}
		
		@RequestMapping("/requestReservation.do")
		public ModelAndView requestReservation(ModelAndView mv, HttpServletRequest request) {
			String u_id = (String) request.getSession().getAttribute("u_id");
			
			mv.addObject("vList", man6Service.requestVisitList(u_id));
			mv.setViewName("requestReservation");
			return mv;
		}
		

		//관리자페이지(seoulController에서 가져옴)////////////////////////////////////////////////////////	
		@RequestMapping(value="/adminRefund2.do", method = RequestMethod.GET)
		public ModelAndView adminRefund(ModelAndView mv, AdminRefundPageDTO udto) {
			int totalRecord=man6Service.refundCount(udto);
			if(totalRecord>=1) {
				if(udto.getCurrentPage()==0) {
					currentPage=1;
				}else {
					currentPage=udto.getCurrentPage();
				}
				adto=new AdminRefundPageDTO(currentPage,totalRecord,udto.getSearchKey(),udto.getSearchWord());
				mv.addObject("rList", man6Service.adminRefundList(adto));
				mv.addObject("pv",adto);
			}
			mv.setViewName("admin_refund");
			return mv;
		}
}
