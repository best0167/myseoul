package dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class HousePicsDTO {
	private int hp_num;
	private int hp_hnum;
	private String hp_dir;
	
	private String hp_option;
	private MultipartFile hfile;
	private List<HousePicsDTO> housePicsDtoList;
	
	public HousePicsDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getHp_num() {
		return hp_num;
	}

	public void setHp_num(int hp_num) {
		this.hp_num = hp_num;
	}

	public int getHp_hnum() {
		return hp_hnum;
	}

	public void setHp_hnum(int hp_hnum) {
		this.hp_hnum = hp_hnum;
	}

	public String getHp_dir() {
		return hp_dir;
	}

	public void setHp_dir(String hp_dir) {
		this.hp_dir = hp_dir;
	}

	public String getHp_option() {
		return hp_option;
	}

	public void setHp_option(String hp_option) {
		this.hp_option = hp_option;
	}

	public MultipartFile getHfile() {
		return hfile;
	}

	public void setHfile(MultipartFile hfile) {
		this.hfile = hfile;
	}

	public List<HousePicsDTO> getHousePicsDtoList() {
		return housePicsDtoList;
	}

	public void setHousePicsDtoList(List<HousePicsDTO> housePicsDtoList) {
		this.housePicsDtoList = housePicsDtoList;
	}
	
	
	
}
