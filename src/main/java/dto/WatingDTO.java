package dto;

import java.sql.Date;

public class WatingDTO {
	private int w_num;
	private String w_uid;
	private String w_sellnum;
	private Date w_regdate;
	private Date w_cdate;
	private String w_permit;
	private Date w_selldate;
	private String w_sellname;
	private String w_leader;
	
	public WatingDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getW_num() {
		return w_num;
	}

	public void setW_num(int w_num) {
		this.w_num = w_num;
	}

	public String getW_uid() {
		return w_uid;
	}

	public void setW_uid(String w_uid) {
		this.w_uid = w_uid;
	}

	public String getW_sellnum() {
		return w_sellnum;
	}

	public void setW_sellnum(String w_sellnum) {
		this.w_sellnum = w_sellnum;
	}

	public Date getW_regdate() {
		return w_regdate;
	}

	public void setW_regdate(Date w_regdate) {
		this.w_regdate = w_regdate;
	}

	public Date getW_cdate() {
		return w_cdate;
	}

	public void setW_cdate(Date w_cdate) {
		this.w_cdate = w_cdate;
	}

	public String getW_permit() {
		return w_permit;
	}

	public void setW_permit(String w_permit) {
		this.w_permit = w_permit;
	}

	public Date getW_selldate() {
		return w_selldate;
	}

	public void setW_selldate(Date w_selldate) {
		this.w_selldate = w_selldate;
	}

	public String getW_sellname() {
		return w_sellname;
	}

	public void setW_sellname(String w_sellname) {
		this.w_sellname = w_sellname;
	}

	public String getW_leader() {
		return w_leader;
	}

	public void setW_leader(String w_leader) {
		this.w_leader = w_leader;
	}
	
	
}
