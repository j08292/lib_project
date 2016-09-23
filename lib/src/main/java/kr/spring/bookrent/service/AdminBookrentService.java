package kr.spring.bookrent.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.bookrent.domain.AdminBookrentCommand;
import kr.spring.penalty.domain.PenaltyCommand;

@Transactional
public interface AdminBookrentService {
	//������ ���� ����
	@Transactional(readOnly=true)
	public List<AdminBookrentCommand> list(Map<String, Object> map);
	@Transactional(readOnly=true)
	public int getRowCount(Map<String, Object> map);
	public int getReserveCount(Integer list_num);
	public void updateBookRent(AdminBookrentCommand bookrent);//���� ����ó��
	public void updateBookReturn(AdminBookrentCommand bookrent);//���� �ݳ�ó��
	public void insertPenalty(PenaltyCommand penalty);//��ü�� �����ϴ� å �ݳ��� -> �г�Ƽ ���̺� ����
	public void reserveToWaiting(Integer list_num);//���൵�� -> ������	
	public void updateRentCancel(AdminBookrentCommand bookrent);//�Ա� �������� ������ �뿩 ���
}