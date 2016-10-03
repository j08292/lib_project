package kr.spring.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.speech.domain.SpeechCommand;

@Repository
public interface MainMapper {	
	@Select("SELECT count(*) FROM MEMBER WHERE mem_level!=2")
	public int getMemberCount();//�����ڸ� �� ȸ����
	@Select("SELECT count(*) FROM booklist")
	public int getBookCount();//���� å �Ǽ�
	@Select("SELECT count(*) FROM speech WHERE speech_date>sysdate")
	public int getSpeechCount();//���� �������� ������
	
	//���� : �ֽ� ����
	public List<SpeechCommand> mainSpeechList();
	//���� : �Ű� ����
	public List<AdminBooklistCommand> mainNewBooklist();
	public int getNewBookCount();
	//���� : ���� ���
	public List<AdminBooklistCommand> mainBooklist();
	public int getMainBookCount();
}