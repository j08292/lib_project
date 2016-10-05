package kr.admin.qna.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.qna.domain.QnaReplyCommand;
import kr.spring.qna.service.QnaService;

@Controller
public class AdminQnaReplyUpdateController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private QnaService qnaservice;
	
	
	
	@RequestMapping("/admin/qna/qnaUpdateReplyAjax.do")
	@ResponseBody
	public Map<String, Object> process(
						QnaReplyCommand qnaReplyCommand,
						HttpSession session){
		
		
		if(log.isDebugEnabled()){
			log.debug("qnaReplyCommand : " + qnaReplyCommand);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		try{
				qnaservice.updateReply(qnaReplyCommand);
				map.put("result", "success");
		}catch(Exception e){
			e.printStackTrace();
			map.put("result","failure");
		
		
	}
	return map;
}
}
