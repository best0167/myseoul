package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.HouseTypeDTO;
import dto.RoomDTO;
import dto.RoomPicsDTO;
import dto.WatingDTO;
import dto.WatingUserDTO;

public class manager1DaoImp implements manager1DAO{
	private SqlSession sqlSession;
	
	public manager1DaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
// 02월 19일 수정
// [1] 집등록페이지의 집유형리스트 리턴
	@Override
	public List<HouseTypeDTO> houseType() {
		return sqlSession.selectList("m1.hType");
	}

// [2] 유저의 등급번호 리턴
	@Override
	public int userGnum(String u_id) {
		return sqlSession.selectOne("m1.userGnum",u_id);
	}

// [3] 등급번호의 등급이름 리턴
	@Override
	public String userGname(int g_num) {
		return sqlSession.selectOne("m1.gradeName",g_num);
	}
	
// [4] 집등록 
	@Override
	public void enrollHouse(HouseDTO dto) {
		sqlSession.insert("m1.insHouse",dto);
	}

// [5] 집 시퀀스값
	@Override
	public int seqHouse() {
		return sqlSession.selectOne("m1.seqHouse");
	}

// [6] 집사진 등록
	@Override
	public void enrollHousePics(HousePicsDTO dto) {
		sqlSession.insert("m1.insHousePics",dto);
	}
	
	
// [7] 방 시퀀스값
	@Override
	public int seqRoom() {
		return sqlSession.selectOne("m1.seqRoom");
	}
	
// [8] 방 등록
	@Override
	public void enrollRoom(RoomDTO dto) {
		sqlSession.insert("m1.insRoom", dto);
	}	
	
// [9] 방 사진 등록
	@Override
	public void enrollRoomPics(RoomPicsDTO dto) {
		sqlSession.insert("m1.insRoomPics", dto);
	}

// [10] 관리자index페이지 호출 데이터
	//접속한 관리자이름 
	@Override
	public String adminName(String u_id) {
		return sqlSession.selectOne("m1.adminName",u_id);
	}
	
	//새 질의가 몇개?
	@Override
	public int newQuestion() {
		return sqlSession.selectOne("m1.newQuestion");
	}
	
	//허가된 집이 몇개?
	@Override
	public int totalHouse() {
		return sqlSession.selectOne("m1.totalHouse");
	}
	
	//일반유저계정 회원 수 
	@Override
	public int totalSeller() {
		return sqlSession.selectOne("m1.totalSeller");
	}

	//판매자계정 회원수
	@Override
	public int totalBuyer() {
		return sqlSession.selectOne("m1.totalBuyer");
	}

	//판매자계정 전환신청온 회원수
	@Override
	public int waitSeller() {
		return sqlSession.selectOne("m1.waitSeller");
	}

	//허가신청온 집 수
	@Override
	public int waitEnroll() {
		return sqlSession.selectOne("m1.waitEnroll");
	}

	//환불신청온 수
	@Override
	public int waitRefund() {
		return sqlSession.selectOne("m1.waitRefund");
	}
	
	//현재시간 기준 오늘의 신규 회원 수
	@Override
	public int userCnt() {
		return sqlSession.selectOne("m1.userCnt");
	}

	//현재시간 기준 어제까지 전체 회원수
	@Override
	public int userCntAll() {
		return sqlSession.selectOne("m1.userCntAll");
	}
	
	//현재시간 기준 오늘의 방문자수
	@Override
	public int visitorCnt() {
		return sqlSession.selectOne("m1.visitorCnt");
	}

	//현재시간 기준 어제까지의 방문자 수
	@Override
	public int visitorCntAll() {
		return sqlSession.selectOne("m1.visitorCntAll");
	}
	
	
	//해당국가의 회원 수
	@Override
	public int countryCnt(String u_nation) {
		return sqlSession.selectOne("m1.countryCnt",u_nation);
	}

