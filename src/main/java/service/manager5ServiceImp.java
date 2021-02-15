package service;

import java.util.List;

import dao.manager5DAO;
import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.PageDTO;

public class manager5ServiceImp implements manager5Service{
	private manager5DAO dao;
	
	public void manager5Service() {
	}
	public void setDao(manager5DAO dao) {
		this.dao = dao;
	}
	//집 상세보기
	@Override
	public HouseDTO houseViewProcess(int h_num) {
		//조회수 +1 추가
		dao.readCount(h_num);
		return dao.houseView(h_num);
	}
	//집 리스트 보기
	@Override
	public List<HouseDTO> houseListProcess(PageDTO pv) {
		return dao.houseList(pv);
	}
	//집 상세보기안에 사진 가져오기
	@Override
	public List<HousePicsDTO> housePicsProcess(int h_num) {
		return dao.housePics(h_num);
	}
	@Override
	public String houseMainPicProcess(int h_num) {
		return dao.houseMainPic(h_num);
	}
	@Override
	public int countProcess(PageDTO pv) {
		return dao.count(pv);
	}
	
	
}
