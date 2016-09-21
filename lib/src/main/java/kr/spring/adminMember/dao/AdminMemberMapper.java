package kr.spring.adminMember.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.spring.adminMember.domain.AdminMemberCommand;

@Repository
public interface AdminMemberMapper {
	public List<AdminMemberCommand> list(Map<String, Object> map);
	public int getRowCount(Map<String, Object> map);
	
	//����ȸ�����
	public List<AdminMemberCommand> blockList(Map<String, Object> map);
	public int getBlockRowCount(Map<String,Object> map);
}