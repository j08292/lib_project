package kr.spring.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.penalty.domain.PenaltyCommand;

@Repository
public interface AdminMapper {
	//���� - ������ üũ����
	@Select("SELECT count(*) FROM speech_reservation WHERE speech_reserve_status=0 or speech_reserve_status=2")
	public int getSpeechReserveCount();
	@Select("SELECT count(*) FROM marathon WHERE marathon_status = 0")
	public int getMarathonCount();
	@Select("SELECT count(*) FROM wishlist WHERE wish_status = 0")
	public int getWishlistCount();
	@Select("SELECT count(*) FROM bookrent WHERE rent_status = 3")
	public int getRentWaitingCount();
	//���� - ����ȸ�� ����
	public List<PenaltyCommand> penaltyList();
	public int getRowPenaltyCount();	
	//���� - �α⵵�� ��Ʈ
	public List<AdminBooklistCommand> rentRankList();
	//���� - 3���� ������Ȳ ��
	//2���� ��_�뿩��
	@Select("SELECT count(*) FROM bookrent WHERE (rent_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD'))) AND (rent_status=0 OR rent_status = 1)")
	public int getBookRentCount_2();
	//2���� ��_������� ��û �Ǽ�
	@Select("SELECT count(*) FROM wishlist WHERE (wish_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getWishlistCount_2();
	//2���� ��_�ű� �԰��� �Ǽ�
	@Select("SELECT count(*) FROM booklist WHERE (list_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getBooklistCount_2();
	//1���� ��_�뿩��
	@Select("SELECT count(*) FROM bookrent WHERE (rent_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD'))) AND (rent_status=0 OR rent_status = 1)")
	public int getBookRentCount_1();
	//1���� ��_������� ��û �Ǽ�
	@Select("SELECT count(*) FROM wishlist WHERE (wish_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getWishlistCount_1();
	//1���� ��_�ű� �԰��� �Ǽ�
	@Select("SELECT count(*) FROM booklist WHERE (list_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getBooklistCount_1();
	//����_�뿩��
	@Select("SELECT count(*) FROM bookrent WHERE (rent_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD'))) AND (rent_status=0 OR rent_status = 1)")
	public int getBookRentCount_0();
	//����_������� ��û �Ǽ�
	@Select("SELECT count(*) FROM wishlist WHERE (wish_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getWishlistCount_0();
	//����_�ű� �԰��� �Ǽ�
	@Select("SELECT count(*) FROM booklist WHERE (list_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getBooklistCount_0();
}