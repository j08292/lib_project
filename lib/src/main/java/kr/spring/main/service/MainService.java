package kr.spring.main.service;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface MainService {
	@Transactional(readOnly=true)
	public int getMemberCount();//�����ڸ� �� ȸ����
	@Transactional(readOnly=true)
	public int getBookCount();//���� å �Ǽ�
	@Transactional(readOnly=true)
	public int getSpeechCount();//���� �������� ������
}
