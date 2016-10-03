package kr.spring.main.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.speech.domain.SpeechCommand;

@Transactional
public interface MainService {
	@Transactional(readOnly=true)
	public int getMemberCount();//�����ڸ� �� ȸ����
	@Transactional(readOnly=true)
	public int getBookCount();//���� å �Ǽ�
	@Transactional(readOnly=true)
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
