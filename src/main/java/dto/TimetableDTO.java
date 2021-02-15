package dto;

import java.util.Date;

public class TimetableDTO {
	private int t_num;
	private int t_bynum;
	private String t_uid;
	private int t_hnum;
	private int t_rnum;
	private Date t_startdate;
	private Date t_enddate;
	
	public TimetableDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getT_num() {
		return t_num;
	}

	public void setT_num(int t_num) {
		this.t_num = t_num;
	}

	public int getT_bynum() {
		return t_bynum;
	}

	public void setT_bynum(int t_bynum) {
		this.t_bynum = t_bynum;
	}

	public String getT_uid() {
		return t_uid;
	}

	public void setT_uid(String t_uid) {
		this.t_uid = t_uid;
	}

	public int getT_hnum() {
		return t_hnum;
	}

	public void setT_hnum(int t_hnum) {
		this.t_hnum = t_hnum;
	}

	public int getT_rnum() {
		return t_rnum;
	}

	public void setT_rnum(int t_rnum) {
		this.t_rnum = t_rnum;
	}

	public Date getT_startdate() {
		return t_startdate;
	}

	public void setT_startdate(Date t_startdate) {
		this.t_startdate = t_startdate;
	}

	public Date getT_enddate() {
		return t_enddate;
	}

	public void setT_enddate(Date t_enddate) {
		this.t_enddate = t_enddate;
	}
	
}
