package dao;

import java.util.List;

import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.HouseTypeDTO;
import dto.RoomDTO;
import dto.RoomPicsDTO;
import dto.WatingDTO;
import dto.WatingUserDTO;

public interface manager1DAO {
	
	//유저정보조회
	public List<HouseTypeDTO> houseType();
	public int userGnum(String u_id);
	public String userGname(int g_num);
	
	//집등록
	public int seqHouse();
	public void enrollHouse(HouseDTO dto);
	public void enrollHousePics(HousePicsDTO dto);
	
	//방등록
	public int seqRoom();
	public void enrollRoom(RoomDTO dto);
	public void enrollRoomPics(RoomPicsDTO dto);
	
	//해당지역구리스트
	public List<HouseDTO> regionList(String region);
	
	//관리자페이지 통계정보
	public String adminName(String u_id);
	public int newQuestion();
	public int totalHouse();
	public int totalSeller();
	public int totalBuyer();
	public int waitSeller();
	public int waitEnroll();
	public int waitRefund();
	public int countryCnt(String u_nation);
	public int countryCntAll();
	public int userCnt();
	public int userCntAll();
	public int visitorCnt();
	public int visitorCntAll();
	
	//관리자:회원관리
	public List<HouseDTO> waitEnrollList();
	public void permitEnroll(int h_num);
	public List<WatingUserDTO> waitUserList();
	public void permitSeller(String u_id);
	public void permitSeller2(String u_id);
	
	//마이페이지:판매자신청
	public int checkWating(String u_id);
	public void insWating(WatingDTO dto);
	
	//메인페이지정보
	public List<HouseDTO> starLank();
	public List<HouseDTO> readLank();
	public List<HouseDTO> regLank();
	public String callMainPic(int hnum);
	
	//마이페이지:나의 호스팅관리(판매자)
		//(1)목록
	public List<HouseDTO> myHostingList(String u_id);
	
		//(2)삭제
	public List<String> SearchHousePics(int hnum);
	public List<String> SearchRoomPics(int hnum);
	public void delMyHouse(int hnum);
	
		//(3)수정하기위한데이터
	public HouseDTO upMyHosting(int hnum);
	public List<HousePicsDTO> upMyHousePics(int hnum);
	public List<RoomDTO> upMyRooms(int hnum);
	public List<RoomPicsDTO> upMyRoomPics(int hnum, int rnum);
	public List<Integer> roomPicGroup(int hnum);
	
		//(4)수정
	public void upMyHouseInfo(HouseDTO dto);
	public void upMyHousePicInfo(HousePicsDTO dto);
	public void upMyRoomInfo(RoomDTO dto);
	public void upMyRoomPicInfo(RoomPicsDTO pdto);
	public void delMyHousePic(int hpnum);
	public void delMyRoomPic(int rpnum);
}
