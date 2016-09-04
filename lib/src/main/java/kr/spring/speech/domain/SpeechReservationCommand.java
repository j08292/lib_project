package kr.spring.speech.domain;

import java.sql.Date;

public class SpeechReservationCommand {
	private int speech_reserve_num;
	private int speech_num;
	private String mem_id;
	private int speech_reserve_status;
	private Date speech_reserve_date;
	private String mem_name;
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getSpeech_reserve_num() {
		return speech_reserve_num;
	}
	public void setSpeech_reserve_num(int speech_reserve_num) {
		this.speech_reserve_num = speech_reserve_num;
	}
	public int getSpeech_num() {
		return speech_num;
	}
	public void setSpeech_num(int speech_num) {
		this.speech_num = speech_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getSpeech_reserve_status() {
		return speech_reserve_status;
	}
	public void setSpeech_reserve_status(int speech_reserve_status) {
		this.speech_reserve_status = speech_reserve_status;
	}
	public Date getSpeech_reserve_date() {
		return speech_reserve_date;
	}
	public void setSpeech_reserve_date(Date speech_reserve_date) {
		this.speech_reserve_date = speech_reserve_date;
	}
	
	@Override
	public String toString() {
		return "SpeechReservationCommand [speech_reserve_num=" + speech_reserve_num + ", speech_num=" + speech_num
				+ ", mem_id=" + mem_id + ", speech_reserve_status=" + speech_reserve_status + ", speech_reserve_date="
				+ speech_reserve_date + ", mem_name=" + mem_name + "]";
	}
	
}
