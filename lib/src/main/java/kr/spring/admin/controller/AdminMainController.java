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
import kr.spring.booklist.domain.AdminBooklistCommand;
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
		
		//���� - ������ üũ����
		int speechReserveCount = adminService.getSpeechReserveCount();
		int marathonCount = adminService.getMarathonCount();
		int wishlistCount = adminService.getWishlistCount();
		int rentWaitingCount = adminService.getRentWaitingCount();
		//���� - ����ȸ�� ����
		int penaltyRowCount = adminService.getRowPenaltyCount();
		
		List<PenaltyCommand> penaltyList = null;
		if(penaltyRowCount>0){
			penaltyList = adminService.penaltyList();
		}else{
			penaltyList = Collections.emptyList();
		}
		//���� - �α⵵�� ����
		List<AdminBooklistCommand> rentRankList = adminService.rentRankList();
		//3���� �뿩�� ��
		int bookRentCount_2= adminService.getBookRentCount_2();
		int bookRentCount_1= adminService.getBookRentCount_1();
		int bookRentCount_0= adminService.getBookRentCount_0();
		//3���� �뿩�� ��
		int wishlistCount_2= adminService.getWishlistCount_2();
		int wishlistCount_1= adminService.getWishlistCount_1();
		int wishlistCount_0= adminService.getWishlistCount_0();
		//3���� �뿩�� ��
		int booklistCount_2= adminService.getBooklistCount_2();
		int booklistCount_1= adminService.getBooklistCount_1();
		int booklistCount_0= adminService.getBooklistCount_0();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminMain");
		mav.addObject("speechReserveCount",speechReserveCount);
		mav.addObject("marathonCount",marathonCount);
		mav.addObject("wishlistCount",wishlistCount);
		mav.addObject("rentWaitingCount",rentWaitingCount);
		mav.addObject("penaltyRowCount",penaltyRowCount);
		mav.addObject("penaltyList",penaltyList);
		mav.addObject("rentRankList",rentRankList);
		mav.addObject("bookRentCount_2",bookRentCount_2);
		mav.addObject("bookRentCount_1",bookRentCount_1);
		mav.addObject("bookRentCount_0",bookRentCount_0);
		mav.addObject("wishlistCount_2",wishlistCount_2);
		mav.addObject("wishlistCount_1",wishlistCount_1);
		mav.addObject("wishlistCount_0",wishlistCount_0);
		mav.addObject("booklistCount_2",booklistCount_2);
		mav.addObject("booklistCount_1",booklistCount_1);
		mav.addObject("booklistCount_0",booklistCount_0);
		
		return mav;
	}
}