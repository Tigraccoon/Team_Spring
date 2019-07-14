package com.sky.springteam.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.sky.springteam.model.board.dao.BoardDAO;
import com.sky.springteam.model.board.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO boardDao;
	
	@Override
	public List<BoardDTO> b_list(String b_category, String keyword, int begin, int end) {
		
		return boardDao.b_list(b_category, keyword, begin, end);
	}

	@Override
	public BoardDTO b_view(int b_num, HttpSession session) {
		long update_time = 0;
		if(session.getAttribute("update_time_" + b_num) != null) {
			update_time = (long)session.getAttribute("update_time_" + b_num); 
		}
		
		long current_time = System.currentTimeMillis();
		if(current_time - update_time >= 5 * 1000) {
			boardDao.b_upcount(b_num);
			session.setAttribute("update_time_" + b_num, current_time);
		}
		
		return boardDao.b_view(b_num);
	}

	@Override
	public int b_insert(BoardDTO dto) {
		
		return boardDao.b_insert(dto);
	}

	@Override
	public void b_update(BoardDTO dto) {
		
		boardDao.b_update(dto);
	}

	@Override
	public void b_delete(int b_num) {
		
		boardDao.b_delete(b_num);
	}

	@Override
	public int b_count(String b_category, String keyword) {
		
		return boardDao.b_count(b_category, keyword);
	}

	@Override
	public int c_count(int b_num) {
		
		return boardDao.c_count(b_num);
	}

}
