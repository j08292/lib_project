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
import kr.spring.util.StringUtil;

@Controller
public class SpeechDetailController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private SpeechService speechService;
	
	@RequestMapping("/speech/detail.do")
	public ModelAndView process(@RequestParam("speech_num") int speech_num,HttpSession session){
		
		if(log.isDebugEnabled()){
			log.debug("speech_num : "+speech_num);
		}
		
		//�ش� ���� ��ȸ�� ����
		speechService.updateHit(speech_num);
		//�ش� ���� ������ Ȯ��
		int res = speechService.countRes(speech_num);
		SpeechCommand speech = speechService.selectSpeech(speech_num);
		
		//Ÿ��Ʋ �±� ����
		speech.setSpeech_title(StringUtil.useNoHtml(speech.getSpeech_title()));
		
		//�ٹٲ� ó��
		speech.setSpeech_content(StringUtil.useBrNoHtml(speech.getSpeech_content()));
		
		//������ �ҷ�����
		String userId = (String)session.getAttribute("userId");
		if(userId==null){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("userSpeechDetail");
			mav.addObject("speech",speech);
			mav.addObject("res",res);
			return mav;
		}else{
			SpeechReservationCommand command = new SpeechReservationCommand();
			command.setSpeech_num(speech_num);
			command.setMem_id(userId);
			SpeechReservationCommand speechReserve = speechService.selectReservation(command);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("userSpeechDetail");
			mav.addObject("speech",speech);
			mav.addObject("speechReserve",speechReserve);
			mav.addObject("res",res);
			return mav;
		}
	}
	
}
