package dto;

import java.util.Date;

public class RefundDTO {

	private int rf_num;
	private int rf_type;
	private int rf_bynum;
	private String rf_uid;
	private int rf_hnum;
	private int rf_rnum;
	private String rf_contents;
	private int rf_price;
	private int rf_point;
	private String rf_prog;
	private Date rf_regdate;
	private Date rf_cdate;
	private String rf_pid;
	
	//
	private String rf_roadaddr;
	private String rf_detailaddr;
	private String rf_hname;
	private String rf_rname;
	
	//
	private Date rf_bystartdate;
	private Date rf_byenddate;
	
	public RefundDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getRf_num() {
		return rf_num;
	}
	public void setRf_num(int rf_num) {
		this.rf_num = rf_num;
	}
	public int getRf_type() {
		return rf_type;
	}
	public void setRf_type(int rf_type) {
		this.rf_type = rf_type;
	}
	public int getRf_bynum() {
		return rf_bynum;
	}
	public void setRf_bynum(int rf_bynum) {
		this.rf_bynum = rf_bynum;
	}
	public String getRf_uid() {
		return rf_uid;
	}
	public void setRf_uid(String rf_uid) {
		this.rf_uid = rf_uid;
	}
	public int getRf_hnum() {
		return rf_hnum;
	}
	public void setRf_hnum(int rf_hnum) {
		this.rf_hnum = rf_hnum;
	}
	public int getRf_rnum() {
		return rf_rnum;
	}
	public void setRf_rnum(int rf_rnum) {
		this.rf_rnum = rf_rnum;
	}
	public String getRf_contents() {
		return rf_contents;
	}
	public void setRf_contents(String rf_contents) {
		this.rf_contents = rf_contents;
	}
	public int getRf_price() {
		return rf_price;
	}
	public void setRf_price(int rf_price) {
		this.rf_price = rf_price;
	}
	public int getRf_point() {
		return rf_point;
	}
	public void setRf_point(int rf_point) {
		this.rf_point = rf_point;
	}
	public String getRf_prog() {
		return rf_prog;
	}
	public void setRf_prog(String rf_prog) {
		this.rf_prog = rf_prog;
	}
	public Date getRf_regdate() {
		return rf_regdate;
	}
	public void setRf_regdate(Date rf_regdate) {
		this.rf_regdate = rf_regdate;
	}
	public Date getRf_cdate() {
		return rf_cdate;
	}
	public void setRf_cdate(Date rf_cdate) {
		this.rf_cdate = rf_cdate;
	}

	public String getRf_pid() {
		return rf_pid;
	}

	public void setRf_pid(String rf_pid) {
		this.rf_pid = rf_pid;
	}

	public String getRf_roadaddr() {
		return rf_roadaddr;
	}

	public void setRf_roadaddr(String rf_roadaddr) {
		this.rf_roadaddr = rf_roadaddr;
	}

	public String getRf_detailaddr() {
		return rf_detailaddr;
	}

	public void setRf_detailaddr(String rf_detailaddr) {
		this.rf_detailaddr = rf_detailaddr;
	}

	public String getRf_hname() {
		return rf_hname;
	}

	public void setRf_hname(String rf_hname) {
		this.rf_hname = rf_hname;
	}

	public String getRf_rname() {
		return rf_rname;
	}

	public void setRf_rname(String rf_rname) {
		this.rf_rname = rf_rname;
	}

	public Date getRf_bystartdate() {
		return rf_bystartdate;
	}

	public void setRf_bystartdate(Date rf_bystartdate) {
		this.rf_bystartdate = rf_bystartdate;
	}

	public Date getRf_byenddate() {
		return rf_byenddate;
	}

	public void setRf_byenddate(java.util.Date date) {
		this.rf_byenddate = date;
	}
	
}
