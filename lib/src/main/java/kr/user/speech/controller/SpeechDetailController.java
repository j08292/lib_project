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
	public ModelAndView process(@RequestParam("speech_num") int speech_num){
		
		if(log.isDebugEnabled()){
			log.debug("speech_num : "+speech_num);
		}
		
		//�ش� ���� ��ȸ�� ����
		speechService.updateHit(speech_num);
		//�ش� ���� ������ Ȯ��
		int res = speechService.selectRes(speech_num);
		SpeechCommand speech = speechService.selectSpeech(speech_num);
		
		//Ÿ��Ʋ �±� ����
		speech.setSpeech_title(StringUtil.useNoHtml(speech.getSpeech_title()));
		
		//�ٹٲ� ó��
		speech.setSpeech_content(StringUtil.useBrNoHtml(speech.getSpeech_content()));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userSpeechDetail");
		mav.addObject("speech",speech);
		mav.addObject("res",res);
		return mav;
	}
	
}
