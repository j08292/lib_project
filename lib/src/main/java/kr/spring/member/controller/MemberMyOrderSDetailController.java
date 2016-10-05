package kr.spring.member.controller;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.book.domain.BookListCommand;
import kr.spring.book.domain.BookRentCommand;
import kr.spring.book.domain.DeliveryCommand;
import kr.spring.book.service.BookListService;
import kr.spring.book.service.BookRentService;
import kr.spring.book.service.DeliveryService;
import kr.spring.member.domain.MemberCommand;
import kr.spring.member.service.MemberService;
import kr.spring.speech.domain.SpeechCommand;
import kr.spring.speech.domain.SpeechReservationCommand;
import kr.spring.speech.service.SpeechService;

@Controller
public class MemberMyOrderSDetailController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private MemberService memberService;

	@Resource
	private BookListService bookListService;

	@Resource
	private BookRentService bookRentService;

	@Resource
	private SpeechService speechService;

	@RequestMapping(value = "/member/myOrderSDetail.do", method = RequestMethod.GET)
	public ModelAndView form(HttpSession session,
			@RequestParam(value = "speech_reserve_num") Integer speech_reserve_num) {

		String mem_id = (String) session.getAttribute("userId");

		MemberCommand memberCommand = new MemberCommand();
		memberCommand = memberService.selectMember(mem_id);

		SpeechReservationCommand speechReservationCommand = new SpeechReservationCommand();
		speechReservationCommand = speechService.selectSpeechResNum_cih(speech_reserve_num);

		if (log.isDebugEnabled()) {
			log.debug("speech_reserve_num : " + speech_reserve_num);
			log.debug("memberCommand : " + memberCommand);
			log.debug("speechReservationCommand : " + speechReservationCommand);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberMyOrderSDetail");
		mav.addObject("member", memberCommand);
		mav.addObject("speech", speechReservationCommand);

		return mav;
	}

}
