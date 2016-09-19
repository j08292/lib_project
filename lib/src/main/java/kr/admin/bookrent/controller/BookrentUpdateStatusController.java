package kr.admin.bookrent.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.bookrent.domain.BookrentCommand;
import kr.spring.bookrent.service.BookrentService;

@Controller
public class BookrentUpdateStatusController {
	private Logger log= Logger.getLogger(this.getClass());

	@Resource
	private BookrentService bookrentService;
	
	@RequestMapping("/admin/bookrent/updateStatus.do")
	public ModelAndView process(@RequestParam("rent_num") int rent_num,
								@RequestParam("rent_status") int rent_status,
								@RequestParam("list_num") int list_num){
		if(log.isDebugEnabled()){
			log.debug("rent_num : " +rent_num);
			log.debug("rent_status : " +rent_status);
			log.debug("list_num : " +list_num);
		}
		
		int reserveCount= bookrentService.getReserveCount(list_num);

		if(reserveCount>0){
			BookrentCommand bookrent = new BookrentCommand();
			bookrent.setRent_num(rent_num);
			bookrent.setRent_status(rent_status);
			bookrentService.updateStatusChange(bookrent);		
			bookrentService.reserveToWaiting(list_num);
		}else{
			BookrentCommand bookrent = new BookrentCommand();
			bookrent.setRent_num(rent_num);
			bookrent.setRent_status(rent_status);
			bookrentService.updateStatusChange(bookrent);
		}
		
		return new ModelAndView("redirect:/admin/bookrent/list.do");
	}
}