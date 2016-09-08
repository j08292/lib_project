package kr.spring.marathon.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.marathon.dao.MarathonMapper;
import kr.spring.marathon.domain.MarathonCommand;
import kr.spring.member.domain.MemberCommand;

@Service("marathonService")
public class MarathonServiceImpl implements MarathonService{

	@Resource
	private MarathonMapper marathonMapper;
	
	@Override
	public List<MarathonCommand> rentedList(Map<String, Object> map) {
		return marathonMapper.rentedList(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return marathonMapper.getRowCount(map);
	}

	@Override
	public List<MarathonCommand> pageList(String mem_id) {
		return marathonMapper.pageList(mem_id);
	}

	@Override
	public void updateMrtStatus(String mem_id) {
		marathonMapper.updateMrtStatus(mem_id);
	}
	
}
