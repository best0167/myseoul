package dao;

import java.util.List;

import dto.AdminRefundPageDTO;
import dto.HouseDTO;
import dto.RefundDTO;
import dto.RoomDTO;
import dto.UsersDTO;
import dto.UsersListPageDTO;
import dto.VisitDTO;

public interface manager6DAO {
	public List<UsersDTO> usersList(UsersListPageDTO pv);
	
	public int count(UsersListPageDTO pv);
	
	public void adminUserUpdate(UsersDTO dto);
	
	public void adminUserDelete(String u_id);
	
	public UsersDTO userInfo(String u_id);
	
	public void visitReservation(VisitDTO vDto);
	
	public RoomDTO selectRoom(RoomDTO rDto);
	
	public HouseDTO selectHouse(int r_hnum);
	
	public List<VisitDTO> visitList(String u_id);
	
	public UsersDTO pUserInfo(String r_pid);
	
	public List<VisitDTO> requestVisitList(String u_id);
	
	public List<RefundDTO> adminRefundList(AdminRefundPageDTO udto);
	
	public int refundCount(AdminRefundPageDTO udto);

}
