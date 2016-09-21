package kr.spring.event.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.event.domain.EventCommand;
import kr.spring.event.service.EventService;
import kr.spring.util.FileUtil;

@Controller
public class EventDeleteController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private EventService eventService;
	
	@RequestMapping("/event/delete.do")
	public String submit(@RequestParam("event_num")int event_num,
						  HttpSession session)throws Exception{
		
		if(log.isDebugEnabled()){
			log.debug("event_num : " + event_num);
		}
		
		EventCommand eventCommand = eventService.selectEvent(event_num);
		String userId = (String)session.getAttribute("userId");
		if(!userId.equals(eventCommand.getMem_id())){
			throw new Exception("�α����� ���̵�� �ۼ��� ���� �ƴϱ⶧���� ������ �� �����ϴ�.");
		}
		//�ۻ���
		eventService.delete(eventCommand.getEvent_num());
		
		//���ϻ��� ���� üũ
		if(eventCommand.getEvent_filename()!=null){
			FileUtil.removeFile(eventCommand.getEvent_filename());
		}
		return "redirect:/event/list.do";
	}
}
