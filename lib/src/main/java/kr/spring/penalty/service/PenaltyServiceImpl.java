package kr.spring.penalty.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.penalty.dao.PenaltyMapper;
import kr.spring.penalty.domain.PenaltyCommand;

@Service("penaltyService")
public class PenaltyServiceImpl implements PenaltyService{

	@Resource
	private PenaltyMapper penaltyMapper;
	
	@Override
	public List<PenaltyCommand> list(Map<String, Object> map) {
		return null;
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return 0;
	}

	@Override
	public void insert(PenaltyCommand penalty) {
		penaltyMapper.insert(penalty);
	}
	
	@Override
	public void updateCancelDate(String mem_id) {
		penaltyMapper.updateCancelDate(mem_id);
	}

	@Override
	public PenaltyCommand selectPenalty(Integer penalty_num) {
		return null;
	}

	@Override
	public void update(PenaltyCommand penalty) {
		
	}

	@Override
	public void delete(Integer penalty_num) {
		
	}

	
}