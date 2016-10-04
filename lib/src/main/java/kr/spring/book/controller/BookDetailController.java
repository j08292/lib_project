package kr.spring.book.controller;



import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.book.domain.BookListCommand;
import kr.spring.book.domain.BookRentCommand;
import kr.spring.book.service.BookListService;
import kr.spring.book.service.BookRentService;

@Controller
public class BookDetailController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private BookRentService bookRentService;
	
	@Resource
	private BookListService bookListService;

	@RequestMapping("/book/detail.do" )
	public ModelAndView process(HttpSession session,
								@RequestParam(value="list_title") String list_title,
								@RequestParam(value="list_filename") String list_filename,
								@RequestParam(value="list_num") Integer list_num){
		
		BookListCommand book = bookListService.select_num(list_num);
		Integer status = null; 
		String date = null;
		
		List<BookRentCommand> bookrentCommand = bookRentService.selectList(list_num);
		/*for(int i=0; i<bookrentCommand.size(); i++){
			if(bookrentCommand.get(i).getRent_status() == 0){
				date = bookrentCommand.get(i).getRent_returndate();
				date = date.substring(0, 10);
			}
		}*/
		
		if(status == bookRentService.recentStatus(list_num)){
			if(log.isDebugEnabled()){
				log.debug("status : " + status);
				status = 9;
			}
		}else{
			status = bookRentService.recentStatus(list_num);
		}
		
		session.setAttribute("list_title", list_title);
		session.setAttribute("list_num", list_num);
		session.setAttribute("list_filename", list_filename);

		book.setRent_status(status);
		
		if(log.isDebugEnabled()){
			log.debug("list_title : " + list_title);
			log.debug("list_filename : " + list_filename);
			log.debug("list_num : " + list_num);
			log.debug("book : " + book.getRent_status());
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bookDetail");
		mav.addObject("book", book);
		mav.addObject("date", date);
		
		return mav;
		
	}
}