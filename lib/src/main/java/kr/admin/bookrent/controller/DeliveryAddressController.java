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
import kr.spring.member.domain.MemberCommand;
import kr.spring.member.service.MemberService;

@Controller
public class DeliveryAddressController {
	private Logger log= Logger.getLogger(this.getClass());

	@Resource
	private AdminBookrentService bookrentService;
	
	@Resource
	private MemberService memberService;
	
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
			ModelAndView mav = new ModelAndView();
			mav.setViewName("deliveryAddress");
			mav.addObject("delivery", delivery);
			MemberCommand member = memberService.selectMember(mem_id);
			mav.addObject("member", member);
			
			if(log.isDebugEnabled()){
				log.debug("delivery : " +delivery);
				log.debug("member : " +member);
				
			}
			return mav;
			
	}
}



