package kr.spring.admin.controller;

import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.admin.service.AdminService;
import kr.spring.penalty.domain.PenaltyCommand;


@Controller
@SessionAttributes("command")
public class AdminMainController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private AdminService adminService;
	
	@RequestMapping("/admin/main.do")
	public ModelAndView form(HttpSession session,Model model){
		String userId = (String)session.getAttribute("userId");
		session.setAttribute("userId", userId);
		int mem_level = (Integer)session.getAttribute("mem_level");
		session.setAttribute("mem_level",mem_level);
		if(log.isDebugEnabled()){
			log.debug("userId : " + userId);
			log.debug("mem_level : " + mem_level);
		}
		
		int speechReserveCount = adminService.getSpeechReserveCount();
		int marathonCount = adminService.getMarathonCount();
		int wishlistCount = adminService.getWishlistCount();
		int rentWaitingCount = adminService.getRentWaitingCount();
		int qnaWaitingCount = adminService.getQnaWaitingCount();
		
		int penaltyRowCount = adminService.getRowPenaltyCount();
		
		List<PenaltyCommand> penaltyList = null;
		if(penaltyRowCount>0){
			penaltyList = adminService.penaltyList();
		}else{
			penaltyList = Collections.emptyList();
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminMain");
		mav.addObject("speechReserveCount",speechReserveCount);
		mav.addObject("marathonCount",marathonCount);
		mav.addObject("wishlistCount",wishlistCount);
		mav.addObject("rentWaitingCount",rentWaitingCount);
		mav.addObject("qnaWaitingCount",qnaWaitingCount);
		mav.addObject("penaltyRowCount",penaltyRowCount);
		mav.addObject("penaltyList",penaltyList);
		
		return mav;
	}
}
