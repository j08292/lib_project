package kr.admin.booklist.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.spring.booklist.domain.BooklistCommand;
import kr.spring.booklist.service.BooklistService;

@Controller
@SessionAttributes("command")
public class BooklistUpdateStatusController {
	private Logger log= Logger.getLogger(this.getClass());
	
	@Resource
	private BooklistService booklistService;
	
	@RequestMapping(value="/admin/booklist/updateStatus.do",method=RequestMethod.GET)
	public String form(@RequestParam("list_num")int list_num, Model model){

		BooklistCommand booklistCommand = booklistService.selectBooklist(list_num);
		model.addAttribute("command", booklistCommand);

		return "booklistUpdate";
	}
	
	@RequestMapping(value="/admin/booklist/updateStatus.do",method=RequestMethod.POST)
	public String submit(@ModelAttribute("command")@Valid BooklistCommand booklistCommand,
			BindingResult result,SessionStatus status,HttpSession session) throws Exception{
		
		if(log.isDebugEnabled()){
			log.debug("booklistCommand : "+booklistCommand);
		}

		if(result.hasErrors()){
			return "booklistUpdate";
		}
				
		//대출정지
		booklistService.updateStatusChange(booklistCommand.getList_num());		
		
		return "redirect:/admin/booklist/list.do";
	}
}