	//전체국가에 대한 회원 수
	@Override
	public int countryCntAll() {
		return sqlSession.selectOne("m1.countryCntAll");
	}
// 관리자index페이지 호출 데이터////////

//[11-1]허가못받은 집 리스트	
	@Override
	public List<HouseDTO> waitEnrollList() {
		return sqlSession.selectList("m1.waitEnrollList");
	}
	
//[11-2]관리자:집 등록허가
	@Override
	public void permitEnroll(int h_num) {
		sqlSession.update("m1.permitEnroll",h_num);
	}
	
//[12-1]판매자등록신청한 유저리스트
	@Override
	public List<WatingUserDTO> waitUserList() {
		return sqlSession.selectList("m1.waitSellerList");
	}

//[12-2]관리자:판매자 등급 변경허가
	@Override
	public void permitSeller(String u_id) {
		sqlSession.update("m1.permitSeller", u_id);
	}
	
//[12-3]관리자:wating테이블 업데이트
	@Override
	public void permitSeller2(String u_id) {
		sqlSession.update("m1.permitSeller2",u_id);
	}
	
//[13-1]마이페이지:판매자계정신청여부체크	
	@Override
	public int checkWating(String u_id) {
		return sqlSession.selectOne("m1.checkWating",u_id);
	}

//[13-2]마이페이지:판매자전환신청
	@Override
	public void insWating(WatingDTO dto) {
		sqlSession.insert("m1.insWating",dto);
	}

//[14]집의 메인사진  호출
	@Override
	public String callMainPic(int hnum) {
		return sqlSession.selectOne("m1.callMainPic",hnum);
	}
	
//[15-1]메인페이지:별점랭킹	
	@Override
	public List<HouseDTO> starLank() {
		return sqlSession.selectList("m1.starLank");
	}

//[15-2]메인페이지:조회랭킹	
	@Override
	public List<HouseDTO> readLank() {
		return sqlSession.selectList("m1.readLank");
	}

//[15-3]메인페이지:최신랭킹	
	@Override
	public List<HouseDTO> regLank() {
		return sqlSession.selectList("m1.regLank");
	}

// [16-1]마이페이지:내호스팅리스트(판매자)
	@Override
	public List<HouseDTO> myHostingList(String uid) {
		return sqlSession.selectList("m1.myHostingList", uid);
	}

// [16-2]해당집의 사진경로들
	@Override
	public List<String> SearchHousePics(int hnum) {
		return sqlSession.selectList("m1.searchHousepics", hnum);
	}

// [16-3]해당집의 방사진경로들
	@Override
	public List<String> SearchRoomPics(int hnum) {
		return sqlSession.selectList("m1.searchRoompics", hnum);
	}
	
// [16-4]해당집 레코드 삭제
	@Override
	public void delMyHouse(int hnum) {
		sqlSession.delete("m1.delMyHouse", hnum);
	}
	
// [17-1]판매자의 등록한 집 관리 : 집 정보
	@Override
	public HouseDTO upMyHosting(int hnum) {
		return sqlSession.selectOne("m1.myHouseInfo", hnum);
	}

// [17-2]판매자의 등록한 집 관리 : 집 사진들
	@Override
	public List<HousePicsDTO> upMyHousePics(int hnum) {
		return sqlSession.selectList("m1.myHousepics", hnum);
	}
	
// [17-3]판매자의 등록한 집 관리 : 방 정보
	@Override
	public List<RoomDTO> upMyRooms(int hnum) {
		return sqlSession.selectList("m1.myRoominfo", hnum);
	}

// [17-4]판매자의 등록한 집 관리 : 방 사진들
	@Override
	public List<RoomPicsDTO> upMyRoomPics(int hnum,int rnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hnum", hnum);
		map.put("rnum", rnum);
		return sqlSession.selectList("m1.myRoompics", map);
	}

// [18-1]판매자의 등록한 집 수정 : 집 데이터
	@Override
	public void upMyHouseInfo(HouseDTO dto) {
		sqlSession.update("m1.upMyHouseInfo", dto);
	}

// [18-2]판매자의 등록한 집 수정 : 집 사진
	@Override
	public void upMyHousePicInfo(HousePicsDTO dto) {
		sqlSession.update("m1.upMyHousePic", dto);
	}

// [18-3]판매자의 등록한 집 수정 : 집 사진 삭제
	@Override
	public void delMyHousePic(int hpnum) {
		sqlSession.delete("m1.delMyHousePic", hpnum);
	}
	
// [18-4]판매자의 등록한 집 수정 : 방 데이터
	@Override
	public void upMyRoomInfo(RoomDTO dto) {
		sqlSession.update("m1.upMyRoomInfo", dto);
	}
	
// [*] 지도로보기 : 지역구 클릭시 해당지역 리스트리턴	
	@Override
	public List<HouseDTO> regionList(String region) {
		List<HouseDTO> dtoList =  sqlSession.selectList("m1.regionList", region);
		String mainPic = "";
		for(int i=0; i<dtoList.size(); i++) {
			HouseDTO dto = dtoList.get(i);
			mainPic = sqlSession.selectOne("m1.callMainPic",dto.getH_num());
			dto.setH_mainPic(mainPic);
		}
		
		return dtoList;
	}

//[test]집의 방그룹 내 rnum리스트
	@Override
	public List<Integer> roomPicGroup(int hnum){
		return sqlSession.selectList("m1.roomPicGroup",hnum);
	}
	
//[test]집의 방 사진테이블 삭제함
	@Override
	public void delMyRoomPic(int rpnum) {
		sqlSession.delete("m1.delMyRoomPic",rpnum);
	}
	
//[test]집의 방 사진 테이블 수정함
	@Override
	public void upMyRoomPicInfo(RoomPicsDTO pdto) {
		sqlSession.update("m1.upMyRoomPic", pdto);
	}
}
