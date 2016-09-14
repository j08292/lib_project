package kr.spring.bookrent.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.bookrent.domain.BookrentCommand;
import kr.spring.member.domain.MemberCommand;

@Transactional
public interface BookrentService {
	@Transactional(readOnly=true)
	public List<BookrentCommand> list(Map<String, Object> map);
	@Transactional(readOnly=true)
	public int getRowCount(Map<String, Object> map);	
	public void insert(BookrentCommand bookrent);
	@Transactional(readOnly=true)
	public BookrentCommand selectBookrent(Integer rent_num);
	public void update(BookrentCommand bookrent);
	public void updateStatusChange(BookrentCommand bookrent);
	public void updatePenalty(MemberCommand member);
	public void delete(Integer rent_num);
}