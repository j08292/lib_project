package kr.spring.review.controller;

import java.io.File;

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

import kr.spring.review.domain.ReviewCommand;
import kr.spring.review.service.ReviewService;
import kr.spring.util.FileUtil;

@Controller
@SessionAttributes("command")
public class ReviewUpdateController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private ReviewService reviewService;

	@RequestMapping(value="/board/update.do", method=RequestMethod.GET)
	public String form(@RequestParam("review_num") int review_num, Model model){

		ReviewCommand reviewCommand = reviewService.selectReview(review_num);
		model.addAttribute("command", reviewCommand);

		return "reviewModify";
	}
	
	@RequestMapping(value="/board/update.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute("command")@Valid ReviewCommand reviewCommand,BindingResult result,
						SessionStatus status,HttpSession session) throws Exception{
		if(log.isDebugEnabled()){
			log.debug("reviewCommand : "+ reviewCommand);
		}
		String userId =(String)session.getAttribute("userId");
		if(!userId.equals(reviewCommand.getMem_id())){
			throw new Exception("�α����� ���̵�� �ۼ��� ���� �ƴϱ� ������ ������ �� �����ϴ�.");
		}
		if(result.hasErrors()){
			return "reviewModify";
		}

		ReviewCommand review= reviewService.selectReview(reviewCommand.getReview_num());
		String oldFileName="";

		//���� ���ϸ��� ����
		//���ε�Ǵ� ������ ���� ��� ���� ������ ���� ���ο� ���ϸ� ����
		//���ε�Ǵ� ������ ���� ��� ���� ���ϸ��� ����
		oldFileName =review.getReview_file();

		if(!reviewCommand.getUpload().isEmpty()){
			reviewCommand.setReview_file(FileUtil.rename(
					reviewCommand.getUpload().getOriginalFilename()));
		}else{
			reviewCommand.setReview_file(oldFileName);
		}
		
		//�ۼ���
		reviewService.update(reviewCommand);
		status.setComplete();

		if(!reviewCommand.getUpload().isEmpty()){
			File file = new File(FileUtil.UPLOAD_PATH + "/" +reviewCommand.getReview_file());
			reviewCommand.getUpload().transferTo(file);

			if(oldFileName!= null){
				FileUtil.removeFile(oldFileName);
			}
		}
		return "redirect:/board/list.do";
	}
}