package kr.spring.event.controller;

import java.io.File;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.event.domain.EventCommand;
import kr.spring.event.service.EventService;
import kr.spring.util.FileUtil;
import kr.spring.util.StringUtil;

@Controller
public class EventDetailController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private EventService eventService;
	
	@RequestMapping("/event/detail.do")
	public ModelAndView process(@RequestParam("event_num")int event_num){
		if(log.isDebugEnabled()){
			log.debug("event_num : " + event_num);
		}
		//�ش� ���� ��ȸ�� ����
		eventService.updateHit(event_num);
		EventCommand event = eventService.selectEvent(event_num);
		
		//Ÿ��Ʋ �±� ����
		event.setEvent_title(StringUtil.useNoHtml(event.getEvent_title()));
		
		//�ٹٲ�ó��
		event.setEvent_content(StringUtil.useBrNoHtml(event.getEvent_content()));
		
		return new ModelAndView("eventView","event",event);
	}
	
	//������� ������ ���߿� ����ϰ� �ɰ�츦 ���ؼ� �ٿ�ε� �κ��� �ۼ���
	@RequestMapping("/event/file.do")
	public ModelAndView download(@RequestParam("event_filename")
								 String event_filename)throws Exception{
		File downloadFile = new File(FileUtil.UPLOAD_PATH+"/"+event_filename);
		return new ModelAndView("downloadView","downloadFile",downloadFile);
	}
	
}
