package kr.spring.member.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.service.MemberService;
import kr.spring.speech.domain.SpeechReservationCommand;
import kr.spring.speech.service.SpeechService;
import kr.spring.util.PagingUtil;

@Controller
public class MemberMyOrderSController {
	private Logger log = Logger.getLogger(this.getClass());

	private int rowCount = 10;
	private int pageCount = 10;

	@Resource
	private MemberService memberService;

	@Resource
	private SpeechService speechService;
	
	@RequestMapping(value = "/member/myOrderS.do", method=RequestMethod.GET )
	public ModelAndView form(HttpSession session, HttpServletRequest request,
			@RequestParam(value="pageNum",defaultValue="1") 
				int currentPage){
		
		String mem_id = (String)session.getAttribute("userId");
		String status = request.getParameter("speech_reserve_status");
		int reserve_status;
		
		if(status == null){
			reserve_status = 9;
		}else{
			reserve_status = Integer.parseInt(status);
		}
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		int count = speechService.getRowCount_cih(mem_id);
		
		PagingUtil page = new PagingUtil(currentPage,
                count,rowCount,pageCount,"myOrderS.do");
		
		map.put("mem_id", mem_id);
		map.put("reserve_status", reserve_status);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<SpeechReservationCommand> speechReservationCommand = null;
		
		if(count > 0 ){
			speechReservationCommand = speechService.speech_list_cih(map);
		}else{
			speechReservationCommand = Collections.emptyList();
		}
		
		if(log.isDebugEnabled()){
			log.debug("count : " + count);
			log.debug("speechCommand : " + speechReservationCommand);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberMyOrderS");
		mav.addObject("count", count);
		mav.addObject("speechReservationCommand", speechReservationCommand);
		mav.addObject("pagingHtml", page.getPagingHtml());
		return mav;
	}

}



