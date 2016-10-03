package kr.spring.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.speech.domain.SpeechCommand;

@Repository
public interface MainMapper {	
	@Select("SELECT count(*) FROM MEMBER WHERE mem_level!=2")
	public int getMemberCount();//관리자를 뺀 회원수
	@Select("SELECT count(*) FROM booklist")
	public int getBookCount();//보유 책 권수
	@Select("SELECT count(*) FROM speech WHERE speech_date>sysdate")
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