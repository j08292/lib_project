package kr.spring.speech.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import kr.spring.speech.domain.SpeechCommand;

@Repository
public interface SpeechMapper {
	public List<SpeechCommand> list(Map<String, Object> map);
	public int getRowCount(Map<String , Object> map);
	@Insert("INSERT INTO speech(speech_num,speech_title,speech_content,speech_regdate,speech_people,speech_date,speech_location,speech_price,mem_id) VALUES (speech_num.nextval, #{speech_title},#{speech_content},sysdate,#{speech_people},#{speech_date},#{speech_location},#{speech_price},#{mem_id})")
	public void insert(SpeechCommand speech);
	@Select("SELECT * FROM speech WHERE speech_num = #{speech_num}")
	public SpeechCommand selectSpeech(Integer speech_num);
	@Update("UPDATE speech SET speech_hit = speech_hit+1 WHERE speech_num = #{speech_num}")
	public void updateHit(Integer speech_num);
	public void update(SpeechCommand speech);
	public void delete(Integer speech_num);
	@Select("SELECT count(sr.speech_num) FROM speech s, speech_reservation sr WHERE s.speech_num = sr.speech_num and s.speech_num=#{speech_num}")
	public int selectRes(Integer speech_num);
}
