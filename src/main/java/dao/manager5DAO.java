package dao;

import java.util.List;

import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.PageDTO;

public interface manager5DAO {
		public HouseDTO houseView(int h_num);
		public List<HouseDTO> houseList(PageDTO pv);
		public List<HousePicsDTO> housePics(int h_num);
		public void readCount(int h_num);
		public String houseMainPic(int h_num);
		public int count(PageDTO pv);
}
