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
	public List<PenaltyCommand> list(Map<String, Object> map);
	public int getRowCount(Map<String, Object> map);	
	@Insert("INSERT INTO penalty(penalty_num, penalty_regdate, penalty_blockcanceldate, mem_id, penalty_reason) VALUES (penalty_num.nextval,sysdate,to_date(99991231,'yyyymmdd'),#{mem_id},#{penalty_reason} )")
	public void insert(PenaltyCommand penalty);
	@Select("SELECT count(*) FROM penalty WHERE penalty_blockcanceldate > sysdate AND mem_id=#{mem_id}")
	public int checkBlock(String mem_id); //아직 차단회원일경우 1, 아니면 0
	@Update("UPDATE penalty SET penalty_blockcanceldate=sysdate WHERE mem_id=#{mem_id} AND penalty_blockcanceldate > sysdate")
	public void updateCancelDate(String mem_id);
	
	
	
	public PenaltyCommand selectPenalty(Integer penalty_num);
	public void update(PenaltyCommand penalty);	
	public void delete(Integer penalty_num);
}