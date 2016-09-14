package kr.spring.review.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.review.service.ReviewService;

@Controller
public class ReviewDeleteReplyController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private ReviewService reviewSerview;

	@RequestMapping("/board/deleteReplyAjax.do")
	@ResponseBody
	public Map<String, String> process(@RequestParam("review_re_num") int review_re_num,
									   @RequestParam("mem_id")String mem_id,HttpSession session){

		if(log.isDebugEnabled()){
			log.debug("review_re_num : " +review_re_num);
			log.debug("mem_id : " +mem_id);
		}

		Map<String, String> map = new HashMap<String, String>();

		try{
			String userId = (String)session.getAttribute("userId");
			if(userId == null){
				map.put("result","logout");				
			}else if(userId!=null && userId.equals(mem_id)){
				//��� ����
				reviewSerview.deleteReply(review_re_num);
				map.put("result" , "success");
			}else{
				map.put("result","wrongAcess");
			}
		}catch (Exception e){
			e.printStackTrace();
			map.put("result","failure");
		}	
		return map;
	}
}