package service;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import dto.BuyListDTO;
import dto.HouseDTO;
import dto.SellListPageDTO;
import dto.UsersDTO;
import dto.permitHousePageDTO;

public interface UsersService {
	
	public int loginCheck(UsersDTO dto);
	
	public int myPoint(String session_id);
	
	// 회원 가입 아이디 중복 체크
	public int idChk(String u_id) throws Exception;
	
	// 회원 가입
	public void register(UsersDTO dto) throws Exception;
	
	// 아이디 찾기
	public String findId(String u_email) throws Exception;
	
	// 비밀번호 찾기
	public String findPw(UsersDTO dto) throws Exception;
	
//03월06일	
	// 회원 정보 상세 조회
	public UsersDTO viewUser(String u_id);
		
	// 회원 정보 수정 처리
	public void updateUser(UsersDTO dto) throws Exception;
		
	// 회원 정보 삭제 처리
	public void deleteUser(String u_id) throws Exception;
		
	// 회원 정보 수정 및 삭제를 위한 비밀번호 체크
	public int checkPw(UsersDTO dto) throws Exception;

//03월11일
	// 비밀번호 찾기
	public String findPw(HttpServletResponse res, String u_id, String u_email, String u_phone) throws Exception;
//03월13일
	public int PermitCount(permitHousePageDTO pv);

	public List<HouseDTO> PermitList(permitHousePageDTO pv);
	
	public void cancelPermitEnroll(int h_num);
	
	public int emailChk(String u_email) throws Exception;
	
	public List<BuyListDTO> viewSellList(SellListPageDTO pv);
	
	public int sellListCount(SellListPageDTO pv);
}
