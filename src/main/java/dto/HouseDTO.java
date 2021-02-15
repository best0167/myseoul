package dto;

import java.sql.Date;

public class HouseDTO {
	private int h_num;
	private int h_type;
	private String h_uid;
	private String h_name;
	private String h_roadaddr;
	private String h_detailaddr;
	private int h_limit;
	private Date h_startdate;
	private Date h_enddate;
	private int h_rooms;
	private int h_bath;	
	private int h_area;
	private int h_price;
	private Date h_regdate;
	private String h_contents;
	private String h_region;
	private int h_readcnt;
	private double h_stars;
	private String h_permit;
	private Date h_permitdate;
	private String h_gender;
	
	private String h_mainPic;
	private String h_pic;
	
	private int h_starcnt;
	
	//별점 당 개수
	private int rv_star;
	
	public HouseDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public HouseDTO(int h_num, int rv_star) {
		this.h_num = h_num;
		this.rv_star = rv_star;
	}
	
	public String getH_pic() {
		return h_pic;
	}

	public void setH_pic(String h_pic) {
		this.h_pic = h_pic;
	}

	public String getH_gender() {
		return h_gender;
	}

	public void setH_gender(String h_gender) {
		this.h_gender = h_gender;
	}

	public int getH_num() {
		return h_num;
	}

	public void setH_num(int h_num) {
		this.h_num = h_num;
	}

	public int getH_type() {
		return h_type;
	}

	public void setH_type(int h_type) {
		this.h_type = h_type;
	}

	public String getH_uid() {
		return h_uid;
	}

	public void setH_uid(String h_uid) {
		this.h_uid = h_uid;
	}

	public String getH_name() {
		return h_name;
	}

	public void setH_name(String h_name) {
		this.h_name = h_name;
	}

	public String getH_roadaddr() {
		return h_roadaddr;
	}

	public void setH_roadaddr(String h_roadaddr) {
		this.h_roadaddr = h_roadaddr;
	}

	public String getH_detailaddr() {
		return h_detailaddr;
	}

	public void setH_detailaddr(String h_detailaddr) {
		this.h_detailaddr = h_detailaddr;
	}

	public int getH_limit() {
		return h_limit;
	}

	public void setH_limit(int h_limit) {
		this.h_limit = h_limit;
	}

	public Date getH_startdate() {
		return h_startdate;
	}

	public void setH_startdate(Date h_startdate) {
		this.h_startdate = h_startdate;
	}

	public Date getH_enddate() {
		return h_enddate;
	}

	public void setH_enddate(Date h_enddate) {
		this.h_enddate = h_enddate;
	}

	public int getH_rooms() {
		return h_rooms;
	}

	public void setH_rooms(int h_rooms) {
		this.h_rooms = h_rooms;
	}

	public int getH_bath() {
		return h_bath;
	}

	public void setH_bath(int h_bath) {
		this.h_bath = h_bath;
	}

	public int getH_area() {
		return h_area;
	}

	public void setH_area(int h_area) {
		this.h_area = h_area;
	}

	public int getH_price() {
		return h_price;
	}

	public void setH_price(int h_price) {
		this.h_price = h_price;
	}

	public Date getH_regdate() {
		return h_regdate;
	}

	public void setH_regdate(Date h_regdate) {
		this.h_regdate = h_regdate;
	}

	public String getH_contents() {
		return h_contents;
	}

	public void setH_contents(String h_contents) {
		this.h_contents = h_contents;
	}

	public String getH_region() {
		return h_region;
	}

	public void setH_region(String h_region) {
		this.h_region = h_region;
	}

	public int getH_readcnt() {
		return h_readcnt;
	}

	public void setH_readcnt(int h_readcnt) {
		this.h_readcnt = h_readcnt;
	}

	public double getH_stars() {
		return h_stars;
	}

	public void setH_stars(double h_stars) {
		this.h_stars = h_stars;
	}

	public String getH_permit() {
		return h_permit;
	}

	public void setH_permit(String h_permit) {
		this.h_permit = h_permit;
	}

	public Date getH_permitdate() {
		return h_permitdate;
	}

	public void setH_permitdate(Date h_permitdate) {
		this.h_permitdate = h_permitdate;
	}

	public String getH_mainPic() {
		return h_mainPic;
	}

	public void setH_mainPic(String h_mainPic) {
		this.h_mainPic = h_mainPic;
	}

	public int getH_starcnt() {
		return h_starcnt;
	}

	public void setH_starcnt(int h_starcnt) {
		this.h_starcnt = h_starcnt;
	}

	public int getRv_star() {
		return rv_star;
	}

	public void setRv_star(int rv_star) {
		this.rv_star = rv_star;
	}
	
	
	
}
