package kr.spring.marathon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.spring.marathon.domain.MarathonCommand;

@Repository
public interface MarathonMapper {
	//Ư�� ȸ���� �����ߴ� ���
	public List<MarathonCommand> rentedList(Map<String, Object> map);
	public int getRowCount(Map<String , Object> map);
	//Ư�� ȸ�� ������ ������ų ���
	public List<MarathonCommand> pageList(String mem_id);
	@Update("UPDATE member SET mrt_status = 1 WHERE mem_id=#{mem_id}")
	public void updateMrtStatus(String mem_id);
	
}
