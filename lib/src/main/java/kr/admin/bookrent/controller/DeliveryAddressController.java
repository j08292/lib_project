package kr.admin.bookrent.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.book.domain.DeliveryCommand;
import kr.spring.bookrent.service.AdminBookrentService;

@Controller
public class DeliveryAddressController {
	private Logger log= Logger.getLogger(this.getClass());

	@Resource
	private AdminBookrentService bookrentService;
	
	@RequestMapping("/admin/bookrent/delivery.do")
	public ModelAndView process(@RequestParam("rent_num") int rent_num){
		if(log.isDebugEnabled()){
			log.debug("rent_num : " +rent_num);
		}
		
		DeliveryCommand delivery = bookrentService.selectDelivery(rent_num);
		
		return new ModelAndView("deliveryAddress","delivery",delivery);
		
	}
}
