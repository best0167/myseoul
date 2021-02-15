package dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {
	private int rv_num;
	private int rv_bynum;
	private String rv_uid;
	private int rv_hnum;
	private String rv_contents;
	private Date rv_regdate;
	private String rv_picture;
	private double rv_star;
	
	private MultipartFile rv_filename;
	
	//0318
	private int rv_rnum;
	private String rv_rname;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getRv_num() {
		return rv_num;
	}

	public void setRv_num(int rv_num) {
		this.rv_num = rv_num;
	}

	public int getRv_bynum() {
		return rv_bynum;
	}

	public void setRv_bynum(int rv_bynum) {
		this.rv_bynum = rv_bynum;
	}

	public String getRv_uid() {
		return rv_uid;
	}

	public void setRv_uid(String rv_uid) {
		this.rv_uid = rv_uid;
	}

	public int getRv_hnum() {
		return rv_hnum;
	}

	public void setRv_hnum(int rv_hnum) {
		this.rv_hnum = rv_hnum;
	}

	public String getRv_contents() {
		return rv_contents;
	}

	public void setRv_contents(String rv_contents) {
		this.rv_contents = rv_contents;
	}

	public Date getRv_regdate() {
		return rv_regdate;
	}

	public void setRv_regdate(Date rv_regdate) {
		this.rv_regdate = rv_regdate;
	}

	
	public String getRv_picture() {
		return rv_picture;
	}

	public void setRv_picture(String rv_picture) {
		this.rv_picture = rv_picture;
	}

	public double getRv_star() {
		return rv_star;
	}

	public void setRv_star(double rv_star) {
		this.rv_star = rv_star;
	}

	public MultipartFile getRv_filename() {
		return rv_filename;
	}

	public void setRv_filename(MultipartFile rv_filename) {
		this.rv_filename = rv_filename;
	}

	public int getRv_rnum() {
		return rv_rnum;
	}

	public void setRv_rnum(int rv_rnum) {
		this.rv_rnum = rv_rnum;
	}

	public String getRv_rname() {
		return rv_rname;
	}

	public void setRv_rname(String rv_rname) {
		this.rv_rname = rv_rname;
	}	
	
}
