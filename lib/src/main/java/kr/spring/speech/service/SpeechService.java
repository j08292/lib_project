package kr.spring.speech.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.speech.domain.SpeechCommand;

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
}
