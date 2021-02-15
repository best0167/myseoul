package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.BagDTO;
import dto.BuyListDTO;
import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.RefundDTO;
import dto.ReviewDTO;
import dto.RoomDTO;
import dto.TimetableDTO;
import dto.UsersDTO;
import service.manager4Service;

@Controller
public class manager4Controller {
	
	public manager4Controller() {
	
	}
	
private manager4Service service;
	
	public void setService(manager4Service service) {
		this.service = service;
	}
	
	@Scheduled(cron="0 0 0 1 * ?")  //매월 1일 00시00분 00초에 실행
	public void tstateUpdateRun() throws Exception{
		try {
			service.tstateAllUpdate();
		} catch(Exception e) {
			System.out.println("매월 1일 tstate 업데이트 시 롤백됨.");
		}
	}
	
	@RequestMapping("/housedetail.do")
	public @ResponseBody ModelAndView houseDetail(ModelAndView mav, int h_num, HttpServletRequest req) {
		
		//h_num으로 DB조회한 결과를 HouseDTO 객체로 받아서 house_detail 페이지로 넘김
		//h_num에 해당하는 방도 같이 넘김
		List<RoomDTO> roomList = service.roomListMethod(h_num);
		List<HousePicsDTO> list = service.housePicsProcess(h_num);
		List<ReviewDTO> reviewList = service.selectReviewMethod(h_num);
		
		for(int i=0 ; i<roomList.size() ; i++) {
			for(int j=0 ; j<reviewList.size() ; j++) {
				if(roomList.get(i).getR_num()==reviewList.get(j).getRv_rnum()) {
					reviewList.get(j).setRv_rname(roomList.get(i).getR_name());
				}
			} //end inner for
		} //end outer for
		
		HouseDTO star_1 = new HouseDTO(h_num, 1);
		HouseDTO star_2 = new HouseDTO(h_num, 2);
		HouseDTO star_3 = new HouseDTO(h_num, 3);
		HouseDTO star_4 = new HouseDTO(h_num, 4);
		HouseDTO star_5 = new HouseDTO(h_num, 5);
		
		mav.addObject("house", service.houseDetailMethod(h_num));
		mav.addObject("pic1", list.get(0).getHp_dir());
		mav.addObject("hpdto", list);
		mav.addObject("reviewList", reviewList);
		mav.addObject("roomList", roomList);
		mav.addObject("star_1", service.selectStarCntMethod(star_1));
		mav.addObject("star_2", service.selectStarCntMethod(star_2));
		mav.addObject("star_3", service.selectStarCntMethod(star_3));
		mav.addObject("star_4", service.selectStarCntMethod(star_4));
		mav.addObject("star_5", service.selectStarCntMethod(star_5));
		mav.addObject("today" , nowDate());
		mav.setViewName("homeDetail");
		return mav;
	}
	
	@RequestMapping("/mypage.do")
	public ModelAndView myPage(HttpServletRequest request, ModelAndView mav) {
		//로그인 세션값 가져오기
		String u_id = (String) request.getSession().getAttribute("u_id");
		mav.addObject("user" ,service.userInfoMethod(u_id));
		mav.setViewName("myPage");
		return mav;
	}
	
	
	//마이페이지에서 결제내역 클릭 시 실행
	//id와 by_refund가 n 인것만 가져와야함.
	@RequestMapping("/userBuylist.do")
	public ModelAndView userBuylist(HttpServletRequest request, ModelAndView mav) {
		String by_uid = (String) request.getSession().getAttribute("u_id");
		
		//by_uid로 buylist 테이블 조회
		List<BuyListDTO> buylist = service.selectBuyListMethod(by_uid);
		for(int i=0 ; i<buylist.size() ; i++) {
			//구매한 방번호로 집의 도로명, 상세주소를 BuylistDTO에 setting
			buylist.get(i).setBy_roadaddr(service.houseDetailMethod(buylist.get(i).getBy_hnum()).getH_roadaddr());
			buylist.get(i).setBy_detailaddr(service.houseDetailMethod(buylist.get(i).getBy_hnum()).getH_detailaddr());
			buylist.get(i).setBy_rname(service.roomDetailMethod(buylist.get(i).getBy_rnum()).getR_name());
			
			/*if(buylist.get(i).getBy_refund().equals("y")) {
				//by_num으로 refund테이블에서 rf_cdate 가져와서 buylist에 setting
				int by_num = buylist.get(i).getBy_num();
		
				Date cdate = service.selectRfCdateMethod(by_num);
				buylist.get(i).setRf_cdate(cdate);
			} *///end if
			
		}//end for

		mav.addObject("buylist", buylist);
		mav.setViewName("userBuylist");
		return mav;
	}
	
