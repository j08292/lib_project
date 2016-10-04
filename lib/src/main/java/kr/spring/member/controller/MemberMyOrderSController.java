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

import kr.spring.book.domain.BookRentCommand;
import kr.spring.book.domain.DeliveryCommand;
import kr.spring.book.service.BookListService;
import kr.spring.book.service.BookRentService;
import kr.spring.book.service.DeliveryService;
import kr.spring.member.service.MemberService;
import kr.spring.util.PagingUtil;

@Controller
public class MemberMyOrderSController {
	private Logger log = Logger.getLogger(this.getClass());

	private int rowCount = 10;
	private int pageCount = 10;

	@Resource
	private MemberService memberService;

	@Resource
	private BookListService bookListService;

	@Resource
	private BookRentService bookRentService;

	@RequestMapping(value = "/member/myOrderS.do", method=RequestMethod.GET )
	public ModelAndView form(HttpSession session, HttpServletRequest request,
			@RequestParam(value="pageNum",defaultValue="1") 
				int currentPage){
		
		String mem_id = (String)session.getAttribute("userId");
		
		HashMap<String,Object> map = new HashMap<String,Object>();

		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberMyOrderS");
		return mav;
	}

}



