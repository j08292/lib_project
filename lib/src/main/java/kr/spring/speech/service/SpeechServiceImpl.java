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
		return speechMapper.list(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return speechMapper.getRowCount(map);
	}

	@Override
	public void insert(SpeechCommand speech) {
		speechMapper.insert(speech);
	}

	@Override
	public SpeechCommand selectSpeech(Integer speech_num) {
		return speechMapper.selectSpeech(speech_num);
	}

	@Override
	public void updateHit(Integer speech_num) {
		speechMapper.updateHit(speech_num);
	}

	@Override
	public void update(SpeechCommand speech) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer speech_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectRes(Integer speech_num) {
		return speechMapper.selectRes(speech_num);
	}

}
