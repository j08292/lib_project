package kr.spring.marathon.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.marathon.domain.MarathonCommand;
import kr.spring.member.domain.MemberCommand;

@Transactional
public interface MarathonService {
	//Ư�� ȸ���� �����ߴ� ���
	public List<MarathonCommand> rentedList(Map<String, Object> map);
	public int getRowCount(Map<String , Object> map);
	//Ư�� ȸ�� ������ ������ų ���
	public List<MarathonCommand> pageList(String mem_id);
	public void updateMrtStatus(String mem_id);		
}
