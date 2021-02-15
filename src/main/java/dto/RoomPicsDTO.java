package dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RoomPicsDTO {
	private int rp_num;
	private int rp_hnum;
	private int rp_rnum;
	private String rp_dir;
	
	private List<MultipartFile> files;  //해당방의 사진리스트
	private List<RoomPicsDTO> roomPicsDtoList;  //해당 집 방사진 dto리스트
	
	private String rp_option;//방사진 수정할때 사용합니다.
	private MultipartFile rfile; //방사진 수정할때 사용합니다.
	
	public RoomPicsDTO() {
		// TODO Auto-generated constructor stub
	}

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public List<RoomPicsDTO> getRoomPicsDtoList() {
		return roomPicsDtoList;
	}

	public void setRoomPicsDtoList(List<RoomPicsDTO> roomPicsDtoList) {
		this.roomPicsDtoList = roomPicsDtoList;
	}

	public int getRp_num() {
		return rp_num;
	}

	public void setRp_num(int rp_num) {
		this.rp_num = rp_num;
	}

	public int getRp_hnum() {
		return rp_hnum;
	}

	public void setRp_hnum(int rp_hnum) {
		this.rp_hnum = rp_hnum;
	}

	public int getRp_rnum() {
		return rp_rnum;
	}

	public void setRp_rnum(int rp_rnum) {
		this.rp_rnum = rp_rnum;
	}

	public String getRp_dir() {
		return rp_dir;
	}

	public void setRp_dir(String rp_dir) {
		this.rp_dir = rp_dir;
	}

	public String getRp_option() {
		return rp_option;
	}

	public void setRp_option(String rp_option) {
		this.rp_option = rp_option;
	}

	public MultipartFile getRfile() {
		return rfile;
	}

	public void setRfile(MultipartFile rfile) {
		this.rfile = rfile;
	}
	
	
	
}
