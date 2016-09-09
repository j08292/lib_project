package kr.spring.admin.dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {
	@Select("SELECT count(*) FROM speech_reservation WHERE speech_reserve_status=0 or speech_reserve_status=2")
	public int getSpeechReserveCount();
}
