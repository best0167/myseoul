package dao;

import dto.UsersDTO;

public interface SeoulDAO {
	public int loginCheck(UsersDTO dto);
	public int userGnum(String u_id);
	public String userGname(int g_num);
	public int myPoint(String session_id);
	
	public int idChk(String u_id) throws Exception;
	public void register(UsersDTO dto) throws Exception;
	
	//로그인 시 방문자기록에 유저아이디등록
	public void updateVisitor(String acc_session,String acc_uid);
}
