package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.manager1DAO;
import dto.AdminIndexDTO;
import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.RoomDTO;
import dto.RoomPicsDTO;
import dto.WatingDTO;
import service.FileUploadService;
import service.manager1Service;

@Controller
public class manager1Controller {
	private manager1DAO man1Dao;
	private manager1Service man1Service;
	private FileUploadService fileUploadService;
	
	public manager1Controller() {
	// TODO Auto-generated constructor stub
	}
	
	public void setMan1Dao(manager1DAO man1Dao) {
		this.man1Dao = man1Dao;
	}
	
	public void setMan1Service(manager1Service man1Service) {
		this.man1Service = man1Service;
	}
	
	public void setFileUploadService(FileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}
	
//[1] 메인페이지 이동  http://127.0.0.1:8090/myseoul/main.do
	@RequestMapping("/main.do")
	public ModelAndView mainGo(ModelAndView mv) {
		mv.addObject("starRank",man1Service.starLank());
		mv.addObject("readRank",man1Service.readLank());
		mv.addObject("regRank",man1Service.regLank());
		mv.setViewName("main");
		return mv;
	}
	
// 02월 19일 수정
//[2-1] 집등록 페이지로 이동
	@RequestMapping(value="/enrollGo.do", method=RequestMethod.GET)
	public ModelAndView enrollGo(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession();
		String session_Id=(String)session.getAttribute("u_id");

		if(!(session_Id==null || session_Id=="")) {
			//세션에 아이디가 있으면, 회원등급이름과 집등록유형리스트 넘겨줌
			mv.addObject("grade", man1Service.userGname(session_Id));
			mv.addObject("typeList",man1Service.houseType());
		}

		mv.setViewName("enroll");
		return mv;
	}

// 02월 20일
//[2-2] 집등록 수행
	@RequestMapping(value="/homePro.do", method=RequestMethod.POST)
	public ModelAndView enrollHome(@ModelAttribute("dto" ) HouseDTO dto, @RequestParam(required=false) List<MultipartFile> files, 
			                                         HttpServletRequest request, ModelAndView mv) {
		//집등록
		man1Service.enrollHouse(dto);
		int h_num = dto.getH_num();
		
		//집사진등록
		String path="C:\\mydevenv\\teamProject_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\";
		// path = C:\mydevenv\workspace_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\seoulMate1\
		
		for(int index=0; index<files.size();index++) {
			String url = fileUploadService.restore(files.get(index),path,h_num);
			//System.out.println(url);  //체크용!
			HousePicsDTO picDto = new HousePicsDTO();
			picDto.setHp_hnum(h_num);
			picDto.setHp_dir(url);
			man1Service.enrollHousePics(picDto);
		}
		
		mv.setViewName("enrollRoom");
		return mv;
	}
	
// 02월 21일
//[2-3] 방등록수행
	@RequestMapping(value="/roomPro.do", method=RequestMethod.POST)
	public ModelAndView enrollRoom(RoomDTO rooms, RoomPicsDTO pics, HttpServletRequest request, ModelAndView mv) {
		
		List<RoomDTO> dtoList = rooms.getRoomDtoList();  // 각방의 방dto가 담긴 리스트
		List<RoomPicsDTO> picsDtoList = pics.getRoomPicsDtoList();  //각방의 방사진dto가 담긴 리스트
		
		for(int index=0; index<dtoList.size();index++) {
			//(1)방등록
			RoomDTO dto = dtoList.get(index);  // (index) 방의 방dto 가져옴
			man1Service.enrollRoom(dto); //(index)방  등록
			
			//(2)방사진등록
			int h_num = dto.getR_hnum();  //집번호
			int r_num = dto.getR_num();  //방번호
			
			RoomPicsDTO picsDto = picsDtoList.get(index); //(index)방의 방사진dto
			List<MultipartFile> files = picsDto.getFiles();  //(index)방의 방사진 리스트
			//System.out.println(files.size()); //체크용

			String path="C:\\mydevenv\\teamProject_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\";
			// path = 설정된workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\seoulMate1\
			for(int inner=0;inner<files.size();inner++) {
				String url = fileUploadService.restore(files.get(inner),path,h_num,r_num);
				//System.out.println(url);  //체크용!
				RoomPicsDTO insDto = new RoomPicsDTO();
				insDto.setRp_hnum(h_num);
				insDto.setRp_rnum(r_num);
				insDto.setRp_dir(url);
				man1Service.enrollRoomPics(insDto);
			}
			
		}
		
		mv.setViewName("redirect:/myHosting.do");
		return mv;
	}
	
	
//02월 24일
//[3]	관리자페이지(인덱스) 이동
	@RequestMapping(value="/admin.do", method=RequestMethod.GET)
	public ModelAndView goManagement(HttpServletRequest request,ModelAndView mv) {
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("u_id");
		AdminIndexDTO dto = new AdminIndexDTO();
		dto = man1Service.adminSetData(u_id);
		mv.addObject("indexInfo",dto);
		session.setAttribute("admin_name", dto.getAdmin_name());
		mv.setViewName("admin_index");
		return mv;
	}
	
//[4-1] 관리자페이지(집 관리) 이동
	@RequestMapping(value="/adminEnroll.do", method=RequestMethod.GET)
	public ModelAndView adminEnroll(ModelAndView mv) {
		
		mv.addObject("waitList",man1Service.managementEnroll());
		mv.setViewName("admin_enroll");
		return mv;
	}
	
//[4-2] 관리자페이지 집 등록허가(업데이트)	
	@RequestMapping(value="/adminEnroll.do", method=RequestMethod.POST)
	public ModelAndView adminEnrollPro(HttpServletRequest request,ModelAndView mv) {
		try {
			String[] permitArr = request.getParameterValues("permit");  //승인할 집등록번호배열
			man1Service.permitEnroll(permitArr);
		}catch(Exception e) {
			System.out.println("선택값없음");
		}
		
		mv.setViewName("redirect:/adminEnroll.do");
		return mv;
	}
	
//[5-1] 관리자페이지(유저관리) 이동
	@RequestMapping(value="/adminUser.do", method=RequestMethod.GET)
	public ModelAndView adminUser(ModelAndView mv) {
		mv.addObject("waitList", man1Service.managementUser());
		mv.setViewName("admin_user");
		return mv;
	}
	
//03월03일
//[5-2] 관리자페이지 판매유저 허가(업데이트)	
	@RequestMapping(value="/adminUser.do", method=RequestMethod.POST)
	public ModelAndView adminUserPro(HttpServletRequest request,ModelAndView mv) {
		try {
			String[] permitArr = request.getParameterValues("permit");  //승인할 유저아이디 배열
			man1Service.permitSeller(permitArr);
		}catch(Exception e) {
			System.out.println("선택값없음");
		}
		
		mv.setViewName("redirect:/adminUser.do");
		return mv;
	}
	
//03월09일	
//[6]마이페이지-판매자계정전환 신청 이동	
	@RequestMapping(value="/sellerApply.do", method=RequestMethod.GET)
	public ModelAndView sellerApply(ModelAndView mv, HttpServletRequest request) {
		String u_id = (String)request.getSession().getAttribute("u_id");
		String isWaiting = man1Service.checkWating(u_id);
		if(isWaiting.equals("y")) {
			mv.setViewName("elertWating");
		}else {
			mv.setViewName("sellerApply");
		}
		return mv;
	}
	
//[7]마이페이지-판매자계정전환 신청
	@RequestMapping(value="/sellerApply.do", method=RequestMethod.POST)
	public String sellerApplyPro(ModelAndView mv,WatingDTO dto) {
		man1Dao.insWating(dto);
		return "redirect:/sellerApply.do";
	}
	

//03월16일
//[8-1]마이페이지-판매자:내호스팅리스트
	@RequestMapping("/myHosting.do")
	public ModelAndView myHostingList(ModelAndView mv, HttpServletRequest request) {
		String u_id = (String)request.getSession().getAttribute("u_id");
		mv.addObject("hostingList",man1Service.myHostingList(u_id));
		mv.setViewName("myHosting");
		return mv;
	}

//[8-2]마이페이지-판매자:내호스팅 삭제
	@RequestMapping("delSellerHouse.do")
	public String delMyHosting(int h_num) {
		/* *******************************************************************
		 * 	db에서 집을 삭제하면 ondelete로 인해 연결된 집사진, 방, 방사진 자동으로 삭제됩니다...
		 * 	따라서 db에서 delete전에 실제 사진경로들을 찾아가 사진을 삭제하는 작업이 선행되어야 합니다..
		 * ********************************************************************/
		man1Service.delSellerHouse(h_num);
		return "redirect:/myHosting.do";
	}
	
//[8-3]마이페이지-판매자:내호스팅 수정페이지 이동
	@RequestMapping(value="upSellerHouse.do", method=RequestMethod.GET)
	public ModelAndView upMyHosting(ModelAndView mv, int h_num) {
		mv.addObject("houseDTO",man1Service.upMyHouse(h_num));
		mv.addObject("housePics",man1Service.upMyHousePics(h_num));
		mv.addObject("RoomList",man1Service.upMyRooms(h_num));
		mv.addObject("roomPics",man1Service.upMyRoomPics(h_num));
		
		mv.setViewName("upMyHosting");
		return mv;
	}
	
//[8-4]마이페이지-판매자:내호스팅 수정(집사진옵션 : 변경없음, 변경, 삭제)
	@RequestMapping(value="upSellerHouse.do", method=RequestMethod.POST)
	public ModelAndView upMyHouse(ModelAndView mv,HouseDTO dto,HousePicsDTO pics) {
		
		List<HousePicsDTO> picsDtoList = pics.getHousePicsDtoList();
		for(int h=0;h<picsDtoList.size();h++) {
			HousePicsDTO pdto =picsDtoList.get(h);
			if(pdto.getHp_option().equals("change") && !(pdto.getHfile().isEmpty()) ) {
			//옵션1. 사진파일 변경
				//(1)원본삭제
				String path="C:\\mydevenv\\teamProject_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps";
				String dir=pdto.getHp_dir();
				String saveDirectory=path+dir.substring(0, dir.lastIndexOf("\\")+1);
				String fileName = dir.substring(dir.lastIndexOf("\\")+1);
				String random = fileName.substring(0,fileName.indexOf("_"));
				File fe = new File(saveDirectory,fileName);
				fe.delete();
				
				//(2)변경할 파일저장
				MultipartFile newFile = pdto.getHfile();
				fileName = newFile.getOriginalFilename();
				File ff = new File(saveDirectory,random+"_"+fileName);
				pdto.setHp_dir(File.separator+"housePictures"+File.separator+pdto.getHp_hnum()+File.separator+random+"_"+fileName);
				try {
					FileCopyUtils.copy(newFile.getInputStream(),new FileOutputStream(ff));
				}catch (IOException e) {
					System.out.println("파일업로드실패!");
					e.printStackTrace();
				}
			}else if(pdto.getHp_option().equals("delete")) {
			//옵션2. 사진파일 삭제
				//(1)원본삭제
				String path="C:\\mydevenv\\teamProject_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps";
				String dir=pdto.getHp_dir();
				String saveDirectory=path+dir.substring(0, dir.lastIndexOf("\\")+1);
				String fileName = dir.substring(dir.lastIndexOf("\\")+1);
				File fe = new File(saveDirectory,fileName);
				fe.delete();
				
				//(2)db삭제
				man1Service.delMyHousePic(pdto.getHp_num());
			}
		}
			
		//수정한 집정보들 업데이트
		man1Service.upMyHouseInfo(dto, pics);
		
		mv.addObject("h_num",dto.getH_num());
		mv.setViewName("redirect:/upSellerHouse.do");
		return mv;
	}
		
//[8-5]방수정작업 : 
	@RequestMapping(value="upSellerRoom.do", method=RequestMethod.POST)
	public ModelAndView upMyRoom(ModelAndView mv,RoomDTO dto,RoomPicsDTO pics) {

		List<RoomPicsDTO> picsDtoList = pics.getRoomPicsDtoList();
		for(int r=0;r<picsDtoList.size();r++) {
			RoomPicsDTO pdto =picsDtoList.get(r);
			if(pdto.getRp_option().equals("change") && !(pdto.getRfile().isEmpty()) ) {
			//옵션1. 사진파일 변경
				//(1)원본삭제
				String path="C:\\mydevenv\\teamProject_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps";
				String dir=pdto.getRp_dir();
				String saveDirectory=path+dir.substring(0, dir.lastIndexOf("\\")+1);
				String fileName = dir.substring(dir.lastIndexOf("\\")+1);
				String random = fileName.substring(0,fileName.indexOf("_"));
				File fe = new File(saveDirectory,fileName);
				fe.delete();
				
				//(2)변경할 파일저장
				MultipartFile newFile = pdto.getRfile();
				fileName = newFile.getOriginalFilename();
				File ff = new File(saveDirectory,random+"_"+fileName);
				pdto.setRp_dir(File.separator+"housePictures"+File.separator+pdto.getRp_hnum()+File.separator+pdto.getRp_rnum()+File.separator+random+"_"+fileName);
				try {
					FileCopyUtils.copy(newFile.getInputStream(),new FileOutputStream(ff));
				}catch (IOException e) {
					System.out.println("파일업로드실패!");
					e.printStackTrace();
				}
			}else if(pdto.getRp_option().equals("delete")) {
			//옵션2. 사진파일 삭제
				//(1)원본삭제
				String path="C:\\mydevenv\\teamProject_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps";
				String dir=pdto.getRp_dir();
				String saveDirectory=path+dir.substring(0, dir.lastIndexOf("\\")+1);
				String fileName = dir.substring(dir.lastIndexOf("\\")+1);
				File fe = new File(saveDirectory,fileName);
				fe.delete();
				
				//(2)db삭제
				man1Service.delMyRoomPic(pdto.getRp_num());
			}
		}
		
		//수정한 집정보들 업데이트
		man1Service.upMyRoomInfo(dto, pics);
		
		mv.addObject("h_num",dto.getR_hnum());
		mv.setViewName("redirect:/upSellerHouse.do");
		return mv;
	}	
	
	
//[9] 관리자 권한으로 호스팅 삭제함
	@RequestMapping(value = "/adminEnroll_delete.do", method = RequestMethod.GET)
	public String adminEnrollDelete(ModelAndView mav, int h_num) {
		man1Service.delSellerHouse(h_num);
		return "redirect:/adminPermitEnroll.do";
	}
	
	
//[*] 지도형식보기에서 페이지내 비동기(지역)select
	@RequestMapping(value="/callRegion.do", method=RequestMethod.GET)
	public @ResponseBody List<HouseDTO> regionList(String data){
		return man1Dao.regionList(data);
	}
	
}
