package kr.admin.bookrent.controller;

import java.sql.Date;

//import java.sql.Date;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.bookrent.domain.BookrentCommand;
import kr.spring.bookrent.service.BookrentService;

@Controller
@SessionAttributes("command")
public class BookrentUpdateRentController {
	private Logger log= Logger.getLogger(this.getClass());

	@Resource
	private BookrentService bookrentService;
	
	@RequestMapping("/admin/bookrent/updateRent.do")
	public ModelAndView process(@RequestParam("rent_num") int rent_num,
								@RequestParam("rent_status") int rent_status,
								@RequestParam("rent_regdate") Date rent_regdate){
		if(log.isDebugEnabled()){
			log.debug("rent_num : " +rent_num);
			log.debug("rent_status : " +rent_status);
			log.debug("rent_regdate : " +rent_regdate);
		}

		BookrentCommand bookrent = new BookrentCommand();
		bookrent.setRent_num(rent_num);
		bookrent.setRent_status(rent_status);
		bookrent.setRent_regdate(rent_regdate);
		bookrentService.updateStatusChange(bookrent);
		bookrentService.updateStatusChange(bookrent);

		return new ModelAndView("redirect:/admin/bookrent/list.do");
	}
}