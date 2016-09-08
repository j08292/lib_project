package kr.spring.marathon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.spring.marathon.domain.MarathonCommand;

@Repository
public interface MarathonMapper {
	//특정 회원이 대출했던 목록
	public List<MarathonCommand> rentedList(Map<String, Object> map);
	public int getRowCount(Map<String , Object> map);
	//특정 회원 마라톤 누적시킬 목록
	public List<MarathonCommand> pageList(String mem_id);
	@Update("UPDATE member SET mrt_status = 1 WHERE mem_id=#{mem_id}")
	public void updateMrtStatus(String mem_id);
	
}
