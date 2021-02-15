package dto;

import java.sql.Date;
import java.util.List;

public class RoomDTO {
	private int r_num;
	private int r_hnum;
	private String r_name;
	private int r_area;
	private String r_bath;
	private int r_price;
	private String r_state;
	private Date r_startdate;
	private Date r_enddate;
	private String r_pid;
	private String r_tstate;
	
	 //여러개의 방정보 들어올때는 리스트로받을것임
	private List<RoomDTO> roomDtoList;
	
	//방사진들 경로 배열
	private String[] roomPicDirs;
	
	public RoomDTO() {
		// TODO Auto-generated constructor stub
	}
	

	public List<RoomDTO> getRoomDtoList() {
		return roomDtoList;
	}


	public void setRoomDtoList(List<RoomDTO> roomDtoList) {
		this.roomDtoList = roomDtoList;
	}


	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public int getR_hnum() {
		return r_hnum;
	}

	public void setR_hnum(int r_hnum) {
		this.r_hnum = r_hnum;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public int getR_area() {
		return r_area;
	}

	public void setR_area(int r_area) {
		this.r_area = r_area;
	}

	public String getR_bath() {
		return r_bath;
	}

	public void setR_bath(String r_bath) {
		this.r_bath = r_bath;
	}

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	public String getR_state() {
		return r_state;
	}

	public void setR_state(String r_state) {
		this.r_state = r_state;
	}

	public Date getR_startdate() {
		return r_startdate;
	}

	public void setR_startdate(Date r_startdate) {
		this.r_startdate = r_startdate;
	}

	public Date getR_enddate() {
		return r_enddate;
	}

	public void setR_enddate(Date r_enddate) {
		this.r_enddate = r_enddate;
	}

	public String getR_pid() {
		return r_pid;
	}

	public void setR_pid(String r_pid) {
		this.r_pid = r_pid;
	}

	public String getR_tstate() {
		return r_tstate;
	}

	public void setR_tstate(String r_tstate) {
		this.r_tstate = r_tstate;
	}

	public String[] getRoomPicDirs() {
		return roomPicDirs;
	}

	public void setRoomPicDirs(String[] roomPicDirs) {
		this.roomPicDirs = roomPicDirs;
	}
		
}
