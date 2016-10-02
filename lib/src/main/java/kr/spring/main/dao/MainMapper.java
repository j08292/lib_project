package kr.spring.main.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface MainMapper {
	
	@Select("SELECT count(*) FROM MEMBER WHERE mem_level!=2")
	public int getMemberCount();//�����ڸ� �� ȸ����
	@Select("SELECT count(*) FROM booklist")
	public int getBookCount();//���� å �Ǽ�
	@Select("SELECT count(*) FROM speech WHERE speech_date>sysdate")
	public int getSpeechCount();//���� �������� ������
}
