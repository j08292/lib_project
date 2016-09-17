package kr.spring.bookrent.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.bookrent.dao.BookrentMapper;
import kr.spring.bookrent.domain.BookrentCommand;
import kr.spring.member.domain.MemberCommand;

@Service("bookrentService")
public class BookrentServiceImpl implements BookrentService{

	@Resource
	private BookrentMapper bookrentMapper;
	
	@Override
	public List<BookrentCommand> list(Map<String, Object> map) {
		return bookrentMapper.list(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return bookrentMapper.getRowCount(map);
	}

	@Override
	public void insert(BookrentCommand bookrent) {
		
	}

	@Override
	public BookrentCommand selectBookrent(Integer rent_num) {
		return null;
	}

	@Override
	public void update(BookrentCommand bookrent) {
		
	}
	
	@Override
	public void updateStatusChange(BookrentCommand bookrent) {
		bookrentMapper.updateStatusChange(bookrent);
	}
	
	@Override
	public void updatePenalty(MemberCommand member) {
		bookrentMapper.updatePenalty(member);
	}
	
	@Override
	public void updateBookRent(BookrentCommand bookrent) {
		bookrentMapper.updateBookRent(bookrent);
	}
	
	@Override
	public void delete(Integer rent_num) {
		
	}
}