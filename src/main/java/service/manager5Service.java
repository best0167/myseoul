package service;

import java.util.List;

import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.PageDTO;

public interface manager5Service {
	public HouseDTO houseViewProcess(int h_num);
	public List<HouseDTO> houseListProcess(PageDTO pv);
	public List<HousePicsDTO> housePicsProcess(int h_num);
	public String houseMainPicProcess(int h_num);
	public int countProcess(PageDTO pv);
}
