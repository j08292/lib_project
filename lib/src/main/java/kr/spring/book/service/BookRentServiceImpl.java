package kr.spring.book.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.book.dao.BookRentMapper;
import kr.spring.book.domain.BookRentCommand;

@Service("bookRentService")
public class BookRentServiceImpl implements BookRentService {

	@Resource
	private BookRentMapper bookRentMapper;
	
	@Override
	public void insert(BookRentCommand bookRentCommand) {
		bookRentMapper.insert(bookRentCommand);
	}

	@Override
	public List<BookRentCommand> list(String mem_id) {
		return bookRentMapper.list(mem_id);
	}

	@Override
	public int getRowCount(String mem_id) {
		return bookRentMapper.getRowCount(mem_id);
	}

	@Override
	public BookRentCommand selectRent(int rent_num) {
		return bookRentMapper.selectRent(rent_num);
	}

	@Override
	public BookRentCommand selectRentId(String mem_id) {
		return bookRentMapper.selectRentId(mem_id);
	}

	@Override
	public void updateOrder(BookRentCommand bookRentCommand) {
		bookRentMapper.updateOrder(bookRentCommand);
	}

	@Override
	public List<BookRentCommand> selectReserveId(String reserveId) {
		return bookRentMapper.selectReserveId(reserveId);
	}

	@Override
	public void updateReserveDate(int list_num) {
		bookRentMapper.updateReserveDate(list_num);
	}

	@Override
	public void updateReserveDateCancel(int rent_num) {
		bookRentMapper.updateReserveDateCancel(rent_num);
	}

}