	//마이페이지에서 장바구니 클릭시 실행됨
	@RequestMapping(value="/userBag.do", method=RequestMethod.GET)
	public ModelAndView userBaglist(HttpServletRequest request, ModelAndView mav){
		String b_uid = (String) request.getSession().getAttribute("u_id");
		List<BagDTO> bagList = service.selectBagListMethod(b_uid);
		
		for(int i=0 ; i<bagList.size() ; i++) {
			BagDTO dto = bagList.get(i);
			dto.setB_hname(service.selectBhnameMethod(dto.getB_hnum()));
			dto.setB_rtstate(service.roomDetailMethod(dto.getB_rnum()).getR_tstate());
		}
		
		mav.addObject("bagList", bagList);
		mav.addObject("today", nowDate());
		mav.setViewName("userBag");
		return mav;
	}
	
	//집 상세페이지에서 장바구니 담기 클릭 시 실행됨. DB에 입력만 됨.
	@RequestMapping(value="/insertBag.do")
	public ModelAndView userBaglist(BagDTO bag, ModelAndView mav) throws ParseException {	
		int b_hnum = bag.getB_hnum();
		int b_rnum = bag.getB_rnum();
	
		//b_hnum으로 bag dto에 setting (bagDTO에 집 이름 추가)
		HouseDTO house = service.selectBagMethod(b_hnum);
		bag.setB_roadaddr(house.getH_roadaddr());
		bag.setB_detailaddr(house.getH_detailaddr());
		bag.setB_pid(house.getH_uid());
		
		//b_rnum으로 bag dto에 setting
		RoomDTO room = service.BagRnameRpriceMethod(b_rnum);
		bag.setB_name(room.getR_name());
		bag.setB_price(room.getR_price());
		
		Date b_startdate = getStartdate();
		Date b_enddate = getEnddate();
		bag.setB_startdate(b_startdate);
		bag.setB_enddate(b_enddate);
		
		try {
			service.bagInsert(bag);
		} catch(Exception e) {
			System.out.println("장바구니 입력 시 롤백됨");
		}
		//DB bag테이블에 저장시키고 마이페이지의 장바구니 redirect
		mav.setViewName("redirect:/userBag.do"); 
		return mav;
	}
	
	//장바구니 리스트에서 삭제 클릭시 실행됨.
	@RequestMapping("/deleteBag.do")
	public String deleteBagList(int b_num) {
		try {
			service.bagListDelete(b_num);			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("장바구니 삭제시 롤백됨");
		}
		return "redirect:/userBag.do";
	}
	
