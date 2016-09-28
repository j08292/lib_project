package kr.spring.admin.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.penalty.domain.PenaltyCommand;

@Transactional
public interface AdminService {
	//���� - ������ üũ����
	public int getRentWaitingCount();
	public int getWishlistCount();
	public int getSpeechReserveCount();
	public int getSpeechCancelCount();
	public int getBookReserveCount();
	public int getMarathonCount();
	public int getQnaWaitingCount();
	public int getPrevEventCount();
	//���� - ����ȸ�� ����
	public List<PenaltyCommand> penaltyList();
	public int getRowPenaltyCount();	
	//���� - �α⵵�� ��Ʈ
	public List<AdminBooklistCommand> rentRankList();
	//����- 3���� ������Ȳ ��
	//2���� ��_�뿩��|2���� ��_������� ��û �Ǽ�|2���� ��_�ű� �԰��� �Ǽ�
	public int getBookRentCount_2();
	public int getWishlistCount_2();
	public int getBooklistCount_2();
	//1���� ��_�뿩��|1���� ��_������� ��û �Ǽ�|1���� ��_�ű� �԰��� �Ǽ�
	public int getBookRentCount_1();
	public int getWishlistCount_1();
	public int getBooklistCount_1();
	//����_�뿩��|����_������� ��û �Ǽ�|����_�ű� �԰��� �Ǽ�
	public int getBookRentCount_0();
	public int getWishlistCount_0();
	public int getBooklistCount_0();
}