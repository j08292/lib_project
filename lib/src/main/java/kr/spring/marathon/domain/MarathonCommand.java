package kr.spring.marathon.domain;

import java.sql.Date;

public class MarathonCommand {
	private int list_num;
	private String list_title;
	private int list_page;
	private String mem_id;
	private Date rent_regdate;
	private int gradecheck;
	//������ ���̺� ��
	private int marathon_num;
	private int marathon_page;
	private Date marathon_regdate;
	private int marathon_status;
	//������ ����Ʈ���� ���� ��
	private String mem_name;
	private String mem_address;
	
	
	public int getList_num() {
		return list_num;
	}
	public void setList_num(int list_num) {
		this.list_num = list_num;
	}
	public String getList_title() {
		return list_title;
	}
	public void setList_title(String list_title) {
		this.list_title = list_title;
	}
	public int getList_page() {
		return list_page;
	}
	public void setList_page(int list_page) {
		this.list_page = list_page;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getRent_regdate() {
		return rent_regdate;
	}
	public void setRent_regdate(Date rent_regdate) {
		this.rent_regdate = rent_regdate;
	}
	public int getGradecheck() {
		return gradecheck;
	}
	public void setGradecheck(int gradecheck) {
		this.gradecheck = gradecheck;
	}
	public int getMarathon_num() {
		return marathon_num;
	}
	public void setMarathon_num(int marathon_num) {
		this.marathon_num = marathon_num;
	}
	public int getMarathon_page() {
		return marathon_page;
	}
	public void setMarathon_page(int marathon_page) {
		this.marathon_page = marathon_page;
	}
	public Date getMarathon_regdate() {
		return marathon_regdate;
	}
	public void setMarathon_regdate(Date marathon_regdate) {
		this.marathon_regdate = marathon_regdate;
	}
	public int getMarathon_status() {
		return marathon_status;
	}
	public void setMarathon_status(int marathon_status) {
		this.marathon_status = marathon_status;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	@Override
	public String toString() {
		return "MarathonCommand [list_num=" + list_num + ", list_title=" + list_title + ", list_page=" + list_page
				+ ", mem_id=" + mem_id + ", rent_regdate=" + rent_regdate + ", gradecheck=" + gradecheck
				+ ", marathon_num=" + marathon_num + ", marathon_page=" + marathon_page + ", marathon_regdate="
				+ marathon_regdate + ", marathon_status=" + marathon_status + ", mem_name=" + mem_name
				+ ", mem_address=" + mem_address + "]";
	}
	
}
