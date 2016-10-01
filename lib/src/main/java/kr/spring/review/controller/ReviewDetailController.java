package kr.spring.review.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import kr.spring.review.domain.ReviewCommand;
import kr.spring.review.domain.ReviewLikeCommand;
import kr.spring.review.service.ReviewService;
import kr.spring.util.FileUtil;
import kr.spring.util.StringUtil;

@Controller
public class ReviewDetailController {

	private Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource
	private ReviewService reviewService;
	
	@RequestMapping("/board/detail.do")
	public ModelAndView process(@RequestParam("review_num") int review_num,HttpSession session){
		
		if(log.isDebugEnabled()){
			log.debug("review_num : " + review_num);
		}
		
		//�ش� ���� ��ȸ�� ����
		reviewService.updateHit(review_num);
		ReviewCommand review = reviewService.selectReview(review_num);
		
		//Ÿ��Ʋ �±� ����
		review.setReview_title(StringUtil.useNoHtml(review.getReview_title()));
		
		//�ٹٲ�ó��
		review.setReview_content(StringUtil.useBrNoHtml(review.getReview_content()));
		
		
		String userId = (String)session.getAttribute("userId");
		ReviewLikeCommand reviewLike = new ReviewLikeCommand();
		reviewLike.setReview_num(review_num);
		reviewLike.setReview_like_status(0);
		int reviewLikeCount = reviewService.getReviewLikeCount(reviewLike);//�� ���� ���ƿ��
		
		ReviewLikeCommand reviewUnlike = new ReviewLikeCommand();
		reviewUnlike.setReview_num(review_num);
		reviewUnlike.setReview_like_status(1);
		int reviewUnlikeCount = reviewService.getReviewLikeCount(reviewUnlike);//�� ���� �Ⱦ���
		
		if(userId==null){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("reviewView");
			mav.addObject("review",review);
			mav.addObject("reviewLikeCount",reviewLikeCount);
			mav.addObject("reviewUnlikeCount",reviewUnlikeCount);
			return mav;
		}else{
			ReviewLikeCommand reviewAllLike = new ReviewLikeCommand();
			reviewAllLike.setMem_id(userId);
			reviewAllLike.setReview_num(review_num);
			int checkCount = reviewService.checkReviewLike(reviewAllLike);//�α��� ȸ���� ���ƿ� �Ⱦ�� �ߴ��� ���ߴ��� üũ
			if(checkCount>0){//���ƿ� Ȥ�� �Ⱦ�� ���� ���
				int likeOrUnlike = reviewService.getWhatDidYouCheck(reviewAllLike);
				ModelAndView mav = new ModelAndView();
				mav.setViewName("reviewView");
				mav.addObject("review",review);
				mav.addObject("reviewLikeCount",reviewLikeCount);
				mav.addObject("reviewUnlikeCount",reviewUnlikeCount);
				mav.addObject("checkCount",checkCount);
				mav.addObject("likeOrUnlike",likeOrUnlike);
				return mav;
			}else{//���ƿ� Ȥ�� �Ⱦ�� ������ ���
				ModelAndView mav = new ModelAndView();
				mav.setViewName("reviewView");
				mav.addObject("review",review);
				mav.addObject("reviewLikeCount",reviewLikeCount);
				mav.addObject("reviewUnlikeCount",reviewUnlikeCount);
				mav.addObject("checkCount",checkCount);
				return mav;
			}
		}
	}
	
	//���� �ٿ�ε�
	@RequestMapping("/board/file.do")
	public ModelAndView download(@RequestParam("review_file")
									String review_file)throws Exception{					
		File downloadFile= new File(FileUtil.UPLOAD_PATH + "/" +review_file);
		
		
		return new ModelAndView("downloadView","downloadFile",downloadFile);
	}
	
	
	
}

