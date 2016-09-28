package kr.spring.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.penalty.domain.PenaltyCommand;

@Repository
public interface AdminMapper {
	//���� - ������ üũ����
	@Select("SELECT count(*) FROM bookrent WHERE rent_status = 3")
	public int getRentWaitingCount();
	@Select("SELECT count(*) FROM wishlist WHERE wish_status = 0")
	public int getWishlistCount();
	@Select("SELECT count(*) FROM speech_reservation WHERE speech_reserve_status=0")
	public int getSpeechReserveCount();
	@Select("SELECT count(*) FROM speech_reservation WHERE speech_reserve_status=2")
	public int getSpeechCancelCount();
	@Select("SELECT count(*) FROM bookrent WHERE rent_status = 2")
	public int getBookReserveCount();
	@Select("SELECT count(*) FROM marathon WHERE marathon_status = 0")
	public int getMarathonCount();
	@Select("SELECT count(*) FROM (SELECT q.*, (SELECT count(*) FROM qna_reply qr WHERE qr.qna_num=q.qna_num)qna_replyCount FROM qna q) WHERE qna_replyCount = 0")
	public int getQnaWaitingCount();
	@Select("SELECT count(*) FROM event WHERE sysdate > event_enddate")
	public int getPrevEventCount();
	//���� - ����ȸ�� ����
	public List<PenaltyCommand> penaltyList();
	public int getRowPenaltyCount();	
	//���� - �α⵵�� ��Ʈ
	public List<AdminBooklistCommand> rentRankList();
	//���� - 3���� ������Ȳ ��
	//2���� ��_�뿩��|2���� ��_������� ��û �Ǽ�|2���� ��_�ű� �԰��� �Ǽ�
	@Select("SELECT count(*) FROM bookrent WHERE (rent_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD'))) AND (rent_status=0 OR rent_status = 1)")
	public int getBookRentCount_2();
	@Select("SELECT count(*) FROM wishlist WHERE (wish_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getWishlistCount_2();
	@Select("SELECT count(*) FROM booklist WHERE (list_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-2)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getBooklistCount_2();
	//1���� ��_�뿩��|1���� ��_������� ��û �Ǽ�|1���� ��_�ű� �԰��� �Ǽ�
	@Select("SELECT count(*) FROM bookrent WHERE (rent_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD'))) AND (rent_status=0 OR rent_status = 1)")
	public int getBookRentCount_1();
	@Select("SELECT count(*) FROM wishlist WHERE (wish_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getWishlistCount_1();
	@Select("SELECT count(*) FROM booklist WHERE (list_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,-1)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getBooklistCount_1();
	//����_�뿩��|����_������� ��û �Ǽ�|����_�ű� �԰��� �Ǽ�
	@Select("SELECT count(*) FROM bookrent WHERE (rent_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD'))) AND (rent_status=0 OR rent_status = 1)")
	public int getBookRentCount_0();
	@Select("SELECT count(*) FROM wishlist WHERE (wish_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getWishlistCount_0();
	@Select("SELECT count(*) FROM booklist WHERE (list_regdate BETWEEN TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD') AND LAST_DAY(TRUNC(ADD_MONTHS(SYSDATE,0)+1)-TO_CHAR(SYSDATE,'DD')))")
	public int getBooklistCount_0();
}