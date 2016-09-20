package kr.spring.member.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.member.domain.MemberCommand;
import kr.spring.member.service.MemberService;

@Controller
public class MemberWriteController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource
	private MemberService memberService;

	// Ŀ�ǵ� ��ü �ʱ�ȭ
	@ModelAttribute("command")
	public MemberCommand initCommand() {
		return new MemberCommand();
	}

	@RequestMapping(value = "/member/write.do", method = RequestMethod.GET)
	public String form() {
		return "memberWrite";
	}

	@RequestMapping(value = "/member/write.do", method = RequestMethod.POST)
	public String submit(@ModelAttribute("command") @Valid MemberCommand memberCommand, BindingResult result) {

		if (log.isDebugEnabled()) {
			log.debug("memberCommand : " + memberCommand);
		}
		// ��ȿ�� üũ
		if (result.hasErrors()) {
			return form();
		}
		
		memberService.insert(memberCommand);
		
		return "redirect:/main/main.do";
	}
}
