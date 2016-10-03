package kr.spring.main.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.main.dao.MainMapper;
import kr.spring.speech.domain.SpeechCommand;

@Service("mainService")
public class MainServiceImpl implements MainService{

	@Resource
	private MainMapper mainMapper;
	
	@Override
	public int getMemberCount() {
		return mainMapper.getMemberCount();
	}

	@Override
	public int getBookCount() {
		return mainMapper.getBookCount();
	}

	@Override
	public int getSpeechCount() {
		return mainMapper.getSpeechCount();
	}
	
	@Override
	public List<SpeechCommand> mainSpeechList() {
		return mainMapper.mainSpeechList();
	}

	@Override
	public List<AdminBooklistCommand> mainNewBooklist() {
		return mainMapper.mainNewBooklist();
	}
	
	@Override
	public int getNewBookCount() {
		return mainMapper.getNewBookCount();
	}

	@Override
	public List<AdminBooklistCommand> mainBooklist() {
		return mainMapper.mainBooklist();
	}

	@Override
	public int getMainBookCount() {
		return mainMapper.getMainBookCount();
	}
}