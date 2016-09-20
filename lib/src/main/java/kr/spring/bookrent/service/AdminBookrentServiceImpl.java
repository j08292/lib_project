package kr.spring.bookrent.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.bookrent.dao.AdminBookrentMapper;
import kr.spring.bookrent.domain.AdminBookrentCommand;
import kr.spring.member.domain.MemberCommand;

@Service("bookrentService")
public class AdminBookrentServiceImpl implements AdminBookrentService{

	@Resource
	private AdminBookrentMapper bookrentMapper;
	
	@Override
	public List<AdminBookrentCommand> list(Map<String, Object> map) {
		return bookrentMapper.list(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return bookrentMapper.getRowCount(map);
	}
	
	@Override
	public int getReserveCount(Integer list_num) {		
		return bookrentMapper.getReserveCount(list_num);
	}
	
	@Override
	public void updateStatusChange(AdminBookrentCommand bookrent) {
		bookrentMapper.updateStatusChange(bookrent);
	}
	
	@Override
	public void reserveToWaiting(Integer list_num) {
		bookrentMapper.reserveToWaiting(list_num);
	}
	
	@Override
	public void updatePenalty(MemberCommand member) {
		bookrentMapper.updatePenalty(member);
	}
	
	@Override
	public void updateBookRent(AdminBookrentCommand bookrent) {
		bookrentMapper.updateBookRent(bookrent);
	}
}