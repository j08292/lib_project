package kr.spring.speech.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.speech.dao.SpeechMapper;
import kr.spring.speech.domain.SpeechCommand;

@Service("speechService")
public class SpeechServiceImpl implements SpeechService{

	@Resource
	private SpeechMapper speechMapper;
	
	@Override
	public List<SpeechCommand> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(SpeechCommand speech) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public SpeechCommand selectSpeech(Integer speech_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHit(Integer speech_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(SpeechCommand speech) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer speech_num) {
		// TODO Auto-generated method stub
		
	}

}
