package kr.admin.bookrent.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.bookrent.domain.BookrentCommand;
import kr.spring.bookrent.service.BookrentService;
import kr.spring.util.PagingUtil;

@Controller
public class AdminBookrentListController {
private Logger log= Logger.getLogger(this.getClass());
	
	private int rowCount=10;
	private int pageCount=10;
	
	@Resource
	private BookrentService bookrentService;
	
	@RequestMapping("/admin/bookrent/list.do")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1")int currentPage,
								@RequestParam(value="keyfield",defaultValue="")String keyfield,
								@RequestParam(value="keyword",defaultValue="")String keyword){
		
		if(log.isDebugEnabled()){
			log.debug("currentPage : "+currentPage);
			log.debug("keyfield : "+keyfield);
			log.debug("keyword : "+keyword);
		}
		
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//�� ���� ���� �Ǵ� �˻��� ���� ����
		int count= bookrentService.getRowCount(map);
		
		PagingUtil page= new PagingUtil(keyfield,keyword,currentPage,count, rowCount,pageCount,"/admin/bookrent/list.do");
		
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<BookrentCommand> list= null;
		if(count>0){
			list= bookrentService.list(map);
		}else{
			list= Collections.emptyList();
		}
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("adminBookrentList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());
		return mav;
	}
}