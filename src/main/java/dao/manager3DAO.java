package dao;

import java.util.List;

import dto.BuyListDTO;
import dto.HouseDTO;
import dto.SellListPageDTO;
import dto.UsersDTO;
import dto.permitHousePageDTO;

public interface manager3DAO {
	// 아이디 찾기
	public String findId(String u_email) throws Exception;
	
	// 비밀번호 찾기
	public String findPw(UsersDTO dto) throws Exception;
	
	// 회원 정보 상세 조회
	public UsersDTO viewUser(String u_id);
	
	// 회원 정보 수정 처리
	public void updateUser(UsersDTO dto) throws Exception;
	
	// 회원 정보 삭제 처리
	public void deleteUser(String u_id) throws Exception;
		
	// 비밀번호 체크
	public int checkPw(UsersDTO dto) throws Exception;
	
	// 비밀번호 확인
	public String findPw_id(String u_id) throws Exception;
	public String findPw_email(String u_email) throws Exception;
	public String findPw_phone(String u_phone) throws Exception;
	
	public int permitcount(permitHousePageDTO pv);
	public List<HouseDTO> permitlist(permitHousePageDTO pv);
	public void cancelPermitEnroll(int h_num);
	
	public int emailChk(String u_email) throws Exception;
	
	// 매출현황 리스트
	public List<BuyListDTO> viewSellList(SellListPageDTO pv);
	
	public int sellListCount(SellListPageDTO pv);
}
