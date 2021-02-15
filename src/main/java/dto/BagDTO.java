package dto;

import java.util.Date;

public class BagDTO {
	 private int b_num;
	 private String b_uid;
	 private int b_hnum;
	 private int b_rnum;
	 private String b_name;
	 private int b_price;
	 private Date b_startdate;
	 private Date b_enddate;
	 private String b_picture;
	 private String b_roadaddr;
	 private String b_detailaddr;
	 private String b_pid;
	 private String b_hname;
	 private String b_rtstate;
	 
	 public String getB_hname() {
		return b_hname;
	}

	public void setB_hname(String b_hname) {
		this.b_hname = b_hname;
	}

	public BagDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public BagDTO(String b_uid, int b_rnum, Date b_startdate) {
		this.b_uid = b_uid;
		this.b_rnum = b_rnum;
		this.b_startdate = b_startdate;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_uid() {
		return b_uid;
	}

	public void setB_uid(String b_uid) {
		this.b_uid = b_uid;
	}

	public int getB_hnum() {
		return b_hnum;
	}

	public void setB_hnum(int b_hnum) {
		this.b_hnum = b_hnum;
	}

	public int getB_rnum() {
		return b_rnum;
	}

	public void setB_rnum(int b_rnum) {
		this.b_rnum = b_rnum;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public int getB_price() {
		return b_price;
	}

	public void setB_price(int b_price) {
		this.b_price = b_price;
	}

	public Date getB_startdate() {
		return b_startdate;
	}

	public void setB_startdate(Date b_startdate) {
		this.b_startdate = b_startdate;
	}

	public Date getB_enddate() {
		return b_enddate;
	}

	public void setB_enddate(Date b_enddate) {
		this.b_enddate = b_enddate;
	}

	public String getB_picture() {
		return b_picture;
	}

	public void setB_picture(String b_picture) {
		this.b_picture = b_picture;
	}

	public String getB_roadaddr() {
		return b_roadaddr;
	}

	public void setB_roadaddr(String b_roadaddr) {
		this.b_roadaddr = b_roadaddr;
	}

	public String getB_detailaddr() {
		return b_detailaddr;
	}

	public void setB_detailaddr(String b_detailaddr) {
		this.b_detailaddr = b_detailaddr;
	}

	public String getB_pid() {
		return b_pid;
	}

	public void setB_pid(String b_pid) {
		this.b_pid = b_pid;
	}

	public String getB_rtstate() {
		return b_rtstate;
	}

	public void setB_rtstate(String b_rtstate) {
		this.b_rtstate = b_rtstate;
	}
	 
	 
	 
}
