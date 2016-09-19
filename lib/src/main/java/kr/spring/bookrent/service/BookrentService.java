package kr.spring.bookrent.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.bookrent.domain.BookrentCommand;
import kr.spring.member.domain.MemberCommand;

@Transactional
public interface BookrentService {
	//관리자 도서 대출
	@Transactional(readOnly=true)
	public List<BookrentCommand> list(Map<String, Object> map);
	@Transactional(readOnly=true)
	public int getRowCount(Map<String, Object> map);
	public int getReserveCount(Integer list_num);
	public void updateStatusChange(BookrentCommand bookrent);
	public void reserveToWaiting(Integer list_num);
	public void updatePenalty(MemberCommand member);
	public void updateBookRent(BookrentCommand bookrent);
}