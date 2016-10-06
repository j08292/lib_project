package kr.spring.book.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.book.domain.BasketCommand;
import kr.spring.book.domain.BookRentCommand;
import kr.spring.book.domain.DeliveryCommand;
import kr.spring.book.service.BasketService;
import kr.spring.book.service.BookListService;
import kr.spring.book.service.BookRentService;
import kr.spring.book.service.DeliveryService;
import kr.spring.member.domain.MemberCommand;
import kr.spring.member.service.MemberService;

@Controller
public class BookRentController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private BookListService bookListService;
	
	@Resource
	private BookRentService bookRentService;
	
	@Resource
	private BasketService basketService;
	
	@Resource
	private DeliveryService deliveryService;
	
	// 커맨드 객체 초기화
		@ModelAttribute("command")
		public DeliveryCommand initCommand() {
			return new DeliveryCommand();
		}
	
	@RequestMapping(value = "/book/rent.do", method = RequestMethod.GET)
	public ModelAndView form(HttpSession session){
		String userId = (String) session.getAttribute("userId");

		List<BasketCommand> list = null;
		list = basketService.select_book_basket(userId);
		
		if(log.isDebugEnabled()){
			log.debug("userId : " + userId);
			log.debug("list : " + list);
		}
		
		int num = basketService.getRowCount(userId);
		int price = num*1000;
		int total = 0;
		
		if(num>=5){
			total = price;
		}else{
			total =price+2000; 
		}
		
		MemberCommand member = memberService.selectMember(userId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bookRent");
		mav.addObject("member", member);
		mav.addObject("list", list);
		mav.addObject("num",num);
		mav.addObject("price", price);
		mav.addObject("total", total);
		return mav;
	}
	

	@RequestMapping(value = "/book/rent.do", method = RequestMethod.POST)
	public String submit(HttpSession session, SessionStatus status,
			@ModelAttribute("command") @Valid DeliveryCommand deliveryCommand, BindingResult result) {
		
		String userId = (String) session.getAttribute("userId");

		List<BasketCommand> list = null;
		list = basketService.select_book_basket(userId);

		BookRentCommand bookRentCommand = new BookRentCommand();
		
		int num = 0;
		String rnum = null;
		String lnum = null;
		String list_num = null;
		String rent_num = null;
		String list_str = "";
		String rent_str = "";
		
		for (int i = 0; i < list.size(); i++) {
			
			bookRentCommand.setList_num(list.get(i).getList_num());
			bookRentCommand.setMem_id(userId);
			bookRentCommand.setRent_status(3);

			bookRentService.insert(bookRentCommand);
			basketService.delete(list.get(i).getBasket_num());
			num = bookRentService.recentRent_num(list.get(i).getList_num());
			
			if (log.isDebugEnabled()) {
				log.debug("num : " + num);
			}
			
			list_num = null;
			rent_num = null;
			
			num = bookRentService.recentRent_num(list.get(i).getList_num());
			
			deliveryCommand.setList_num(list.get(i).getList_num());
			deliveryCommand.setRent_num(num);

			lnum = Integer.toString(list.get(i).getList_num());
			rnum = Integer.toString(num);
			
			list_str += lnum + ","; 
			rent_str += rnum + ",";

			if (log.isDebugEnabled()) {
				log.debug("lnum : " + lnum);
				log.debug("rnum : " + rnum);
				log.debug("list_num : " + list_num);
				log.debug("rent_num : " + rent_num);
				log.debug("str : " + list_str); 
			}
			
		}
		
			deliveryCommand.setMem_id(userId);
			deliveryCommand.setString_rentnum(rent_str);
			deliveryCommand.setString_listnum(list_str);
			deliveryCommand.setDelivery_status(0);
		
			deliveryService.insert(deliveryCommand);

		if (log.isDebugEnabled()) {
			log.debug("list.size(): " + list.size());
			log.debug("userId : " + userId);
			log.debug("deliveryCommand : " + deliveryCommand);
			log.debug("list : " + list);
		}
		
		return "redirect:/member/myOrder.do";
	}

}

