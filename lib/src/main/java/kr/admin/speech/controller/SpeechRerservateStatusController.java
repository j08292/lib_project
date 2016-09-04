package kr.admin.speech.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.speech.service.SpeechService;

//검색창PagingUtil보고 수정하기
@Controller
public class SpeechRerservateStatusController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private SpeechService speechService;
	
	@RequestMapping("/admin/speech/updateReserve.do")
	public String submit(@RequestParam("speech_reserve_num") int speech_reserve_num,
						 @RequestParam("status") int status,
						 @RequestParam("speech_num") int speech_num){
		if(log.isDebugEnabled()){
			log.debug("speech_reserve_num : " +speech_reserve_num);
			log.debug("status : " +status);
		}
		speechService.updateReservation(speech_reserve_num);
		
		return "redirect:/admin/speech/reservationList.do?speech_num=" + speech_num;
		
	}
}
