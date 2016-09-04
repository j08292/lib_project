package kr.spring.speech.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.speech.domain.SpeechCommand;
import kr.spring.speech.domain.SpeechReservationCommand;

@Transactional
public interface SpeechService {
	@Transactional(readOnly=true)
	public List<SpeechCommand> list(Map<String, Object> map);
	@Transactional(readOnly=true)
	public int getRowCount(Map<String , Object> map);
	public void insert(SpeechCommand speech);
	@Transactional(readOnly=true)
	public SpeechCommand selectSpeech(Integer speech_num);
	public void updateHit(Integer speech_num);
	public void update(SpeechCommand speech);
	public void delete(Integer speech_num);
	public void updateStatus(Integer speech_num);
	@Transactional(readOnly=true)
	public int selectRes(Integer speech_num);
	
	//예약자(신청자)
	@Transactional(readOnly=true)
	public List<SpeechReservationCommand> reserveList(Map<String, Object> map);
	@Transactional(readOnly=true)
	public int getRowCountReservation(Map<String, Object> map);
	public void insertReservation(SpeechReservationCommand speechReservation);
	public void updateReservation(SpeechReservationCommand speechReservation);
	public void deleteReservation(Integer speech_reserve_num);
}
