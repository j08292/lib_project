package kr.spring.main.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.speech.domain.SpeechCommand;

@Transactional
public interface MainService {
	@Transactional(readOnly=true)
	public int getMemberCount();//관리자를 뺀 회원수
	@Transactional(readOnly=true)
	public int getBookCount();//보유 책 권수
	@Transactional(readOnly=true)
	public int getSpeechCount();//현재 진행중인 강연수
	//메인 : 최신 강연
	public List<SpeechCommand> mainSpeechList();
	//메인 : 신간 도서
	public List<AdminBooklistCommand> mainNewBooklist();
	public int getNewBookCount();
	//메인 : 도서 목록
	public List<AdminBooklistCommand> mainBooklist();
	public int getMainBookCount();
}
