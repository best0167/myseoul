package dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaDTO {
	private int q_num;
	private String q_uid;
	private String q_title;
	private String q_contents;
	private Date q_regdate;
	private String q_image;
	private int q_readcnt;
	private int q_ref;
	private int q_restep;
	private int q_relevel;
	private MultipartFile filename;
	
	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}

	public QnaDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ_uid() {
		return q_uid;
	}

	public void setQ_uid(String q_uid) {
		this.q_uid = q_uid;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_contents() {
		return q_contents;
	}

	public void setQ_contents(String q_contents) {
		this.q_contents = q_contents;
	}

	public Date getQ_regdate() {
		return q_regdate;
	}

	public void setQ_regdate(Date q_regdate) {
		this.q_regdate = q_regdate;
	}

	public String getQ_image() {
		return q_image;
	}

	public void setQ_image(String q_image) {
		this.q_image = q_image;
	}

	public int getQ_readcnt() {
		return q_readcnt;
	}

	public void setQ_readcnt(int q_readcnt) {
		this.q_readcnt = q_readcnt;
	}

	public int getQ_ref() {
		return q_ref;
	}

	public void setQ_ref(int q_ref) {
		this.q_ref = q_ref;
	}

	public int getQ_restep() {
		return q_restep;
	}

	public void setQ_restep(int q_restep) {
		this.q_restep = q_restep;
	}

	public int getQ_relevel() {
		return q_relevel;
	}

	public void setQ_relevel(int q_relevel) {
		this.q_relevel = q_relevel;
	}
	
	
}
