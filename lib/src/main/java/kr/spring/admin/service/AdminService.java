package kr.spring.admin.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.penalty.domain.PenaltyCommand;

@Transactional
public interface AdminService {
	//����- ������ üũ����
	public int getSpeechReserveCount();
	public int getMarathonCount();
	public int getWishlistCount();
	public int getRentWaitingCount();
	//���� - ����ȸ�� ����
	public List<PenaltyCommand> penaltyList();
	public int getRowPenaltyCount();	
	//���� - �α⵵�� ��Ʈ
	public List<AdminBooklistCommand> rentRankList();
	//����- 3���� ������Ȳ ��
	//2���� ��_�뿩��
	public int getBookRentCount_2();
	//2���� ��_������� ��û �Ǽ�
	public int getWishlistCount_2();
	//2���� ��_�ű� �԰��� �Ǽ�
	public int getBooklistCount_2();
	//1���� ��_�뿩��
	public int getBookRentCount_1();
	//1���� ��_������� ��û �Ǽ�
	public int getWishlistCount_1();
	//1���� ��_�ű� �԰��� �Ǽ�
	public int getBooklistCount_1();
	//����_�뿩��
	public int getBookRentCount_0();
	//����_������� ��û �Ǽ�
	public int getWishlistCount_0();
	//����_�ű� �԰��� �Ǽ�
	public int getBooklistCount_0();
}