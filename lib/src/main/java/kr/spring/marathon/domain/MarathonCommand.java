package kr.spring.marathon.domain;

import java.sql.Date;

public class MarathonCommand {
	private int list_num;
	private String list_title;
	private int list_page;
	private String mem_id;
	private Date rent_regdate;
	private int gradecheck;
	
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
	@Override
	public String toString() {
		return "MarathonCommand [list_num=" + list_num + ", list_title=" + list_title + ", list_page=" + list_page
				+ ", mem_id=" + mem_id + ", rent_regdate=" + rent_regdate + ", gradecheck=" + gradecheck + "]";
	}
	

	
}
