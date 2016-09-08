package kr.user.marathon.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.marathon.service.MarathonService;
import kr.spring.member.service.MemberService;

@Controller
public class MarathonApplyController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MarathonService marathonService;
	
	@RequestMapping("/event/applyMarathon.do")
	public String process(HttpSession session) throws Exception{
		String userId = (String)session.getAttribute("userId");
		
		if(userId == null){
			return "memberLogin";
		}else{
			marathonService.updateMrtStatus(userId);
			return "redirect:/event/myMarathon.do";
		}
		
	}
}
