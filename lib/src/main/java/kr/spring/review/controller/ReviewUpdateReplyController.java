package kr.spring.review.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.review.domain.ReviewReplyCommand;
import kr.spring.review.service.ReviewService;

@Controller
public class ReviewUpdateReplyController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private ReviewService reviewService;	

	@RequestMapping("/board/updateReplyAjax.do")
	@ResponseBody
	public Map<String,Object> process(ReviewReplyCommand reviewReplyCommand,HttpSession session){

		if(log.isDebugEnabled()){
			log.debug("reivewReplyCommand : " + reviewReplyCommand);
		}
		Map<String, Object> map = new HashMap<String, Object>();

		try{
			String userId = (String)session.getAttribute("userId");
			if(userId == null){//�α��� �ȵ�
				map.put("result", "logout");
			}else if(userId !=null && userId.equals(reviewReplyCommand.getMem_id())){
				//�α���, �ۼ��� ��ġ, ��� ���
				reviewService.updateReply(reviewReplyCommand);
				map.put("result","success");
			}else{
				map.put("result","worngAccess");
			}

		}catch(Exception e){
			e.printStackTrace();
			map.put("result","failure");
		}
		return map;
	}
}