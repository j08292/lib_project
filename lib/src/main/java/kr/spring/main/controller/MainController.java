package kr.spring.main.controller;

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

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.main.service.MainService;

@Controller
@SessionAttributes("command")
public class MainController {
   private Logger log = Logger.getLogger(this.getClass());
      
   @Resource
   private MainService mainService;
   
   @RequestMapping("/main/main.do")
   public ModelAndView form(HttpSession session,Model model){
      
      int memberCount = mainService.getMemberCount();//ȸ����
      int bookCount = mainService.getBookCount();//���� å�Ǽ�
      int speechCount = mainService.getSpeechCount();//���� �������� ������
      
    //���� - �ֽ� �԰� ���� ���
	int newBookCount = mainService.getNewBookCount();
	List<AdminBooklistCommand> mainNewBooklist = null;
	if(newBookCount>0){
		mainNewBooklist = mainService.mainNewBooklist();
	}else{
		mainNewBooklist = Collections.emptyList();
	}
	
	//���� - �ϴ� �α⵵�� ���
	int mainBookCount = mainService.getMainBookCount();
	List<AdminBooklistCommand> mainBooklist = null;
	if(mainBookCount>0){
		mainBooklist = mainService.mainBooklist();
	}else{
		mainBooklist = Collections.emptyList();
	}
	
	if(log.isDebugEnabled()){
		log.debug("memberCount : " + memberCount);
		log.debug("bookCount : " + bookCount);
		log.debug("speechCount : " + speechCount);
		log.debug("newBookCount : " + newBookCount);
		log.debug("mainNewBooklist : " + mainNewBooklist);
		log.debug("mainBookCount : " + mainBookCount);
		log.debug("mainBooklist : " + mainBooklist);
	}
      
      ModelAndView mav = new ModelAndView();
      mav.setViewName("main");
      session.setAttribute("memberCount",memberCount);
      session.setAttribute("bookCount",bookCount);
      session.setAttribute("speechCount",speechCount);
      mav.addObject("newBookCount",newBookCount);
      mav.addObject("mainNewBooklist",mainNewBooklist);
      mav.addObject("mainBookCount",mainBookCount);
      mav.addObject("mainBooklist",mainBooklist);
		
      return mav;
   }
}