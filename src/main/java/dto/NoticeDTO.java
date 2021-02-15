package dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {
	private int n_num;
	private String n_uid;
	private String n_title;
	private  String n_contents;
	private Date n_regdate;
	private String n_file;
	private int n_readcnt;
	private MultipartFile filename;
	
	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}

	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public String getN_uid() {
		return n_uid;
	}

	public void setN_uid(String n_uid) {
		this.n_uid = n_uid;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_contents() {
		return n_contents;
	}

	public void setN_contents(String n_contents) {
		this.n_contents = n_contents;
	}

	public Date getN_regdate() {
		return n_regdate;
	}

	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}

	public String getN_file() {
		return n_file;
	}

	public void setN_file(String n_file) {
		this.n_file = n_file;
	}

	public int getN_readcnt() {
		return n_readcnt;
	}

	public void setN_readcnt(int n_readcnt) {
		this.n_readcnt = n_readcnt;
	}
	
	
}
