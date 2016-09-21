package kr.spring.adminMember.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.adminMember.domain.AdminMemberCommand;

@Transactional
public interface AdminMemberService {
	@Transactional(readOnly=true)
	public List<AdminMemberCommand> list(Map<String, Object> map);
	@Transactional(readOnly=true)
	public int getRowCount(Map<String, Object> map);
	public List<AdminMemberCommand> blockList(Map<String, Object> map);
	public int getBlockRowCount(Map<String,Object> map);
}