package kr.spring.event.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.event.dao.EventMapper;
import kr.spring.event.domain.EventCommand;
import kr.spring.event.domain.EventReplyCommand;
  
@Service("eventService")
public class EventServiceImpl implements EventService{
	
	@Resource
	private EventMapper eventMapper;
	
	@Override
	public List<EventCommand> list(Map<String, Object> map) {
		return eventMapper.list(map);
	}

	@Override
	public int getRowCount(Map<String, Object> map) {
		return eventMapper.getRowCount(map);
	}

	@Override
	public void insert(EventCommand event) {
		eventMapper.insert(event);
		
	}

	@Override
	public EventCommand selectEvent(Integer event_num) {
		return eventMapper.selectEvent(event_num);
	}

	@Override
	public void updateHit(Integer event_num) {
		eventMapper.updateHit(event_num);		
	}

	@Override
	public void update(EventCommand event) {
		eventMapper.update(event);
	}

	@Override
	public void delete(Integer event_num) {
		eventMapper.delete(event_num);		
	}

	//´ñ±Û
	@Override
	public List<EventReplyCommand> listReply(Map<String, Object> map) {
		return eventMapper.listReply(map);
	}

	@Override
	public int getRowCountReply(Map<String, Object> map) {
			System.out.println(map);
		return eventMapper.getRowCountReply(map);
	}

	@Override
	public void insertReply(EventReplyCommand eventReply) {
		eventMapper.insertReply(eventReply);
		
	}

	@Override
	public void updateReply(EventReplyCommand eventReply) {
		eventMapper.updateReply(eventReply);
		
	}

	@Override
	public void deleteReply(Integer event_re_num) {
		eventMapper.deleteReply(event_re_num);
	}
	
}
