package com.sky.springteam.controller.board;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sky.springteam.model.board.dto.BoardDTO;
import com.sky.springteam.model.board.dto.CommentDTO;
import com.sky.springteam.service.board.BoardService;
import com.sky.springteam.service.board.CommentService;
import com.sky.springteam.service.board.Pager;

@Controller
@RequestMapping("board/*")
public class BoardController {

	@Inject
	BoardService boardService;
	@Inject
	CommentService commentService;
	
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
	
	@RequestMapping("boardwrite.go")
	public String boardwritego() {
		return "board/boardwrite";
	}
	
	@RequestMapping("boardwrite.do")
	public String boardwritedo(@ModelAttribute BoardDTO dto, HttpServletRequest request) {
		
		dto.setB_ip(request.getRemoteAddr());
		
		if(dto.getB_secret() == null) {
			dto.setB_secret("N");
		}
		
		int b_num = boardService.b_insert(dto);
		
		return "redirect:/board/boardview.go?b_num="+b_num;
	}
	
	@RequestMapping("boardview.go")
	public ModelAndView boardviewgo(@RequestParam int b_num, ModelAndView mav, HttpSession session) {
		
		mav.setViewName("board/boardview");
		mav.addObject("var", boardService.b_view(b_num, session));
		
		int c_count = boardService.c_count(b_num);
		mav.addObject("c_count", c_count);
		
		if(c_count > 0) {
			mav.addObject("war", commentService.c_list(b_num));
		}
		
		return mav;
	}
	
	@RequestMapping("boardupdate.do")
	public String boardupdatedo(@ModelAttribute BoardDTO dto, HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		dto.setB_ip(ip);
		
		if(dto.getB_secret() == null) {
			dto.setB_secret("N");
		}
		
		boardService.b_update(dto);
		
		return "redirect:/board/boardview.go?b_num="+dto.getB_num();
	}
	
	@RequestMapping("boarddelete.do")
	public String boarddeletedo(@ModelAttribute BoardDTO dto) {
		
		boardService.b_delete(dto.getB_num());
		
		return "redirect:/board/boardlist.do";
	}
	
	@RequestMapping("commentinsert.do")
	public String commentinsertdo(@ModelAttribute CommentDTO dto, HttpServletRequest request) {
		
		dto.setC_ip(request.getRemoteAddr());
		
		if(dto.getC_secret() == null) {
			dto.setC_secret("N");
		}
		
		commentService.c_insert(dto);
		
		return "redirect:/board/boardview.go?b_num="+dto.getB_num();
	}
	
	@RequestMapping("commentupdate.do")
	public String commentupdatedo(@ModelAttribute CommentDTO dto, HttpServletRequest request) {
		
		dto.setC_ip(request.getRemoteAddr());
		
		if(dto.getC_secret() == null) {
			dto.setC_secret("N");
		}
		
		commentService.c_update(dto);
		
		return "redirect:/board/boardview.go?b_num="+dto.getB_num();
	}
	
	@RequestMapping("commentdelete.do")
	public String commentdeletedo(@ModelAttribute CommentDTO dto) {
		
		boardService.b_delete(dto.getC_num());
		
		return "redirect:/board/boardview.go?b_num="+dto.getB_num();
	}
	
}
