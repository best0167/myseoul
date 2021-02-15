package service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import dao.manager1DAO;
import dto.AdminIndexDTO;
import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.HouseTypeDTO;
import dto.RoomDTO;
import dto.RoomPicsDTO;
import dto.WatingDTO;
import dto.WatingUserDTO;

public class manager1ServiceImp implements manager1Service{
	private manager1DAO man1Dao;
	
	public manager1ServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setMan1Dao(manager1DAO man1Dao) {
		this.man1Dao = man1Dao;
	}

//[*]메인페이지에 뿌려줄 것들(별점순,조회순,최신순 4개씩)
// 나중에 할 예정임
//////end
	

// 02월 19일 수정
//[1]집유형리스트 리턴
	@Override
	public List<HouseTypeDTO> houseType() {
		return man1Dao.houseType();
	}

//[2]유저아이디의 등급명 리턴
	@Override
	public String userGname(String u_id) {
		int u_gnum = man1Dao.userGnum(u_id);
		return man1Dao.userGname(u_gnum);
	}

//[3-1]집등록
	@Override
	public void enrollHouse(HouseDTO dto) {
		int h_num = man1Dao.seqHouse(); //집의 시퀀스 번호가져옴
		dto.setH_num(h_num);  //시퀀스값 dto에 셋팅
		man1Dao.enrollHouse(dto);  //집등록
	}

//[3-2]집의 사진 등록
	@Override
	public void enrollHousePics(HousePicsDTO dto) {
		man1Dao.enrollHousePics(dto);		
	}

//[4-1]방등록
	@Override
	public void enrollRoom(RoomDTO dto) {
		int r_num = man1Dao.seqRoom(); //방의 시퀀스번호
		dto.setR_num(r_num);  //시퀀스값 dto에 셋팅
		man1Dao.enrollRoom(dto);  //방등록		
	}

//[4-2]방의 사진 등록
	@Override
	public void enrollRoomPics(RoomPicsDTO dto) {
		man1Dao.enrollRoomPics(dto);
		
	}
	
//[5]관리자페이지 index 정보셋팅
	@Override
	public AdminIndexDTO adminSetData(String u_id) {
		AdminIndexDTO dto = new AdminIndexDTO();
		dto.setAdmin_name(man1Dao.adminName(u_id));
		dto.setQna_noAns(man1Dao.newQuestion());
		dto.setHouse_cnt(man1Dao.totalHouse());
		dto.setSeller_cnt(man1Dao.totalSeller());
		dto.setBuyer_cnt(man1Dao.totalBuyer());
		dto.setWait_seller(man1Dao.waitSeller());
		dto.setWait_enroll(man1Dao.waitEnroll());
		dto.setWait_refund(man1Dao.waitRefund());
		
		int user_yesterday = man1Dao.userCntAll();
		int user_today = man1Dao.userCnt();
		int visitor_total = man1Dao.visitorCntAll();
		int visitor_new = man1Dao.visitorCnt();
		double user_rate = (double)user_today/user_yesterday*100.0;
		double visitor_rate = (double)visitor_new/visitor_total*100.0;
		int visitor_acc = visitor_total+visitor_new;
		dto.setUser_rate((int)user_rate);
		dto.setVisitor_rate((int)visitor_rate);
		dto.setVisitor_acc(visitor_acc);
		
		
		int country_total = man1Dao.countryCntAll();
		int kr = man1Dao.countryCnt("Korea");
		int na = man1Dao.countryCnt("North of America");
		int cn = man1Dao.countryCnt("China");
		int jp = man1Dao.countryCnt("Japan");
		int fr = man1Dao.countryCnt("France");
		int can = man1Dao.countryCnt("Canada");
		dto.setNation_total(country_total);
		dto.setKr((double)kr/country_total*100.0);
		dto.setNa((double)na/country_total*100.0);
		dto.setCn((double)cn/country_total*100.0);
		dto.setJp((double)jp/country_total*100.0);
		dto.setFr((double)fr/country_total*100.0);
		dto.setCan((double)can/country_total*100.0);
		
		return dto;
	}
	
//[6]관리자페이지 집등록대기 리스트
	@Override
	public List<HouseDTO> managementEnroll() {
		return man1Dao.waitEnrollList();
	}
	
//[7]관리자:집등록허가
	@Override
	public void permitEnroll(String[] permitArr) {
		for(int i=0; i<permitArr.length; i++) {
			int h_num = Integer.parseInt(permitArr[i]);
			man1Dao.permitEnroll(h_num);
		}
	}
//[8]관리자페이지 판매회원신청리스트
	@Override
	public List<WatingUserDTO> managementUser() {
		return man1Dao.waitUserList();
	}

//[9]관리자:판매자등급전환,wating테이블 업데이트
	@Override
	public void permitSeller(String[] permitArr) {
		for(int i=0; i<permitArr.length; i++) {
			String u_id = permitArr[i];
			man1Dao.permitSeller(u_id);
			man1Dao.permitSeller2(u_id);
		}
	}

//[10]마이페이지:판매자신청여부조회	
	@Override
	public String checkWating(String u_id) {
		String isWating = "";
		if(man1Dao.checkWating(u_id)==0) {
			isWating = "n";
		}else {
			isWating = "y";
		}
		return isWating;
	}
	
//[11]마이페이지:판매자전환 신청
	@Override
	public void insWating(WatingDTO dto) {
		man1Dao.insWating(dto);		
	}

//[12]메인페이지:별점랭킹4위까지
	@Override
	public List<HouseDTO> starLank() {
		List<HouseDTO> dtoList = man1Dao.starLank();
		String mainPic = "";
		
		for(int i=0; i<dtoList.size() ; i++) {
			HouseDTO dto = dtoList.get(i);
			mainPic = man1Dao.callMainPic(dto.getH_num());
			dto.setH_mainPic(mainPic);
		}
		
		return dtoList;
	}

//[13]메인페이지:조회랭킹4위까지
	@Override
	public List<HouseDTO> readLank() {
		List<HouseDTO> dtoList = man1Dao.readLank();
		String mainPic = "";
		
		for(int i=0; i<dtoList.size() ; i++) {
			HouseDTO dto = dtoList.get(i);
			mainPic = man1Dao.callMainPic(dto.getH_num());
			dto.setH_mainPic(mainPic);
		}
		
		return dtoList;
	}

//[14]메인페이지:최신순 4위까지	
	@Override
	public List<HouseDTO> regLank() {
		List<HouseDTO> dtoList = man1Dao.regLank();
		String mainPic = "";
		
		for(int i=0; i<dtoList.size() ; i++) {
			HouseDTO dto = dtoList.get(i);
			mainPic = man1Dao.callMainPic(dto.getH_num());
			dto.setH_mainPic(mainPic);
		}
		
		return dtoList;
	}
	
// [15]마이페이지 : (판매자)등록한 집 리스트
	@Override
	public List<HouseDTO> myHostingList(String uid) {
		return man1Dao.myHostingList(uid);
	}

// [16]마이페이지 : (판매자)본인의 집 삭제
	@Override
	public void delSellerHouse(int h_num) {
		// 1)집 사진경로 탐색
		// 2)집 실제 사진 삭제
		// 3)방 사진경로 탐색
		// 4)방 실제 사진 삭제
		// 5)집테이블에서 해당레코드 삭제
		List<String> housePics = man1Dao.SearchHousePics(h_num);
		String path = "C:\\mydevenv\\teamProject_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps";
		String dir = "";
		String saveDirectory = "";
		String fileName = "";

		for (int h = 0; h < housePics.size(); h++) {
			dir = housePics.get(h);
			saveDirectory = path + dir.substring(0, dir.lastIndexOf("\\") + 1);
			fileName = dir.substring(dir.lastIndexOf("\\") + 1);
			//System.out.println(saveDirectory);
			//System.out.println(fileName);

			File fe = new File(saveDirectory,fileName);
			fe.delete();
		}

		List<String> roomPics = man1Dao.SearchRoomPics(h_num);
		for (int r = 0; r < roomPics.size(); r++) {
			dir = roomPics.get(r);
			saveDirectory = path + dir.substring(0, dir.lastIndexOf("\\") + 1);
			fileName = dir.substring(dir.lastIndexOf("\\") + 1);
			//System.out.println(saveDirectory);
			//System.out.println(fileName);

			File fe = new File(saveDirectory,fileName);
			fe.delete();
		}

		man1Dao.delMyHouse(h_num);
	}
	
	
// [17]마이페이지 : (판매자)본인의 집 수정전 정보가져옴
	@Override
	public HouseDTO upMyHouse(int h_num) {
		return man1Dao.upMyHosting(h_num);
	}

// [18]마이페이지 : (판매자)본인의 집 수정전 사진들
	@Override
	public List<HousePicsDTO> upMyHousePics(int h_num) {
		return man1Dao.upMyHousePics(h_num);
	}

// [19]마이페이지 : (판매자)본인의 집정보, 집사진 db 업데이트
	@Override
	public void upMyHouseInfo(HouseDTO dto, HousePicsDTO pics) {
		man1Dao.upMyHouseInfo(dto);
		List<HousePicsDTO> picsDtoList = pics.getHousePicsDtoList();
		for (int h = 0; h < picsDtoList.size(); h++) {
			HousePicsDTO pdto = picsDtoList.get(h);

			if ((Boolean) pdto.getHfile().isEmpty()) {
				// System.out.println("파일비어있음");
			} else {
				// System.out.println("파일있음");
				man1Dao.upMyHousePicInfo(pdto);
			}
		}
	}

