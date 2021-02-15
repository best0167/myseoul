package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.BuyListDTO;
import dto.HouseDTO;
import dto.SellListPageDTO;
import dto.UsersDTO;
import dto.permitHousePageDTO;

public class manager3DaoImp implements manager3DAO{
	private SqlSession sqlSession;
	
	public manager3DaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public String findId(String u_email) throws Exception {
		return sqlSession.selectOne("m3.find_id", u_email);
	}
	
	@Override
	public String findPw(UsersDTO dto) throws Exception {
		return sqlSession.selectOne("m3.find_pw", dto);
	}

	@Override
	public UsersDTO viewUser(String u_id) {
		return sqlSession.selectOne("m3.view_user", u_id);
	}

	@Override
	public void updateUser(UsersDTO dto) {
		sqlSession.update("m3.update_user", dto);
	}

	@Override
	public void deleteUser(String u_id) {
		sqlSession.delete("m3.delete_user", u_id);
		
	}

	@Override
	public int checkPw(UsersDTO dto) throws Exception {
		return sqlSession.selectOne("m3.checkPW", dto);
	
	}

	@Override
	public String findPw_id(String u_id) throws Exception {
		return sqlSession.selectOne("m3.find_pw_id", u_id);
	}

	@Override
	public String findPw_email(String u_email) throws Exception {
		return sqlSession.selectOne("m3.find_pw_email", u_email);
	}

	@Override
	public String findPw_phone(String u_phone) throws Exception {
		return sqlSession.selectOne("m3.find_pw_phone", u_phone);
	}

	@Override
	public int permitcount(permitHousePageDTO pv) {
		return sqlSession.selectOne("m3.permit_count", pv);
	}

	@Override
	public List<HouseDTO> permitlist(permitHousePageDTO pv) {
		return sqlSession.selectList("m3.permit_list", pv);
	}

	@Override
	public void cancelPermitEnroll(int h_num) {
		sqlSession.update("m3.cancelpermitEnroll", h_num);
	}
	
	@Override
	public int emailChk(String u_email) throws Exception {
		return sqlSession.selectOne("m3.emailChk", u_email);
	}
	
	@Override
	public List<BuyListDTO> viewSellList(SellListPageDTO pv) {
		return sqlSession.selectList("m3.select_adminSaleList", pv);
	}

	@Override
	public int sellListCount(SellListPageDTO pv) {
	   return sqlSession.selectOne("m3.select_adminSale_count", pv);
	}
}
