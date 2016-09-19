package kr.admin.marathon.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.marathon.domain.MarathonCommand;
import kr.spring.marathon.service.MarathonService;

@Controller
public class MarathonStatusUpdateController {
	private Logger log = Logger.getLogger(this.getClass());
	
	private MarathonService marathonService;
	
	@RequestMapping("/admin/marathon/updateStatus.do")
	public String submit(@RequestParam("marathon_num") int marathon_num,
						 @RequestParam("marathon_status") int marathon_status){
		if(log.isDebugEnabled()){
			log.debug("marathon_num : " + marathon_num);
			log.debug("marathon_status : " + marathon_status);
		}
		
		MarathonCommand marathon = new MarathonCommand();
		marathon.setMarathon_num(marathon_num);
		marathon.setMarathon_status(marathon_status);
		
		marathonService.updateStatus(marathon);
		
		return "redirect:/admin/marathon/list.do";
		
	}
}