	@Override
	public void upMyRoomInfo(RoomDTO dto,RoomPicsDTO pics) {
		man1Dao.upMyRoomInfo(dto);
		List<RoomPicsDTO> picsDtoList = pics.getRoomPicsDtoList();
		for (int h = 0; h < picsDtoList.size(); h++) {
			RoomPicsDTO pdto = picsDtoList.get(h);

			if ((Boolean) pdto.getRfile().isEmpty()) {
				// System.out.println("파일비어있음");
			} else {
				// System.out.println("파일있음");
				man1Dao.upMyRoomPicInfo(pdto);
			}
		}
	}
	
	
// [20]마이페이지 : (판매자)본인의 집사진 삭제요청시 db삭제
	@Override
	public void delMyHousePic(int hp_num) {
		man1Dao.delMyHousePic(hp_num);
	}
	
// [21]마이페이지 : (판매자)본인의 집 안 방 수정전 정보가져옴
	@Override
	public List<RoomDTO> upMyRooms(int h_num) {
		return man1Dao.upMyRooms(h_num);
	}

// [22]마이페이지 : (판매자)본인의 집 안 방 수정전 사진들
	@Override
	public List<List<RoomPicsDTO>> upMyRoomPics(int h_num) {
		List< List<RoomPicsDTO> > RoomPicsList = new ArrayList<List<RoomPicsDTO> >();
		
		List<Integer> roomGroup = man1Dao.roomPicGroup(h_num);
		for(int i=0;i<roomGroup.size();i++) {
			int r_num = roomGroup.get(i);
			List<RoomPicsDTO> pics = man1Dao.upMyRoomPics(h_num, r_num);
			RoomPicsList.add(pics);
		}
		
		return RoomPicsList;
	}

	//test 방테이블 레코드 삭제함
	@Override
	public void delMyRoomPic(int rp_num) {
		man1Dao.delMyRoomPic(rp_num);
	}
}
