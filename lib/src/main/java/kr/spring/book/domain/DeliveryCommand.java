package kr.spring.book.domain;

import java.sql.Date;

public class DeliveryCommand {
	private int delivery_num;
	private String delivery_name;
	private String delivery_cell;
	private String delivery_email;
	private String sample3_postcode;
	private String delivery_address;
	private String mem_id;
	private int delivery_status;
	private int list_num;
	private int rent_num;
	private String string_listnum;
	private String string_rentnum;
	private Date delivery_regdate;

	public String getString_listnum() {
		return string_listnum;
	}

	public void setString_listnum(String string_listnum) {
		this.string_listnum = string_listnum;
	}

	public String getString_rentnum() {
		return string_rentnum;
	}

	public void setString_rentnum(String string_rentnum) {
		this.string_rentnum = string_rentnum;
	}

	public Date getDelivery_regdate() {
		return delivery_regdate;
	}

	public void setDelivery_regdate(Date delivery_regdate) {
		this.delivery_regdate = delivery_regdate;
	}

	public int getList_num() {
		return list_num;
	}

	public void setList_num(int list_num2) {
		this.list_num = list_num2;
	}

	public int getRent_num() {
		return rent_num;
	}

	public void setRent_num(int num) {
		this.rent_num = num;
	}

	public int getDelivery_status() {
		return delivery_status;
	}

	public void setDelivery_status(int delivery_status) {
		this.delivery_status = delivery_status;
	}

	public int getDelivery_num() {
		return delivery_num;
	}

	public void setDelivery_num(int delivery_num) {
		this.delivery_num = delivery_num;
	}

	public String getDelivery_name() {
		return delivery_name;
	}

	public void setDelivery_name(String delivery_name) {
		this.delivery_name = delivery_name;
	}

	public String getDelivery_cell() {
		return delivery_cell;
	}

	public void setDelivery_cell(String delivery_cell) {
		this.delivery_cell = delivery_cell;
	}

	public String getDelivery_email() {
		return delivery_email;
	}

	public void setDelivery_email(String delivery_email) {
		this.delivery_email = delivery_email;
	}

	public String getDelivery_address() {
		return delivery_address;
	}

	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getSample3_postcode() {
		return sample3_postcode;
	}

	public void setSample3_postcode(String sample3_postcode) {
		this.sample3_postcode = sample3_postcode;
	}

	@Override
	public String toString() {
		return "DeliveryCommand [delivery_num=" + delivery_num + ", delivery_name=" + delivery_name + ", delivery_cell="
				+ delivery_cell + ", delivery_email=" + delivery_email + ", sample3_postcode=" + sample3_postcode
				+ ", delivery_address=" + delivery_address + ", mem_id=" + mem_id + ", delivery_status="
				+ delivery_status + ", list_num=" + list_num + ", rent_num=" + rent_num + ", string_listnum="
				+ string_listnum + ", string_rentnum=" + string_rentnum + ", delivery_regdate=" + delivery_regdate
				+ "]";
	}

	
	
}
