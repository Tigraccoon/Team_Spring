package com.sky.springteam.controller.board;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sky.springteam.model.board.dto.BoardDTO;
import com.sky.springteam.service.board.BoardService;
import com.sky.springteam.service.board.Pager;

@RestController
@RequestMapping("board/*")
public class BoardController {

	@Inject
	BoardService boardService;
	
	@RequestMapping("boardlist.do")
	public ModelAndView list(@RequestParam(defaultValue="1") int curPage,
							@RequestParam(defaultValue="") String b_category,
							@RequestParam(defaultValue="") String keyword,
							ModelAndView mav){
		
		if(keyword.equals("''")) {
			keyword = "";
			
		} else {
			try {
				keyword = URLDecoder.decode(keyword, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("\r비카테고리\r"+b_category+"\r");
		if(b_category.equals("") || b_category.equals("%")) {
			b_category = "%";
		
		} else {
			try {
				b_category = URLDecoder.decode(b_category, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		//레코드 갯수 계산
		int b_count = boardService.b_count(b_category, "%"+keyword+"%");
		//페이지 관련 설정
		Pager pager = new Pager(b_count, curPage);
		int begin = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		List<BoardDTO> b_list = boardService.b_list(b_category, "%"+keyword+"%", begin, end);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("b_list", b_list);
		map.put("count", b_count);
		map.put("pager", pager);
		map.put("keyword", keyword);
		map.put("b_category", b_category);
		
		mav.setViewName("board/boardlist");
		mav.addObject("map", map);
		
		return mav;
	}
	
}
