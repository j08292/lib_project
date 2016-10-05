package kr.admin.bookrent.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.book.domain.DeliveryCommand;
import kr.spring.bookrent.domain.AdminBookrentCommand;
import kr.spring.bookrent.service.AdminBookrentService;

@Controller
public class DeliveryAddressController {
	private Logger log= Logger.getLogger(this.getClass());

	@Resource
	private AdminBookrentService bookrentService;
	
	@RequestMapping("/admin/bookrent/delivery.do")
	public ModelAndView process(@RequestParam("rent_num") int rent_num,
								@RequestParam("list_num") int list_num,
								@RequestParam("mem_id") String mem_id){
		if(log.isDebugEnabled()){
			log.debug("rent_num : " +rent_num);
			log.debug("list_num : " +list_num);
			log.debug("mem_id : " +mem_id);
		}
		AdminBookrentCommand bookrent = new AdminBookrentCommand();
		bookrent.setRent_num(rent_num);
		bookrent.setList_num(list_num);
		bookrent.setMem_id(mem_id);
		DeliveryCommand delivery = bookrentService.selectDelivery(bookrent);
		
		return new ModelAndView("deliveryAddress","delivery",delivery);
		
	}
}
