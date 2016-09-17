package kr.spring.bookrent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.spring.bookrent.domain.BookrentCommand;
import kr.spring.member.domain.MemberCommand;

@Repository
public interface BookrentMapper {
	public List<BookrentCommand> list(Map<String, Object> map);
	public int getRowCount(Map<String, Object> map);	
	public void insert(BookrentCommand bookrent);
	public BookrentCommand selectBookrent(Integer rent_num);
	public void update(BookrentCommand bookrent);
	@Update("UPDATE bookrent SET rent_status=#{rent_status} WHERE rent_num=#{rent_num}")
	public void updateStatusChange(BookrentCommand bookrent);
	@Update("UPDATE member SET mem_penalty=#{mem_penalty} WHERE mem_id=#{mem_id}")
	public void updatePenalty(MemberCommand member);
	@Update("UPDATE bookrent SET rent_regdate=sysdate WHERE rent_num=#{rent_num}")
	public void updateBookRent(BookrentCommand bookrent);
	public void delete(Integer rent_num);
}