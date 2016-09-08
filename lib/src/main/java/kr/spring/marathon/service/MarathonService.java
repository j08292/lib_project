package kr.spring.marathon.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.marathon.domain.MarathonCommand;
import kr.spring.member.domain.MemberCommand;

@Transactional
public interface MarathonService {
	//특정 회원이 대출했던 목록
	public List<MarathonCommand> rentedList(Map<String, Object> map);
	public int getRowCount(Map<String , Object> map);
	//특정 회원 마라톤 누적시킬 목록
	public List<MarathonCommand> pageList(String mem_id);
	public void updateMrtStatus(String mem_id);		
}
