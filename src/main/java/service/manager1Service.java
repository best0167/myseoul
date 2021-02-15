package service;

import java.util.List;

import dto.AdminIndexDTO;
import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.HouseTypeDTO;
import dto.RoomDTO;
import dto.RoomPicsDTO;
import dto.WatingDTO;
import dto.WatingUserDTO;

public interface manager1Service {
	//집등록페이지로 이동
	public List<HouseTypeDTO> houseType();
	public String userGname(String u_id);
	
	//집등록
	public void enrollHouse(HouseDTO dto);
	public void enrollHousePics(HousePicsDTO dto);
	
	//방등록
	public void enrollRoom(RoomDTO dto);
	public void enrollRoomPics(RoomPicsDTO dto);
	
	//관리자페이지(메인)의 통계자료들
	public AdminIndexDTO adminSetData(String u_id);
	
	//관리자 : 집등록허가관리
	public List<HouseDTO> managementEnroll();
	public void permitEnroll(String[] permitArr);
	
	//관리자 : 판매회원전환관리
	public List<WatingUserDTO> managementUser();
	public void permitSeller(String[] permitArr);
	
	//일반유저 : 판매자계정 전환신청
	public String checkWating(String u_id);
	public void insWating(WatingDTO dto);
	
	//메인페이지 : TOP4리스트(별점순,조회순,최신순)
	public List<HouseDTO> starLank();
	public List<HouseDTO> readLank();
	public List<HouseDTO> regLank();
	
	//판매자 : 내가 등록한 집 관리
	//	리스트
	public List<HouseDTO> myHostingList(String u_id);
	//	삭제
	public void delSellerHouse(int h_num);
	//	수정할수있는 데이터
	public HouseDTO upMyHouse(int h_num);
	public List<RoomDTO> upMyRooms(int h_num);
	public List<HousePicsDTO> upMyHousePics(int h_num);
	public List<List<RoomPicsDTO>> upMyRoomPics(int h_num);
	//	수정프로세스
	public void upMyHouseInfo(HouseDTO dto,HousePicsDTO pics);
	public void delMyHousePic(int hp_num);
	public void upMyRoomInfo(RoomDTO dto,RoomPicsDTO pics);
	public void delMyRoomPic(int rp_num);
	
	
}
