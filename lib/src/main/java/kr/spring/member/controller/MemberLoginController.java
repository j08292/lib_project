package kr.spring.member.controller;

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

import kr.spring.member.domain.MemberCommand;
import kr.spring.member.service.MemberService;
import kr.spring.penalty.domain.PenaltyCommand;

@Controller
public class MemberLoginController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private MemberService memberService;

	//Ŀ�ǵ� ��ü(�ڹٺ�) �ʱ�ȭ
	@ModelAttribute("command")
	public MemberCommand initCommand(){
		return new MemberCommand();
	}

	@RequestMapping(value="/member/login.do",method=RequestMethod.GET)
	public String form(){
		return "memberLogin";
	}

	@RequestMapping(value="/member/login.do",method=RequestMethod.POST)
	public String submit(@ModelAttribute("command")
	@Valid MemberCommand memberCommand,
	BindingResult result,
	HttpSession session, Model model){

		if(log.isDebugEnabled()){
			log.debug("memberCommand : " + memberCommand);
		}
		//��ȿ�� üũ
		if(result.hasFieldErrors("mem_id") || 
				result.hasFieldErrors("mem_passwd")){
			return form();
		}
		//�α��� üũ
		try{
			MemberCommand member = 
					memberService.selectMember(memberCommand.getMem_id());
			boolean check = false;

			if(member!=null){
				check = member.isCheckedPasswd(memberCommand.getMem_passwd());
			}
			if(check){
				if(memberService.checkBlock(memberCommand.getMem_id()) > 0){//����ȸ�� �α��� �õ� -> �α��� ����
					PenaltyCommand penalty = memberService.selectBlockMember(memberCommand.getMem_id());
					if(log.isDebugEnabled()){
						log.debug("penalty : " + penalty);
					}
					model.addAttribute("reason", "���ܻ��� : "+penalty.getPenalty_reason());
					model.addAttribute("blockcanceldate", "���� ������ : "+penalty.getBlockcanceldate());

					result.reject("blockMemberId");

					return form();
				}else{
					//���� ����, �α��� ó��
					session.setAttribute("userId", memberCommand.getMem_id());
					session.setAttribute("mem_level", member.getMem_level());

					return "redirect:/main/main.do";
				}
			}else{
				//���� ����
				throw new Exception();
			}
		}catch(Exception e){
			//���� ���з� �� ȣ��
			result.reject("invalidIdOrPassword");
			return form();
		}
	}
}