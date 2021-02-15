package dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.UsersDTO;

public class SeoulDaoImp implements SeoulDAO{
	private SqlSession sqlSession;
	
	public SeoulDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int loginCheck(UsersDTO dto) {
		return sqlSession.selectOne("sm.loginCheck",dto);
	}

	@Override
	public int myPoint(String session_id) {
		return sqlSession.selectOne("sm.myPoint",session_id);
	}

	@Override
	public int userGnum(String u_id) {
		return sqlSession.selectOne("sm.userGnum",u_id);
	}

	@Override
	public String userGname(int g_num) {
		return sqlSession.selectOne("sm.gradeName",g_num);
	}

	@Override
	public int idChk(String u_id) throws Exception {
		return sqlSession.selectOne("sm.idChk", u_id);
	}

	@Override
	public void register(UsersDTO dto) throws Exception {
		sqlSession.insert("sm.register", dto);
	}

	@Override
	public void updateVisitor(String acc_session, String acc_uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("acc_session", acc_session);
		map.put("acc_uid", acc_uid);
		sqlSession.update("m1.upVisitor",map);
	}
	
	

}
