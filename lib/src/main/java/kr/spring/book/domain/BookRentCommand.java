package kr.spring.book.domain;

import java.sql.Date;

public class BookRentCommand {
	private int rent_num;
	private int list_num;
	private String mem_id;
	private Date rent_regdate;
	private int rent_status;
	private String rent_rentDate;
	private String rent_returnDate;
	private String rent_listTitle;
	private int list_order;
	private String list_reserveId;
	private Date rent_reserveDate;
	private Date rent_reserveDateCancel;
	
	public Date getRent_reserveDate() {
		return rent_reserveDate;
	}

	public void setRent_reserveDate(Date rent_reserveDate) {
		this.rent_reserveDate = rent_reserveDate;
	}

	public Date getRent_reserveDateCancel() {
		return rent_reserveDateCancel;
	}

	public void setRent_reserveDateCancel(Date rent_reserveDateCancel) {
		this.rent_reserveDateCancel = rent_reserveDateCancel;
	}

	public String getList_reserveId() {
		return list_reserveId;
	}

	public void setList_reserveId(String list_reserveId) {
		this.list_reserveId = list_reserveId;
	}

	public int getList_order() {
		return list_order;
	}

	public void setList_order(int list_order) {
		this.list_order = list_order;
	}

	public String getRent_listTitle() {
		return rent_listTitle;
	}

	public void setRent_listTitle(String rent_listTitle) {
		this.rent_listTitle = rent_listTitle;
	}

	public int getRent_num() {
		return rent_num;
	}

	public void setRent_num(int rent_num) {
		this.rent_num = rent_num;
	}

	public int getList_num() {
		return list_num;
	}

	public void setList_num(int list_num) {
		this.list_num = list_num;
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

	public int getRent_status() {
		return rent_status;
	}

	public void setRent_status(int rent_status) {
		this.rent_status = rent_status;
	}

	public String getRent_rentDate() {
		return rent_rentDate;
	}

	public void setRent_rentDate(String rent_rentDate) {
		this.rent_rentDate = rent_rentDate;
	}

	public String getRent_returnDate() {
		return rent_returnDate;
	}

	public void setRent_returnDate(String rent_returnDate) {
		this.rent_returnDate = rent_returnDate;
	}
	
}
