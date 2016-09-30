package kr.spring.book.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.book.domain.BasketCommand;
import kr.spring.book.domain.BookListCommand;
import kr.spring.book.domain.BookRentCommand;
import kr.spring.book.domain.DeliveryCommand;
import kr.spring.book.service.BasketService;
import kr.spring.book.service.BookListService;
import kr.spring.book.service.BookRentService;
import kr.spring.book.service.DeliveryService;
import kr.spring.member.domain.MemberCommand;
import kr.spring.member.service.MemberService;

@Controller
public class BookUnmannedController {
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
	
	@RequestMapping(value = "/book/unmanned.do", method = RequestMethod.GET)
	public ModelAndView form(HttpSession session, 
			@RequestParam(value="list_num") int list_num){
		
		String userId = (String) session.getAttribute("userId");
			
		BookListCommand book = bookListService.select_num(list_num);
		
		if(log.isDebugEnabled()){
			log.debug("userId : " + userId);
			log.debug("book : " + book );
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bookUnmanned");
		mav.addObject("book", book);
		return mav;
	}
	

	@RequestMapping(value = "/book/unmanned.do", method = RequestMethod.POST)
	public String submit(HttpSession session, SessionStatus status, 
			HttpServletRequest request) {
		
		String userId = (String) session.getAttribute("userId");
		int list_num = Integer.parseInt(request.getParameter("list_num"));
		String loc = request.getParameter("textValue");
		
		if(log.isDebugEnabled()){
			log.debug("loc : " + loc);
		}
		
		BookRentCommand rentCommand = new BookRentCommand();
		List<BookRentCommand> rentCommand2 = null;

		rentCommand2 = bookRentService.selectList(list_num);
		
		int st = bookRentService.recentStatus(list_num);
		
		rentCommand.setList_num(list_num);
		rentCommand.setMem_id(userId);
		bookRentService.insert(rentCommand);
		
		MemberCommand member = memberService.selectMember(userId);
		DeliveryCommand delivery = new DeliveryCommand();
		delivery.setDelivery_address(loc);
		delivery.setSample3_postcode("");
		delivery.setDelivery_cell(member.getMem_cell());
		delivery.setDelivery_email(member.getMem_email());
		delivery.setDelivery_name(member.getMem_name());
		delivery.setMem_id(userId);
		delivery.setDelivery_status(1);
		deliveryService.insert(delivery);
		
		if(log.isDebugEnabled()){  
			log.debug("list_num : " + list_num);
		}
		
		return "redirect:/member/myOrder.do";
	}

}

