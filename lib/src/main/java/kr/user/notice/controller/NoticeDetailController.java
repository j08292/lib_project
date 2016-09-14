package kr.user.notice.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.notice.domain.NoticeCommand;
import kr.spring.notice.service.NoticeService;
import kr.spring.util.StringUtil;

@Controller
public class NoticeDetailController {
	private Logger log= Logger.getLogger(this.getClass());

	@Resource
	private NoticeService noticeService;

	@RequestMapping("/notice/detail.do")
	public ModelAndView process(@RequestParam("notice_num")int notice_num){

		if(log.isDebugEnabled()){
			log.debug("notice_num : "+notice_num);
		}

		//�ش� ���� ��ȸ�� ����
		noticeService.updateHit(notice_num);
		NoticeCommand notice = noticeService.selectNotice(notice_num);

		//Ÿ��Ʋ �±� ����
		notice.setNotice_title(StringUtil.useNoHtml(notice.getNotice_title()));

		//�ٹٲ�ó��
		notice.setNotice_content(StringUtil.useBrNoHtml(notice.getNotice_content()));

		return new ModelAndView("noticeView","notice",notice);
	}	
}