	//결제하기페이지이동
	@RequestMapping(value="/buyPage.do", method=RequestMethod.GET)
	public ModelAndView buyRoomPage(BuyListDTO buy, ModelAndView mav) throws ParseException {
		//by_rnum으로 room테이블에서 호스트아이디, 결제할 집번호, 결제가격, [시작일, 종료일] -> r_num, h_num으로 setting
		RoomDTO room = service.roomDetailMethod(buy.getBy_rnum());	
		buy.setBy_pid(room.getR_pid());
		buy.setBy_hnum(room.getR_hnum());
		buy.setBy_price(room.getR_price());
			
		// 세션아이디, 방번호, 시작일로 bag에 저장되어 있는지 조회한다.
		BagDTO bag = new BagDTO(buy.getBy_uid(), buy.getBy_rnum(), getStartdate());
			
		// (1) 장바구니에서 결제 클릭 -> bag 에 등록되어 있으면 bag테이블에서 startdate, enddate 가져온다.
		//세션아이디, 방번호, 시작일로 조회한 bag null이 아니면 -> 값이 있으면  bag의 시작일, 종료일을 buyList에 시작일, 종료일로 setting
		if(service.bagInfoCheckMethod(bag)!=null)	{
			buy.setBy_startdate(service.bagInfoCheckMethod(bag).getB_startdate());
			buy.setBy_enddate(service.bagInfoCheckMethod(bag).getB_enddate());
		} else {
			// (2) 집 상세페이지에서 결제클릭 -> bag에 등록 안되어 있으면 getStartdate, getEnddate 메소드로 시작일, 종료일을 setting
			buy.setBy_startdate(getStartdate());
			buy.setBy_enddate(getEnddate());
		}
			
		mav.addObject("buy", buy);
		mav.addObject("house", service.houseDetailMethod(buy.getBy_hnum()));
		mav.addObject("r_name", service.roomDetailMethod(buy.getBy_rnum()).getR_name());
		mav.addObject("u_point", service.userInfoMethod(buy.getBy_uid()).getU_point());
		mav.setViewName("buyPage");
		return mav;
	}
	
	//결제클릭시 DB에 insert
	@RequestMapping(value="/buyRoom.do", method=RequestMethod.POST)
	public ModelAndView insertBuyList(BuyListDTO buy, ModelAndView mav) {
		//BuyListDTO buydto = new BuyListDTO(buy.getBy_uid(), buy.getBy_rnum(), buy.getBy_startdate());
		String id = buy.getBy_uid();
		int by_point = buy.getBy_point();
			
		//[1] 사용한 포인트 차감 -> user 테이블에 update
		int u_point = service.userInfoMethod(id).getU_point();
		int left_point = u_point - by_point;
			
		//id로 users테이블에서 포인트 update하기
		UsersDTO user = service.userInfoMethod(id);
		user.setU_point(left_point);	
		try {
			service.usersPointUpdate(user);			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원테이블 포인트 업데이트 시 롤백됨");
		}
			
		//[2] 결제테이블 insert
		try {
			service.buyListInsert(buy);			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("결제테이블 입력 시 롤백됨");
		}

		//[3] 결제한 방이 장바구니 테이블에 있는 방이면 장바구니 테이블에서 삭제 
		BagDTO bag = new BagDTO(buy.getBy_uid(), buy.getBy_rnum(), buy.getBy_startdate());
			
		if(service.bagInfoCheckMethod(bag) != null) {
			try {
				service.checkBagDelete(bag);
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("결제후 장바구니 레코드 삭제 중 롤백됨");
			}
		}
		
		//u_id, byrnum, bystartdate로 buylist 조회
		BuyListDTO buydto = service.buyListDetailMethod(new BuyListDTO(buy.getBy_uid(), buy.getBy_rnum(), buy.getBy_startdate()));
			
		//[4]timetable에 입력
		TimetableDTO timetable = new TimetableDTO();
		timetable.setT_bynum(buydto.getBy_num());
		timetable.setT_uid(buydto.getBy_uid());
		timetable.setT_hnum(buydto.getBy_hnum());
		timetable.setT_rnum(buydto.getBy_rnum());
		timetable.setT_startdate(buydto.getBy_startdate());
		timetable.setT_enddate(buydto.getBy_enddate());
		
		try {
			service.timeTableInsert(timetable);
			//System.out.println("타임테이블 정상");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("타임테이블 insert중 롤백됨");
		}
			
		//[5]timetable에 입력되면 room r_tstate를 n으로 업데이트
		int r_num = timetable.getT_rnum();
				
		try {
			service.tstateNoUpdate(r_num);
			//System.out.println("타임테이블2 정상");
		} catch(Exception e) {
			System.out.println("r_tstate를 n으로 업데이트 중 롤백됨.");
		}
				
		mav.addObject("house", service.houseDetailMethod(buy.getBy_hnum()));
		mav.addObject("room", service.roomDetailMethod(buy.getBy_rnum()));
		mav.addObject("buydto", buydto);
		//결제내역 페이지 이동
		mav.setViewName("redirect:/userBuylist.do");
			
		return mav;
	}
	
