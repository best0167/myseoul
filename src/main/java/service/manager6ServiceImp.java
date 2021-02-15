package service;

import java.util.List;

import dao.manager6DAO;
import dto.AdminRefundPageDTO;
import dto.HouseDTO;
import dto.RefundDTO;
import dto.RoomDTO;
import dto.UsersDTO;
import dto.UsersListPageDTO;
import dto.VisitDTO;

public class manager6ServiceImp implements manager6Service{
	private manager6DAO man6Dao;
	
	public manager6ServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setMan6Dao(manager6DAO man6Dao) {
		this.man6Dao = man6Dao;
	}
	
	@Override
	public List<UsersDTO> usersList(UsersListPageDTO pv) {
		return man6Dao.usersList(pv);
	}

	@Override
	public int count(UsersListPageDTO pv) {
		return man6Dao.count(pv);
	}

	@Override
	public void adminUserUpdate(UsersDTO dto) {
		man6Dao.adminUserUpdate(dto);
	}

	@Override
	public void adminUserDelete(String u_id) {
		man6Dao.adminUserDelete(u_id);
	}

	@Override
	public UsersDTO userInfo(String u_id) {
		return man6Dao.userInfo(u_id);
	}

	@Override
	public void visitReservation(VisitDTO vDto) {
		man6Dao.visitReservation(vDto);
	}

	@Override
	public RoomDTO selectRoom(RoomDTO rDto) {
		return man6Dao.selectRoom(rDto);
	}

	@Override
	public List<VisitDTO> visitList(String u_id) {
		return man6Dao.visitList(u_id);
	}

	@Override
	public HouseDTO selectHouse(int r_hnum) {
		return man6Dao.selectHouse(r_hnum);
	}

	@Override
	public UsersDTO pUserInfo(String r_pid) {
		return man6Dao.pUserInfo(r_pid);
	}

	@Override
	public List<VisitDTO> requestVisitList(String u_id) {
		return man6Dao.requestVisitList(u_id);
	}

	@Override
	public List<RefundDTO> adminRefundList(AdminRefundPageDTO udto) {
		return man6Dao.adminRefundList(udto);
	}

	@Override
	public int refundCount(AdminRefundPageDTO udto) {
		return man6Dao.refundCount(udto);
	}
}
