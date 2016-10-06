package kr.admin.bookrent.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.bookrent.domain.AdminBookrentCommand;
import kr.spring.bookrent.service.AdminBookrentService;
import kr.spring.penalty.domain.PenaltyCommand;

@Controller  
public class BookrentPenaltyController {
	private Logger log= Logger.getLogger(this.getClass());
	
	@Resource
	private AdminBookrentService bookrentService;
	
	@RequestMapping("/admin/bookrent/insertPenalty.do")
	public ModelAndView process(@RequestParam("rent_num")int rent_num,
								@RequestParam("rent_status")int rent_status,
								@RequestParam("mem_id")String mem_id,
								@RequestParam("list_title")String list_title,
								@RequestParam("penalty_day")int penalty_day,
								@RequestParam("list_num") int list_num){
		
		if(log.isDebugEnabled()){
			log.debug("rent_num : " +rent_num);
			log.debug("rent_status : " +rent_status);
			log.debug("mem_id : " +mem_id);
			log.debug("list_title : " +list_title);
			log.debug("penalty_day : " +penalty_day);
			log.debug("list_num : " +list_num);
		}
		
		String reason = "["+list_title+"] 을/를 "+penalty_day+"일 연체하여 차단함";
		
		int reserveCount= bookrentService.getReserveCount(list_num);
		
		if(reserveCount>0){//연체 도서반납 & 예약중 -> 대여대기
			//반납
			AdminBookrentCommand bookrent= new AdminBookrentCommand();
			bookrent.setRent_status(rent_status);
			bookrent.setRent_num(rent_num);
			bookrentService.updateBookReturn(bookrent);
			bookrentService.reserveToWaiting(list_num);
			//패널티
			PenaltyCommand penalty =  new PenaltyCommand();
			penalty.setPenalty_day(penalty_day);
			penalty.setMem_id(mem_id);
			penalty.setPenalty_reason(reason);
			bookrentService.insertPenalty(penalty);
		}else{//연체 도서반납
			//반납
			AdminBookrentCommand bookrent= new AdminBookrentCommand();
			bookrent.setRent_status(rent_status);
			bookrent.setRent_num(rent_num);
			bookrentService.updateBookReturn(bookrent);
			//패널티
			PenaltyCommand penalty =  new PenaltyCommand();
			penalty.setPenalty_day(penalty_day);
			penalty.setMem_id(mem_id);
			penalty.setPenalty_reason(reason);
			bookrentService.insertPenalty(penalty);
		}

		return new ModelAndView("redirect:/admin/bookrent/list.do");
	}
}