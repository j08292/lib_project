package kr.spring.admin.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes("command")
public class AdminMainController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping("/admin/main.do")
	public String form(HttpSession session,Model model){
		String userId = (String)session.getAttribute("userId");
		session.setAttribute("userId", userId);
		int mem_level = (Integer)session.getAttribute("mem_level");
		session.setAttribute("mem_level",mem_level);
		
		return "adminMain";
	}
}
