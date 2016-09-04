package kr.user.speech.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.speech.domain.SpeechCommand;
import kr.spring.speech.domain.SpeechReservationCommand;
import kr.spring.speech.service.SpeechService;

@Controller
public class SpeechReservationInsertController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private SpeechService speechServer;
	
	@Resource
	private SpeechService speechService;
	
	@RequestMapping("/speech/reserveSuccess.do")
	public ModelAndView process(@RequestParam("speech_num") int speech_num,HttpSession session)throws Exception{
		String userId = (String)session.getAttribute("userId");
		
		SpeechReservationCommand command = new SpeechReservationCommand();
		
		
		if(log.isDebugEnabled()){
			log.debug("speechReservationCommand : " + command);
		}
		
		
		if(userId==null){//·Î±×ÀÎ ¾ÈµÊ
			ModelAndView mav = new ModelAndView();
			mav.setViewName("memberLogin");
			return mav;
		}else{//·Î±×ÀÎ µÊ
			command.setMem_id(userId);
			command.setSpeech_num(speech_num);
			speechService.insertReservation(command);
			SpeechCommand speech = speechService.selectSpeech(speech_num);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("reserveSuccess");
			mav.addObject("speech",speech);
			return mav;
		}
	}
}
