package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.AdminRefundPageDTO;
import dto.HouseDTO;
import dto.RefundDTO;
import dto.RoomDTO;
import dto.UsersDTO;
import dto.UsersListPageDTO;
import dto.VisitDTO;

public class manager6DaoImp implements manager6DAO{
	private SqlSession sqlSession;
	
	public manager6DaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<UsersDTO> usersList(UsersListPageDTO pv) {
		return sqlSession.selectList("m6.selectUsers",pv);
	}

	@Override
	public int count(UsersListPageDTO pv) {
		return sqlSession.selectOne("m6.count", pv);
	}

	@Override
	public void adminUserUpdate(UsersDTO dto) {
		sqlSession.update("m6.updateUser", dto);
	}

	@Override
	public void adminUserDelete(String u_id) {
		sqlSession.delete("m6.deleteUser", u_id);
	}

	@Override
	public UsersDTO userInfo(String u_id) {
		return sqlSession.selectOne("m6.selectUser", u_id);
	}

	@Override
	public void visitReservation(VisitDTO vDto) {
		sqlSession.insert("m6.insertVisit", vDto);
	}

	@Override
	public RoomDTO selectRoom(RoomDTO rDto) {
		return sqlSession.selectOne("m6.selectRoom", rDto);
	}

	@Override
	public List<VisitDTO> visitList(String u_id) {
		return sqlSession.selectList("m6.selectVisit", u_id);
	}

	@Override
	public HouseDTO selectHouse(int r_hnum) {
		return sqlSession.selectOne("m6.selectHouse", r_hnum);
	}

	@Override
	public UsersDTO pUserInfo(String r_pid) {
		return sqlSession.selectOne("m6.selectPUser", r_pid);
	}

	@Override
	public List<VisitDTO> requestVisitList(String u_id) {
		return sqlSession.selectList("m6.requestVisit", u_id);
	}

	@Override
	public List<RefundDTO> adminRefundList(AdminRefundPageDTO udto) {
		return sqlSession.selectList("m6.adminRefundList", udto);
	}

	@Override
	public int refundCount(AdminRefundPageDTO udto) {
		return sqlSession.selectOne("m6.refundCount", udto);
	}

}
