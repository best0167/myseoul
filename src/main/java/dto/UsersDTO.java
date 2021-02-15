package dto;

import java.sql.Date;

public class UsersDTO {
	private String u_id;
	private String u_grade;
	private String u_pw;
	private String u_gender;
	private String u_phone;
	private String u_email;
	private Date u_birth;
	private String u_nation;
	private int u_point;
	private String u_name;
	private Date u_regdate;
	//환불할 포인트
	private int rf_point;
	
	public UsersDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public UsersDTO(String u_id, int u_point, int rf_point) {
		this.u_id = u_id;
		this.u_point = u_point;
		this.rf_point = rf_point;
	}
	
	public Date getU_regdate() {
		return u_regdate;
	}

	public void setU_regdate(Date u_regdate) {
		this.u_regdate = u_regdate;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_grade() {
		return u_grade;
	}

	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public Date getU_birth() {
		return u_birth;
	}

	public void setU_birth(Date u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_nation() {
		return u_nation;
	}

	public void setU_nation(String u_nation) {
		this.u_nation = u_nation;
	}

	public int getU_point() {
		return u_point;
	}

	public void setU_point(int u_point) {
		this.u_point = u_point;
	}

	public int getRf_point() {
		return rf_point;
	}

	public void setRf_point(int rf_point) {
		this.rf_point = rf_point;
	}
	
}
