package kr.spring.marathon.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.marathon.domain.MarathonCommand;

@Transactional
public interface MarathonService {
	//Ư�� ȸ���� �����ߴ� ���
	public List<MarathonCommand> rentedList(Map<String, Object> map);
	public int getRowCount(Map<String , Object> map);
	//Ư�� ȸ�� ������ ������ų ���
	public List<MarathonCommand> pageList(String mem_id);
	//marathon���̺� ����(�������� ��û�� �߰�)
	public void insert(MarathonCommand marathon);
	//member���̺��� mrt_status ����
	public void applyMrtStatus(String mem_id);		
	public void finishMrtStatus(String mem_id);
	
	//�������ʿ��� ���� ������ ����Ʈ
	public List<MarathonCommand> finishList(Map<String, Object> map);
	public int getFinishRowCount(Map<String , Object> map);
	public void updateStatus(MarathonCommand marathon);
}
