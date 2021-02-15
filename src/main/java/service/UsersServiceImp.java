package service;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import dao.SeoulDAO;
import dao.manager3DAO;
import dto.BuyListDTO;
import dto.HouseDTO;
import dto.SellListPageDTO;
import dto.UsersDTO;
import dto.permitHousePageDTO;

public class UsersServiceImp implements UsersService{
	
	private SeoulDAO dao;
	private manager3DAO dao3;
	
	public void setDao(SeoulDAO dao) {
		this.dao = dao;
	}
	
	public void setDao3(manager3DAO dao3) {
		this.dao3 = dao3;
	}
	
	public UsersServiceImp() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int idChk(String u_id) throws Exception { 
		return dao.idChk(u_id);
	}

	@Override
	public void register(UsersDTO dto) throws Exception {
		dao.register(dto);
	}

	@Override
	public int loginCheck(UsersDTO dto) {
		return dao.loginCheck(dto);
	}

	@Override
	public int myPoint(String session_id) {
		// TODO Auto-generated method stub
		return dao.myPoint(session_id);
	}
	
//03월06일
	@Override
	public String findId(String u_email) throws Exception {
		return dao3.findId(u_email);
	}
	
	@Override
	public String findPw(UsersDTO dto) throws Exception {
		return dao3.findPw(dto);
	}

	// 회원 정보 상세 조회
	@Override
	public UsersDTO viewUser(String u_id) {
		return dao3.viewUser(u_id);
	}

	// 회원 정보 수정 처리
	@Override
	public void updateUser(UsersDTO dto) throws Exception {
		dao3.updateUser(dto);
	}

	// 회원 정보 삭제 처리
	@Override
	public void deleteUser(String u_id) throws Exception {
		dao3.deleteUser(u_id);
	}

	@Override
	public int checkPw(UsersDTO dto) throws Exception {
		return dao3.checkPw(dto);
	}
		
//03월11일
	@Override
	public String findPw(HttpServletResponse res, String u_id, String u_email, String u_phone) throws Exception {
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		String u_pw = dao3.findPw_id(u_id);
		String u_pw1 = dao3.findPw_email(u_email);
		String u_pw2 = dao3.findPw_phone(u_phone);

		if (u_pw == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();

			return null;
		} else if (u_pw1 == null) {
			out.println("<script>");
			out.println("alert('이메일이 틀렸습니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();

			return null;
		} else if (u_pw2 == null) {
			out.println("<script>");
			out.println("alert('전화번호가 틀렸습니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();

			return null;
		} else {
			return u_pw;
		}
	}

// 3월13일
	@Override
	public int PermitCount(permitHousePageDTO pv) {
		return dao3.permitcount(pv);
	}

	@Override
	public List<HouseDTO> PermitList(permitHousePageDTO pv) {
		return dao3.permitlist(pv);
	}

	@Override
	public void cancelPermitEnroll(int h_num) {
		dao3.cancelPermitEnroll(h_num);
	}
	
	@Override
	public int emailChk(String u_email) throws Exception { 
		return dao3.emailChk(u_email);
	}	
	
    @Override
    public List<BuyListDTO> viewSellList(SellListPageDTO pv) {
       return dao3.viewSellList(pv);
    }

    @Override
    public int sellListCount(SellListPageDTO pv) {
       return dao3.sellListCount(pv);
    }

}
