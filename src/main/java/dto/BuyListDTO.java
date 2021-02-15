package dto;

import java.util.Date;

public class BuyListDTO {
	private int by_num;
	private int by_type;
	private String by_uid;
	private String by_pid;
	private int by_rnum;
	private int by_hnum;
	private Date by_startdate;
	private Date by_enddate;
	private Date by_regdate;
	private int by_price;
	private int by_point;
	private String by_refund;
	private int by_totalprice;
	
	// 0312
	private String by_roadaddr;
	private String by_detailaddr;
	private String by_rname;

	//0316
	private String by_hname;
	private Date rf_cdate;
	
	private Date BY_REGDATE;
	
	
	
	public Date getBY_REGDATE() {
		return BY_REGDATE;
	}
	public void setBY_REGDATE(Date bY_REGDATE) {
		BY_REGDATE = bY_REGDATE;
	}
	public BuyListDTO() {
		// TODO Auto-generated constructor stub
	}
	public BuyListDTO(String by_uid, int by_rnum, Date by_startdate) {
		this.by_uid = by_uid;
		this.by_rnum = by_rnum;
		this.by_startdate = by_startdate;
	}

	public int getBy_num() {
		return by_num;
	}

	public String getBy_roadaddr() {
		return by_roadaddr;
	}

	public void setBy_roadaddr(String by_roadaddr) {
		this.by_roadaddr = by_roadaddr;
	}

	public String getBy_detailaddr() {
		return by_detailaddr;
	}

	public void setBy_detailaddr(String by_detailaddr) {
		this.by_detailaddr = by_detailaddr;
	}

	public String getBy_rname() {
		return by_rname;
	}

	public void setBy_rname(String by_rname) {
		this.by_rname = by_rname;
	}

	public void setBy_num(int by_num) {
		this.by_num = by_num;
	}

	public int getBy_type() {
		return by_type;
	}

	public void setBy_type(int by_type) {
		this.by_type = by_type;
	}

	public String getBy_uid() {
		return by_uid;
	}

	public void setBy_uid(String by_uid) {
		this.by_uid = by_uid;
	}

	public String getBy_pid() {
		return by_pid;
	}

	public void setBy_pid(String by_pid) {
		this.by_pid = by_pid;
	}

	public int getBy_rnum() {
		return by_rnum;
	}

	public void setBy_rnum(int by_rnum) {
		this.by_rnum = by_rnum;
	}

	public int getBy_hnum() {
		return by_hnum;
	}

	public void setBy_hnum(int by_hnum) {
		this.by_hnum = by_hnum;
	}

	public Date getBy_startdate() {
		return by_startdate;
	}

	public void setBy_startdate(Date by_startdate) {
		this.by_startdate = by_startdate;
	}

	public Date getBy_enddate() {
		return by_enddate;
	}

	public void setBy_enddate(Date by_enddate) {
		this.by_enddate = by_enddate;
	}

	public Date getBy_regdate() {
		return by_regdate;
	}

	public void setBy_regdate(Date by_regdate) {
		this.by_regdate = by_regdate;
	}

	public int getBy_price() {
		return by_price;
	}

	public void setBy_price(int by_price) {
		this.by_price = by_price;
	}

	public int getBy_point() {
		return by_point;
	}

	public void setBy_point(int by_point) {
		this.by_point = by_point;
	}

	public String getBy_refund() {
		return by_refund;
	}

	public void setBy_refund(String by_refund) {
		this.by_refund = by_refund;
	}
	public int getBy_totalprice() {
		return by_totalprice;
	}
	public void setBy_totalprice(int by_totalprice) {
		this.by_totalprice = by_totalprice;
	}
	public String getBy_hname() {
		return by_hname;
	}
	public void setBy_hname(String by_hname) {
		this.by_hname = by_hname;
	}
	public Date getRf_cdate() {
		return rf_cdate;
	}
	public void setRf_cdate(Date rf_cdate) {
		this.rf_cdate = rf_cdate;
	}
	
	
	
}
