package kr.user.wishlist.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.util.PagingUtil;
import kr.spring.wishlist.domain.WishlistCommand;
import kr.spring.wishlist.service.WishlistService;

@Controller
public class MyWishlistController {
	private Logger log= Logger.getLogger(this.getClass());

	private int rowCount=10;
	private int pageCount=10;

	@Resource
	private WishlistService wishlistService;
	
	@RequestMapping("/wishlist/list.do")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1")int currentPage,
								HttpServletRequest request, HttpSession session){
		
		String mem_id = (String)session.getAttribute("userId");
		String status = request.getParameter("wish_status");
		int wish_status;
		
		if(status == null){
			wish_status = 9;
		}else{
			wish_status = Integer.parseInt(status);
		}
		
		if(log.isDebugEnabled()){
			log.debug("currentPage : " + currentPage);			
			log.debug("mem_id : " + mem_id);
			log.debug("wish_status" + wish_status);
		}
		
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("wish_status", wish_status);		
		
		//ÃÑ ±ÛÀÇ °¹¼ö ¶Ç´Â °Ë»öµÈ ±ÛÀÇ °¹¼ö
		int count= wishlistService.getMyWishlistCount(map);		
		
		PagingUtil page = new PagingUtil(null,null,currentPage,count,rowCount,pageCount,"list.do");

		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());

		List<WishlistCommand> myWishlist= null;
		if(count>0){
			myWishlist= wishlistService.myWishlist(map);			
		}else{
			myWishlist= Collections.emptyList();
		}
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("myWishlist");
		mav.addObject("count", count);
		mav.addObject("list", myWishlist);
		mav.addObject("pagingHtml", page.getPagingHtml());
		return mav;
	}
}