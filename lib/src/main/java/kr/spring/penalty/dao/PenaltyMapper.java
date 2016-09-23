package kr.spring.penalty.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.spring.penalty.domain.PenaltyCommand;

@Repository
public interface PenaltyMapper {
	//����ȸ�� ����Ʈ
	public List<PenaltyCommand> list(Map<String, Object> map);
	public int getRowCount(Map<String, Object> map);	
	//ȸ�� ���ܽ�Ű��
	@Insert("INSERT INTO penalty(penalty_num, penalty_regdate, penalty_blockcanceldate, mem_id, penalty_reason) VALUES (penalty_num.nextval,sysdate,to_date(99991231,'yyyymmdd'),#{mem_id},#{penalty_reason} )")
	public void insert(PenaltyCommand penalty);
	//����ȸ������ Ȯ��(���� ����ȸ���ϰ�� 1, �ƴϸ� 0)
	@Select("SELECT count(*) FROM penalty WHERE penalty_blockcanceldate > sysdate AND mem_id=#{mem_id}")
	public int checkBlock(String mem_id);
	//��������
	@Update("UPDATE penalty SET penalty_blockcanceldate=sysdate WHERE mem_id=#{mem_id} AND penalty_blockcanceldate > sysdate")
	public void updateCancelDate(String mem_id);
	
	//���� ��������
	@Select("SELECT * FROM penalty WHERE mem_id = #{mem_id} ORDER BY penalty_regdate DESC")
	public List<PenaltyCommand> reasonView(String mem_id);
	@Select("SELECT count(*) FROM penalty WHERE mem_id = #{mem_id}")
	public int getReasonCount(String mem_id);
	
	public void update(PenaltyCommand penalty);	
	public void delete(Integer penalty_num);
}