	@RequestMapping("/reviewPage.do")
	public ModelAndView reviewPage(int by_num, ModelAndView mav) {
		//System.out.println("구매번호 : "+by_num);
		
		BuyListDTO buy = service.selectBuyNumMethod(by_num);
		buy.setBy_hname(service.selectBhnameMethod(buy.getBy_hnum()));
		buy.setBy_rname(service.selectRnameMethod(buy.getBy_rnum()));
		
		mav.addObject("buyInfo", buy);
		mav.setViewName("reviewPage");
		return mav;
	}
	
	@RequestMapping(value="/insReview.do", method=RequestMethod.POST)
	public ModelAndView insertReview(ReviewDTO review, ModelAndView mav, HttpServletRequest request) {
		MultipartFile image = review.getRv_filename();
		
		if(!image.isEmpty()) {
			String fileName = image.getOriginalFilename();
		
			UUID random = UUID.randomUUID();
		
			/* 파일을 영구적으로 저장할 위치 설정*/
			//현재 서버의 위치값(session 객체)을 받아와서 처리함
			String root ="C:\\mydevenv\\teamProject_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\";
		
			//root 다음에 "review" 폴더를 만듬
			String saveDirectory = root + "review" + File.separator;
			//fe: 실제 파일이 저장되는 위치
			File fe = new File(saveDirectory);
		
			/* saveDirectory 만들기 */
			if(!fe.exists()) {
				fe.mkdir();
			}
		
			/* 실제 파일명에 난수값을 붙인다. */
			//saveDirectory 위치에 random_fileName이름으로 저장됨
			File ff = new File(saveDirectory, random+"_"+fileName);

			//파일 안의 내용 써주기
			try {
				FileCopyUtils.copy(image.getInputStream(), new FileOutputStream(ff));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		
			review.setRv_picture(File.separator+"review"+File.separator+random+"_"+fileName);
		}  //end if
		
		int check = service.checkReviewMethod(review);
		if(check==0) {
			//리뷰 테이블에 insert
			try {
				service.reviewInsert(review);
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("리뷰테이블 입력 중 롤백됨");
			}
			
			//user의 point update
			UsersDTO users = service.userInfoMethod(review.getRv_uid());
			try {
				service.reviewPointUpdate(users);
			} catch(Exception e) {
				System.out.println("회원 포인트 업데이트 중 롤백됨.");
			}

		} /*else {  //중복되어 있으면
			mav.addObject("msg", "이미 작성한 리뷰가 있습니다.");
		}*/
		
		mav.addObject("h_num", review.getRv_hnum());
		mav.setViewName("redirect:/housedetail.do");
		return mav;
	}
	
	//마이페이지에서 환불내역 클릭 시
	@RequestMapping("/userRefundlist.do")
	public ModelAndView showUidRefundList(HttpServletRequest request, ModelAndView mav) throws ParseException {
		String rf_uid = (String) request.getSession().getAttribute("u_id");
		//System.out.println(rf_uid);
		
		//u_id로 refund테이블 조회
		List<RefundDTO> refundList = service.selectUidRefundListMethod(rf_uid);
		
		for(int i=0 ; i < refundList.size() ; i++) {
			int rf_hnum = refundList.get(i).getRf_hnum();
			refundList.get(i).setRf_hname(service.houseDetailMethod(rf_hnum).getH_name());
			refundList.get(i).setRf_roadaddr(service.houseDetailMethod(rf_hnum).getH_roadaddr());
			refundList.get(i).setRf_detailaddr(service.houseDetailMethod(rf_hnum).getH_detailaddr());
			
			int rf_rnum = refundList.get(i).getRf_rnum();
			refundList.get(i).setRf_rname(service.roomDetailMethod(rf_rnum).getR_name());
			
			refundList.get(i).setRf_bystartdate(getStartdate());
			refundList.get(i).setRf_byenddate(getEnddate());
		}
		
		mav.addObject("refundList", refundList);
		mav.setViewName("userRefundlist");
		return mav;
	}
	
	//환불페이지요청
	@RequestMapping(value = "/applyRefund.do", method = RequestMethod.GET)
	public ModelAndView sellerApply(int by_num, ModelAndView mav) {
		BuyListDTO buylist = service.selectBuyNumMethod(by_num);

		HouseDTO house = service.houseDetailMethod(buylist.getBy_hnum());
		buylist.setBy_hname(house.getH_name());
		buylist.setBy_roadaddr(house.getH_roadaddr());
		buylist.setBy_detailaddr(house.getH_detailaddr());
		
		String rname = service.selectRnameMethod(buylist.getBy_rnum());
		buylist.setBy_rname(rname);

		mav.addObject("buy", buylist);
		mav.setViewName("userApplyRefund");
		return mav;
	}

	// 환불테이블 insert
	@RequestMapping(value = "/insertRefund.do", method = RequestMethod.POST)
	public ModelAndView insertRefund(RefundDTO refund, ModelAndView mav) {
		// System.out.println(refund.getRf_pid());

		// [1] refundDTO로 refund테이블에 insert
		try{
			service.refundInsert(refund);
		} catch(Exception e) {
			System.out.println("환불 테이블 입력 시 롤백됨");
		}
		
		// [2] 환불테이블에 입력되면 buylist의 by_refund를 i로 업데이트
		try {
			service.byrefund1Update(refund.getRf_bynum());
		} catch(Exception e) {
			System.out.println("buylist 업데이트 시 롤백됨");
		}
		
		mav.setViewName("redirect:/userBuylist.do");
		return mav;
	}
	
	//판매자가 마이페이지에서 환불요청메뉴 클릭 시
	@RequestMapping("/permitRefund.do")
	public ModelAndView showPidRefundList(String rf_pid, ModelAndView mav) {
		//System.out.println(rf_pid);
		
		List<RefundDTO> refundList = service.selectRefundMethod(rf_pid);
		
		for(int i=0 ; i<refundList.size() ;i++) {
			HouseDTO house = service.houseDetailMethod(refundList.get(i).getRf_hnum());
			refundList.get(i).setRf_hname(house.getH_name());
			refundList.get(i).setRf_roadaddr(house.getH_roadaddr());
			refundList.get(i).setRf_detailaddr(house.getH_detailaddr());
			
			String rname = service.selectRnameMethod(refundList.get(i).getRf_rnum());
			refundList.get(i).setRf_rname(rname);
		}
		
		mav.addObject("refundList", refundList);
		mav.setViewName("permitRefund");
		return mav;
	}
	
	//판매자가 환불 승인 클릭시
	@RequestMapping("/sellerRefund.do")
	public ModelAndView sellerRefund(int rf_num, ModelAndView mav) {
		//System.out.println(rf_num);
		
		//[1] rf_prog y(환불완료)로 업데이트 & cdate를 sysdate(승인날짜)로 업데이트
		try {
			service.rfProg1Update(rf_num);
		} catch(Exception e) {
			System.out.println("rf_prog y 업데이트 시 롤백됨");
		}
		
		//[2] by_refund y로 업데이트
		RefundDTO refund = service.selectRefundNumMethod(rf_num);
		try {
			service.byrefund2Update(refund.getRf_bynum());
		} catch(Exception e) {
			System.out.println("by_refund y 업데이트 시 롤백됨");
		} 

		//[3] room에서 r_tstate 'y'로 업데이트
		int r_num = refund.getRf_rnum();
		try {
			service.tstateYesUpdate(r_num);			
		} catch(Exception e) {
			System.out.println("rtstate y로 업데이트 중에 롤백됨");
		}
		
		//[4] timetable 레코드 삭제
		try {
			service.timetableDelete(r_num);
		} catch(Exception e) {
			System.out.println("timetable 삭제중 롤백됨");
		}
		////////////////////////////////////////////////////////////////////////
		
		//[5] 포인트 환원
		int rf_point = refund.getRf_point();

		if(rf_point!=0) {
			//rf_point를 user의 u_point에 update
			String u_id = refund.getRf_uid();
			int u_point = service.selectUPointMethod(u_id);
			
			UsersDTO users = new UsersDTO(u_id, u_point, rf_point);
			try{
				service.rfPointUpdate(users);
			} catch(Exception e) {
				System.out.println("rf_point 환원시 롤백됨.");
			}
		} //end if
		
		//[6] refund의 rf_bynum으로 buylist에서 by_refund 'y'인거 삭제
		try {
			service.refundNumDelete(refund.getRf_bynum());
		} catch(Exception e) {
			System.out.println("환불완료된 집을 결제내역에서 삭제 중 롤백됨.");
		}
		
		//[7] 리뷰삭제
		if(service.checkRefundReviewMethod(refund.getRf_bynum())!=0) { 
			try {
				service.refundReviewDelete(refund.getRf_bynum());
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("환불 승인 작성한 리뷰 삭제중 롤백됨.");
			}
		}
		
		mav.addObject("rf_pid", refund.getRf_pid());
		mav.setViewName("redirect:/permitRefund.do");
		return mav;
	}
	
	//환불거부
	@RequestMapping("/rejectRefund.do")
	public ModelAndView rejectRefund(int rf_num, ModelAndView mav) {
		//System.out.println(rf_num);
		try {
			service.refundRejectUpdate(rf_num);
		} catch (Exception e ) {
			System.out.println("환불 거절 중 롤백됨");
		}
		
		RefundDTO refund = service.selectRefundNumMethod(rf_num);
		try {
			service.byrefund3Update(refund.getRf_bynum());			
		} catch (Exception e){
			System.out.println("by_refund n으로 업데이트 중 롤백");
		}
		
		mav.addObject("rf_pid", refund.getRf_pid());
		mav.setViewName("redirect:/permitRefund.do");
		return mav;
	}
	
	
	//시작일 구하기
	public Date getStartdate() throws ParseException {
			
		Calendar cal = Calendar.getInstance();
		//현재 년도
		int nowYear = cal.get(Calendar.YEAR);
		//다음월
		int nextMonth = nowMonth()+1;
		//cal에 현재년도, 다음월, 아무날짜입력
		cal.set(nowYear, nextMonth-1, 1);
		//다음월의 최소날짜
		int nextMonthFirst = cal.getActualMinimum(cal.DAY_OF_MONTH);
		
		//System.out.println("년 : "+nowYear);
		//System.out.println("월 : "+nextMonth);
		//System.out.println("첫째날 : "+nextMonthFirst);
		
		String start = nowYear+"/"+nextMonth+"/"+nextMonthFirst;
		//System.out.println("다음달의 시작일 :"+start);

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd");

		Date startdate = transFormat.parse(start);

		return startdate;
	}
	
	//종료일 구하기
	public Date getEnddate() throws ParseException {
			
		Calendar cal = Calendar.getInstance();
		//현재 년도
		int nowYear = cal.get(Calendar.YEAR);
		//다음월
		int nextMonth = nowMonth()+1;
		//cal에 현재년도, 다음월, 아무날짜입력
		cal.set(nowYear, nextMonth-1, 1);
		//다음월의 최대날짜
		int nextMonthLast = cal.getActualMaximum(cal.DAY_OF_MONTH);
		//System.out.println("년 : "+nowYear);
		//System.out.println("월 : "+nextMonth);
		//System.out.println("마지막날 : "+nextMonthLast);
		String end = nowYear+"/"+nextMonth+"/"+nextMonthLast;
		//System.out.println("다음달의 마지막일 :"+enddate);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy/MM/dd");
			
		Date enddate = transFormat.parse(end);
		return enddate;
	}
	
	//현재 월 구하기
	public int nowMonth() {
		int month=0;
		
		Calendar cal = Calendar.getInstance();
		month = cal.get(cal.MONTH) + 1;

		return month;
	}
	
	//현재 일 구하기
	public int nowDate() {
		int date=0;
		
		Calendar cal = Calendar.getInstance();
		date = cal.get(cal.DATE);
		return date;
	}
}
