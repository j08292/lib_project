package kr.spring.booklist.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.spring.booklist.domain.BooklistCommand;

@Transactional
public interface BooklistService {
	@Transactional(readOnly=true)
	public List<BooklistCommand> list(Map<String, Object> map);
	@Transactional(readOnly=true)
	public int getRowCount(Map<String, Object> map);
	public void insert(BooklistCommand booklist);
	@Transactional(readOnly=true)
	public BooklistCommand selectBooklist(Integer list_num);
	public void update(BooklistCommand booklist);
	public void updateStatusChange(BooklistCommand booklist);
}