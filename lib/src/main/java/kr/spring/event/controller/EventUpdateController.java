package kr.spring.event.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.spring.event.domain.EventCommand;
import kr.spring.event.service.EventService;
import kr.spring.util.FileUtil;
 
@Controller
@SessionAttributes("command")
public class EventUpdateController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private EventService eventService;
	
	@RequestMapping(value="/event/update.do",method=RequestMethod.GET)
	public String form(@RequestParam("event_num")int event_num, Model model){
		
		EventCommand eventCommand = eventService.selectEvent(event_num);
		model.addAttribute("command", eventCommand);
		
		return "eventModify";
	}
	
	@RequestMapping(value="/event/update.do",method=RequestMethod.POST)
	public String submit(@ModelAttribute("command")
						 @Valid EventCommand eventCommand,
						 BindingResult result,
						 SessionStatus status,
						 HttpSession session)throws Exception{
		
		if(log.isDebugEnabled()){
			log.debug("eventCommand : " + eventCommand);
		}
		
		String userId = (String)session.getAttribute("userId");
		if(!userId.equals(eventCommand.getMem_id())){
			throw new Exception("�α����� ���̵�� �ۼ��� ���� �ƴϱ� ������ ������ �� �����ϴ�.");
		}
		if(result.hasErrors()){
			return "eventModify";
		}
		
		EventCommand event = 
				eventService.selectEvent(eventCommand.getEvent_num());
		String oldFileName = "";
		//���� ���ϸ� ����
		//���ε�Ǵ� ������ ���� ��� ���� ������ ���� ���ο� ���ϸ� ����
		//���ε�Ǵ� ������ ���� ��� ���� ���ϸ� ����
		oldFileName = event.getEvent_filename();
		if(!eventCommand.getEvent_upload().isEmpty()){
			eventCommand.setEvent_filename(FileUtil.rename(eventCommand.getEvent_upload().getOriginalFilename()));
		}else{
			//���۵� ������ ���� ���
			eventCommand.setEvent_filename(oldFileName);
		}
		//�ۼ���
		eventService.update(eventCommand);
		status.setComplete();
		
		if(!eventCommand.getEvent_upload().isEmpty()){
			File file = new File(FileUtil.UPLOAD_PATH+"/"+eventCommand.getEvent_filename());
			eventCommand.getEvent_upload().transferTo(file);
			
			if(oldFileName!=null){
				//�������ϻ���
				FileUtil.removeFile(oldFileName);
			}
		}
		return "redirect:/event/list.do";
	}
}
