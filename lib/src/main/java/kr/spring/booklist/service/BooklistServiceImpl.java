package kr.spring.booklist.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.booklist.dao.BooklistMapper;
import kr.spring.booklist.domain.BooklistCommand;

@Service("booklistService")
public class BooklistServiceImpl implements BooklistService{
	
	@Resource
	private BooklistMapper booklistMapper;
	
	@Override
	public List<BooklistCommand> list(Map<String, Object> map) {
		return booklistMapper.list(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return booklistMapper.getRowCount(map);
	}

	@Override
	public void insert(BooklistCommand booklist) {
		booklistMapper.insert(booklist);
	}

	@Override
	public BooklistCommand selectBooklist(Integer list_num) {
		return booklistMapper.selectBooklist(list_num);
	}

	@Override
	public void update(BooklistCommand booklist) {
		booklistMapper.update(booklist);
	}

	@Override
	public void updateStatusChange(Integer list_num) {
		booklistMapper.updateStatusChange(list_num);
	}
}