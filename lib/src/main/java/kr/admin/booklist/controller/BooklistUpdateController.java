package kr.admin.booklist.controller;

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

import kr.spring.booklist.domain.AdminBooklistCommand;
import kr.spring.booklist.service.AdminBooklistService;
import kr.spring.util.FileUtil;

@Controller
@SessionAttributes("command")
public class BooklistUpdateController {
	private Logger log= Logger.getLogger(this.getClass());

	@Resource
	private AdminBooklistService booklistService;

	@RequestMapping(value="/admin/booklist/update.do",method=RequestMethod.GET)
	public String form(@RequestParam("list_num")int list_num, Model model){

		AdminBooklistCommand boooklistCommand = booklistService.selectBooklist(list_num);
		model.addAttribute("command", boooklistCommand);

		return "booklistUpdate";
	}

	@RequestMapping(value="/admin/booklist/update.do",method=RequestMethod.POST)
	public String submit(@ModelAttribute("command")@Valid AdminBooklistCommand booklistCommand,
			BindingResult result,SessionStatus status,HttpSession session) throws Exception{

		if(log.isDebugEnabled()){
			log.debug("booklistCommand : "+booklistCommand);
		}

		if(result.hasErrors()){
			return "booklistUpdate";
		}

		AdminBooklistCommand booklist= booklistService.selectBooklist(booklistCommand.getList_num());
		String oldFileName="";

		//���� ���ϸ��� ���� -> ���ε�Ǵ� ������ ���� ��� ���������� ������ �� ���ο� ���ϸ��� ������ 
		//			   -> ���ε�Ǵ� ������ ���� ��� ���� ���ϸ��� ������		
		oldFileName= booklist.getList_filename();

		if(!booklistCommand.getUpload().isEmpty()){//���۵� ������ ���� ���
			booklistCommand.setList_filename(FileUtil.rename(booklistCommand.getUpload().getOriginalFilename()));			
		}else{//���۵� ������ ���� ���
			booklistCommand.setList_filename(oldFileName);			
		}

		//�� ����
		booklistService.update(booklistCommand);
		status.setComplete();

		if(!booklistCommand.getUpload().isEmpty()){//���۵� ������ ���� ���
			File file= new File(FileUtil.UPLOAD_PATH+"/"+booklistCommand.getList_filename());
			booklistCommand.getUpload().transferTo(file);

			if(oldFileName!=null){//���� ������ ����
				FileUtil.removeFile(oldFileName);
			}
		}				

		return "redirect:/admin/booklist/list.do";
	}
}