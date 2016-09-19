package kr.spring.marathon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
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
	
	//marathon���̺� ����(�������� ��û�� �߰�)
	@Insert("INSERT INTO marathon(marathon_num,mem_id,marathon_page,marathon_regdate,marathon_status) VALUES (marathon_seq.nextval, #{mem_id},#{marathon_page},sysdate,0)")
	public void insert(MarathonCommand marathon);
	
	//member���̺��� mrt_status ����
	@Update("UPDATE member SET mrt_status = 1 WHERE mem_id=#{mem_id}")
	public void applyMrtStatus(String mem_id);
	@Update("UPDATE member SET mrt_status = 2 WHERE mem_id=#{mem_id}")
	public void finishMrtStatus(String mem_id);
	
	//�������ʿ��� ���� ������ ����Ʈ
	public List<MarathonCommand> finishList(Map<String, Object> map);
	public int getFinishRowCount(Map<String , Object> map);
	@Update("UPDATE marathon SET marathon_status = #{marathon_status} WHERE marathon_num=#{marathon_num}")
	public void updateStatus(MarathonCommand marathon);
}
