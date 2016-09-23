package kr.admin.qna.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.qna.domain.QnaCommand;
import kr.spring.qna.service.QnaService;
import kr.spring.util.StringUtil;

@Controller
public class AdminQnaDetailController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private QnaService qnaService;
	
	@RequestMapping("/admin/qna/detail.do")
	public ModelAndView process(@RequestParam("qna_num")int qna_num){
		if(log.isDebugEnabled()){
			log.debug("qna_num : " + qna_num);
		}
		
		QnaCommand qnaCommand = qnaService.selectQna(qna_num);
		
		//Ÿ��Ʋ �±� ����
		qnaCommand.setQna_title(StringUtil.useNoHtml(qnaCommand.getQna_title()));
		
		//�ٹٲ�ó��
		qnaCommand.setQna_content(StringUtil.useBrNoHtml(qnaCommand.getQna_content()));
		
		
		return new ModelAndView("adminQnaDetail" , "qnaCommand", qnaCommand);
	}
}
